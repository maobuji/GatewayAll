#!/bin/bash
Gateway_HOME=`pwd`;
eval $(ps -ef | grep "[0-9] python -m SimpleHTTPServer" | awk '{print "kill "$2}')

cd _index
nohup python -m SimpleHTTPServer 9999 &
cd $Gateway_HOME