#!/bin/sh
./gatewayStop.sh
rm apisix_log/* -rf
rm etcd_conf/* -rf
rm mysql_data/* -rf