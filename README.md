This is a basic Next.js app based on node:alpine linux docker image. It is a sample page to be used as a building block for my own experiments.

### Instructions for Getting Started

1. Build the "hello" base image

```shell
   docker build -t hello .
   docker container rm hello
   docker run --name hello -p 3003:3003 hello
```

2.  Login to your container registry
    Let's login to your container registry. You can get the login URI and credentials from Access keys blade.

```shell
    docker login jojicr.azurecr.io
```

3.  Push to your registry
    Let's first prefix the image with your registry login URI so that it can be pushed to your private registry.
    The first command tags the image for uploading to your registry and the second pushes the image.

```shell
    docker tag hello jojicr.azurecr.io/hello
    docker push jojicr.azurecr.io/hello
```

4.  Pull from your registry
    Let's try to pull the image from your registry. You should find that your image is up to date.

```shell
    docker pull jojicr.azurecr.io/hello
```

And you're ready!
You now have a working Azure Container Registry for your applications!
