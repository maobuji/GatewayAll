#!/bin/sh

eval $(ps -ef | grep "[0-9] python -m SimpleHTTPServer 9999" | awk '{print "kill "$2}')

docker-compose -p docker-gateway down