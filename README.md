# HiveMind Deployment

This repository contains deployment code for deploying the HiveMind teamserver.

Supported deployment methods are described below.

## Docker

To Deploy the most basic deployment of the latest hivemind teamserver and webserver, simply run
```sh
sudo docker-compose up -d
```
This will spin up a teamserver, webserver, database, and reverse proxy server.
- The webserver can be found at https://localhost
- The teamserver API can be found on localhost:4321
- The teamserver will start a TCP listener on localhost:1234

This deployment of Project HiveMind is limitied in that authentication will only work from the localhost, and the TLS certificate will be self signed.

For more advanced docker deployment, see the [docker deployment](docker/README.md) guide.
