# Docker Image Optimization Example

Contains two `Dockerfiles` before and after optimization. Techniques are taken in the [optimized Dockerfile](./Dockerfile) that lead to almost a 400mb reduction in image size over the [pre-optimized Dockerfile](./Dockerfile-pre-optimization). 

## Optimizations described in Blog Post

A blog post was created that discusses the optimizations used:

[https://taylor.callsen.me/optimizing-docker-image-size/](https://taylor.callsen.me/optimizing-docker-image-size/)

## Build

Build the Docker image with the following command:

```
docker build . -t docker-opt-java-example:latest
```

## Explore with dive

The [dive](https://github.com/wagoodman/dive) tool is very helpful in reducing image size. Once installed, dive can be used to explore this image with the following command:

```
dive docker-opt-java-example:latest
```