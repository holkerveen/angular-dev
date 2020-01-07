# angular-dev

This aims to be a complete angular development environment in a single container.

## Creating a new project using the container

```shell script
docker run --rm -it \
  -u `id -u` \
  -v `pwd`:/app \
  holkerveen/angular-dev ng new your-angular-app
```

When you run the command above, a fresh angular project will be created in the `your-angular-app` directory.

The `-u` option makes your container run its process with your uid. This switch is recommended so that any files created
are owned by the current user (you).

We mount the current working directory under `/app` with the `-v` command line option. This is where our container expects your sources to be.

## Running an existing project

```shell script
cd your-angular-app &&
docker run --rm -it \
  --init \
  -u `id -u` \
  -v `pwd`:/app \
  -p 4200:4200 \
  holkerveen/angular-dev ng serve --host 0.0.0.0
```

There are a few notable changes to the installation command:

The `--init` flat enables an `init` system for containers. This ensures system signals are properly forwarded to the foreground process. In short, this enables stopping the server with `Ctrl-C` will work as usual.

Angular serves its development at port 4200 by default, so we expose that on our host with the `-p` option.

Angular-cli itself by default serves its ap on the local loopback interface (`localhost`). We add the --host option to serve the app to the container's external interface.

