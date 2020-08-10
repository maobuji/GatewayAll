#!/bin/sh
chmod +x ./manager_conf/build.sh
chmod +x ./apisix_conf/apisix
docker-compose -p docker-apisix up -d