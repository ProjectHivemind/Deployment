#!/bin/ash

cp -f /tmp/* /templates/
cp -f /templates/* /tmp/

server config/config.yaml
