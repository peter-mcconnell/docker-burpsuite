docker-burpsuite
================

BURP (free) running in lightweight container. This is an extremely lean 
image designed for extending, or running quick tests.

usage (running)
-----------------

You can run this image by running the following command:

```bash
docker run --rm -ti pemcconnell/docker-burpsuite:1.7.22-alpine --help
```

As the above should show, the entrypoint for this container is `burp`; passing in `--help` will essentially run `burp --help`.

usage (extending)
-----------------

To make use of the image defined in this repo, you can pull it from the 
docker hub using the following image, and add whatever else you like:

```Dockerfile
FROM pemcconnell/docker-burpsuite:1.7.22-alpine

RUN apk add --update \
      curl \
      ...
```

make
----

The following convenience commands are available:

deploy (and build)
------------------

```bash
make deploy
```

This command builds the docker image and pushes it to the `$IMAGE:TAG`. The 
default for `$IMAGE` and `$TAG` is set in the `./Makefile`. This can be passed in as 
optional arguments:

```bash
make deploy TAG=1.7.22-alpine IMAGE=dockerhubusername/foo
```

build only
----------

```bash
make build
```

run shell
---------

Sometimes it's useful to run a shell inside the container. To do so, you can 
run:

```bash
make sh
```