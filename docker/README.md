# Docker Deployment Guide

This document covers the different component containers of the Project HiveMind Teamserver docker deployment. 

## [Database](database)
The database used by the teamserver is configured in 2 different ways
- [databse.env](database/database.env): used for setting the username, password, and name for the teamserver database
- [init_db.sql](database/init_db.sql): used to populate the database with the hivemind shema and tables

When using docker-compose to deploy the docker deployment, the databse data will be stored in the hivmind-database-data directory.

## [Teamserver](teamserver)
The teamserver container builds and runs the teanserver go binary. Configuration options are set in the teamserver [config.yaml](teamserver/config/config.yaml) file.

If you have updated the database name, username, or password, those changes will need to be reflected in the teamserver config file.

The default username and password for the HiveMind teamserver are set in the teamserver config file.

If you would like to add more transports to the teamserver, this can be done in the teamserver config file, though in order for those to be accessible, ports will need to be exposed in the [docker-compose](../docker-compose.yaml) file.

If you would like to change the port the teamserver API listens, on this change the host port (host:container) in the [docker-compose](../docker-compose.yaml) file, as changing the port in the teamserver config file will simply break the docker-compose deployment.

## [Webserver](webserver)
The HiveMind webserver serves a frontend for interacting with the hivemind teamserver. Webserver configuration options are set in the [config.yaml](webserver/config/config.yaml) file.

To change which hostname to use for CORS purposes, set the webserver uri to your server's address.

Do not change the webserver port without good reason, it will break the docker-compose deployment.

Do not change the teamserver uri or port without a good reason, it will break the docker-compose deployment.

Docker-compose mounts the webserver's templates directory to the hivemind-webserver-templates in the webserver directory. If you would like to place custom files into your webserver instance's templates, you can place them here at any point before or during deployment of the webserver.

## [Proxy](proxy)
The proxy container hosts an nginx webserver which acts as a reverse http proxy for the webserver. Configuration for the proxy is done in the [proxy.conf](proxy/proxy.conf) file. It is a standard nginx http configuration file.

The proxy container will obtain a TLS certificate so serve its content with HTTPS. By default, this is done by generating a self signed certificate using the openssl utility. If a DOMAIN is specified in the [docker-compose](../docker-compose.yaml) file, the build process will attempt to obtain a certificate from letsencrypt. Currently this letsencrypt functionality is untested.
