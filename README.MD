# PDS Admin for Docker
![Github Actions Status](https://github.com/cr0ssing/pdsadmin-docker/actions/workflows/build-and-push-ghcr.yaml/badge.svg) ![GitHub License](https://img.shields.io/github/license/cr0ssing/pdsadmin-docker) ![GitHub Release](https://img.shields.io/github/v/release/cr0ssing/pdsadmin-docker)


This repository provides a way to use the [Bluesky Personal Data Server](https://github.com/bluesky-social/pds) admin CLI fully dockerized. This makes it possible to use named volumes to store the application data used by pds and pdsadmin and isntall both by using a single docker compose file. This also makes it easier to sync the environment variables between both components.

## Usage
1. configure your `.env` file. You can copy the `example.env` file and fill in the \<placeholders>. Generate secret 1 and 2 with `openssl rand --hex 16` and secret 3 with `openssl ecparam --name secp256k1 --genkey --noout --outform DER | tail --bytes=+8 | head --bytes=32 | xxd --plain --cols 32` (from the PDS repo's install script)
2. (optional) if you're using a reverse proxy e.g. traefik adjust the labels of the `pds` service in the docker compose file.
3. use `docker compose up` to start the PDS and the PDS Admin CLI
4. you can now access the cli with `./pdsadmin.sh`. If you want you can put this script on your PATH to access it more seamlessly.

## License
This project is licensed under GPL 3.0.