## docker 相关命令 

```shell script
删除镜像
docker rmi $imageID

删除所有镜像
docker rmi $(docker images -q) -f

查看容器详细信息
docker inspect $ContainerID

查看容器运行日志
docker logs $ContainerID

查看docker网络信息
docker network ls 

删除网络配置
docker network rm $networkName



进入容器命令行
docker exec -it $ContainerID  bash
docker exec -it --user root $ContainerID bash

从容器中拷贝文件
docker cp $ContainerID:$sourceFilePath $targetFilePath
docker cp $sourceFilePath $ContainerID:$targetFilePath

启动一个不停止的镜像 
docker run -di --name=$tagname $imageID:version

将容器打包成容器
docker commit $ContainerID $imageID:version

```



