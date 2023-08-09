<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Zitadel, verified and packaged by Elestio

A better community platform for the modern web.

[Zitadel](https://zitadel.com/) Zitadel is a cloud-native Identity & Access Management platform built for the cloud era.

<img src="https://github.com/elestio-examples/zitadel/raw/main/Zitadel.png" alt="zitadel" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/umami">fully managed Zitadel</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Zitadel gives developers all they need to integrate identity management. Easy as pie. Ready when you are — because serverless. At yours or ours — because of the open source.

[![deploy](https://github.com/elestio-examples/zitadel/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/zitadel)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/zitadel.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8080`

## Docker-compose

Here are some example snippets to help you get started creating a container.

                version: '3.3'
                services:
                zitadel:
                    restart: 'always'
                    image: 'elestio4test/zitadel:${SOFTWARE_VERSION_TAG}'
                    command: 'start-from-init --masterkey "MasterkeyNeedsToHave32Characters" --tlsMode disabled'
                    environment:
                    - ZITADEL_DATABASE_COCKROACH_HOST=${ZITADEL_DATABASE_COCKROACH_HOST}
                    - ZITADEL_EXTERNALSECURE=${ZITADEL_EXTERNALSECURE}
                    - ZITADEL_EXTERNALDOMAIN=${ZITADEL_EXTERNALDOMAIN}
                    - ZITADEL_EXTERNALPORT=${ZITADEL_EXTERNALPORT}
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_SMTP_HOST=${SMTP_HOST}:${SMTP_PORT}
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_SMTP_USER=
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_SMTP_PASSWORD=
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_TLS=false
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_FROM=${SMTP_FROM_EMAIL}
                    - ZITADEL_DEFAULTINSTANCE_SMTPCONFIGURATION_FROMNAME=Zitadel
                    depends_on:
                    - crdb
                    ports:
                    - '172.17.0.1:8586:8080'

                crdb:
                    restart: 'always'
                    image: 'cockroachdb/cockroach:${COCKROACH_VERSION_TAG}'
                    command: 'start-single-node --insecure'
                    ports:
                    - '172.17.0.1:9090:8080'
                    - '172.17.0.1:26257:26257'

### Environment variables

|            Variable             | Value (example) |
| :-----------------------------: | :-------------: |
|      SOFTWARE_VERSION_TAG       |     latest      |
| ZITADEL_DATABASE_COCKROACH_HOST |   cr-db-name    |
|     ZITADEL_EXTERNALSECURE      |      true       |
|     ZITADEL_EXTERNALDOMAIN      |   your-domain   |
|      ZITADEL_EXTERNALPORT       |       80        |
|            SMTP_HOST            |    your-host    |
|            SMTP_PORT            |       25        |
|         SMTP_FROM_EMAIL         |  test@mail.com  |
|      COCKROACH_VERSION_TAG      |     latest      |

# Maintenance

## Logging

The Elestio Zitadel Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://zitadel.com/docs">Zitadel documentation</a>

- <a target="_blank" href="https://github.com/zitadel/zitadel">Zitadel Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/zitadel">Elestio/Zitadel Github repository</a>
