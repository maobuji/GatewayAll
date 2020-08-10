#!/bin/sh
echo "docker rmi $imageID 删除镜像"
echo "docker inspect $ContainerID 查看容器详细信息"
echo "docker logs $ContainerID 查看容器详细信息"
echo "docker network ls 查看docker网络信息"
echo "docker network rm $networkName  删除网络配置"

