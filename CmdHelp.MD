## docker 相关命令 

```shell script
删除镜像
docker rmi $imageID

查看容器详细信息
docker inspect $ContainerID

查看容器运行日志
docker logs $ContainerID

查看docker网络信息
docker network ls 

删除网络配置
docker network rm $networkName

进入容器命令行
docker exec -it $ContainerID bash

```


## 更换阿里源
```shell script
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
```
