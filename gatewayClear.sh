#!/bin/sh
docker-compose -p docker-apisix down
rm apisix_log/* -rf
rm etcd_conf/* -rf
rm mysql_data/* -rf



docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix:latest
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix-dashboard:latest
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix-manager:latest
docker rmi mysql:latest
docker rmi grafana/grafana:latest
docker rmi prom/prometheus:latest
docker rmi bitnami/etcd:3.4.9
docker rmi ruby:2-alpine
docker images