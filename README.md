# Container image with kubectl

This image is a slim debian base with `curl` and `kubectl`.

## How to consume?

### Pull from docker hub

I pushed this to [dockerhub](https://hub.docker.com/repository/docker/josefuentes/kubectl/general).

```
docker run -ti josefuentes/kubectl
```
### Build your own

If you want an specific version, you can build your own:

```
make docker-build VERSION=v1.19.0
```

The same command but with `docker-push` will push the image.

## This image vs alternatives?

I decided to build this one because I could not find another image available for multiple platforms.

I use this in my home k8s cluster, which has nodes of different architectures (amd64, rpis running 32bits raspbian and rpis running Ubuntu 64bits).
