#!/bin/sh
chmod +x ./manager_conf/build.sh
chmod +x ./apisix_conf/apisix
docker-compose -p docker-gateway up -d

Gateway_HOME=`pwd`;
eval $(ps -ef | grep "[0-9] python -m SimpleHTTPServer 9999" | awk '{print "kill "$2}')

cd _index
nohup python -m SimpleHTTPServer 9999 &
cd $Gateway_HOME