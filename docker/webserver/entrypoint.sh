#!/bin/ash

cp -rf /tmp/* /templates/
cp -rf /templates/* /tmp/

server config/config.yaml
