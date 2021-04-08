FROM debian:buster-slim
ARG KUBECTL_VERSION
# TARGETPLATFORM comes from the buildx context and it will be something like `linux/arm64/v8` or `linux/amd64`. Ref: https://docs.docker.com/buildx/working-with-buildx/
ARG TARGETPLATFORM

ENV PATH="/usr/bin:${PATH}"
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN  export arch=$(echo ${TARGETPLATFORM} | awk -F'/' '{print $2}') && \
    export url="https://dl.k8s.io/${KUBECTL_VERSION}/kubernetes-client-linux-${arch}.tar.gz" && \
    echo "Downloading ${url}" && \
    curl -L ${url} > /tmp/kubectl.tar.gz && \
    # kubectl is inside /kubernetes/client/bin in the archive, so we trim 3 elements in the path
    tar -xzvf /tmp/kubectl.tar.gz --strip-components=3 --directory /usr/bin && \
    rm /tmp/kubectl.tar.gz

ENTRYPOINT ["kubectl"]
