ARG ARCH=
ARG KUBECTL_VERSION=
ARG KUBECTL_ARCH=
FROM ${ARCH}debian:buster-slim

RUN curl -L https://dl.k8s.io/${KUBECTL_VERSION}/kubernetes-client-${KUBECTL_ARCH}.tar.gz > /tmp/kubectl.tar.gz && \
    # kubectl is inside /kubernetes/client/bin in the archive, so we trim 3 elements in the path
    tar -xzvf kubernetes-client-darwin-amd64.tar.gz --strip-components=3 --directory /usr/bin && \
    rm /tmp/kubectl.tar.gz

ENTRYPOINT ["kubectl"]
