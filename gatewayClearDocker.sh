#!/bin/sh
./gatewayClear.sh
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix:latest
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix-dashboard:latest
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/apisix-manager:latest
docker rmi registry.cn-shenzhen.aliyuncs.com/maobuji/logstash:latest
docker rmi wurstmeister/kafka:2.12-2.2.1
docker rmi zookeeper:3.5.5
docker rmi sheepkiller/kafka-manager:latest
docker rmi mysql:latest
docker rmi grafana/grafana:latest
docker rmi prom/prometheus:latest
docker rmi bitnami/etcd:3.4.9
docker rmi ruby:2-alpine
docker images