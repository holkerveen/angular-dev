# angular-dev

This aims to be a complete angular development environment in a single container.

## Prerequisites

You will need a reasonably recent docker installation. I have personally tested the instructions below on ubuntu 18.04 with a stock docker install, and on Docker Desktop for Mac. Should you be able to get it running somewhere else as well with some modifications: Pull requests are welcome! :-)

## Using `docker-compose`

In this example, will be using docker-compose in order to keep the commands needed as concise as possible. So, create a new directory for your project and create one in your newly created directory. Below is an example `docker-compose.yml` file:

```docker-compose
# your-new-app/docker-compose.yml
version: "3.4"
services:
  angular:
    container_name: angular
    image: holkerveen/angular-dev
    volumes:
      - ./:/app
    ports:
      - 4200:4200
    # Run the main process in the container as a non-root user.
    user: $UID
```

The `user` key might be handy because it will make sure ownership of all created files lies with yourself. It needs a `.env` file registering your user id though.

```dotenv
# Your UID may be different depending on your local setup
UID=1000
```

## Creating a new project using the container

```shell script
docker-compose run --rm angular ng new --skip-git --directory . your-new-app
```

When you run the command above, a fresh angular project will be created in the `your-new-app` directory. We are skipping the git install because our container will not have a proper git configuration. The `--directory` sets the install dir to the current directory.

## Running your project

Now that our project has been created, we can run the development server:

```shell script
docker-compose up
```

Open your browser at http://localhost:4200 to confirm everyting is working.
