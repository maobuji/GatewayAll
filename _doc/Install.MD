# 环境安装

### 关闭防火墙
```
关闭防火墙，如果不关闭则，从容器访问宿主机时会出现No route to host错误。
systemctl stop firewalld.service

禁止firewall开机启动
systemctl disable firewalld.service 
```

### 更换阿里源 
```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
```
### 安装docker
```
# 安装
yum -y install docker
docker -v
# 启动
systemctl start docker.service
# 设置为开机自启动
systemctl enable docker.service

# 更换为阿里源
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://du8c1in9.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# 配置dns

#查看Network Manager服务状态
systemctl status  NetworkManager

#停止Network Manager服务
systemctl stop  NetworkManager

#关闭Network Manager开机启动
systemctl disable  NetworkManager

# 添加dns
vi /etc/sysconfig/network-scripts/ifcfg-eth0
PEERDNS=no

vim /etc/resolv.conf
nameserver 8.8.8.8
nameserver 114.114.114.114

systemctl restart network

# 登录阿里源
sudo docker login --username=16770864@qq.com registry.cn-shenzhen.aliyuncs.com
```

###安装docker-compose 

首先到https://github.com/docker/compose/releases获取当前最新版本
```
# 安装，1.23.2为要替换的版本
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 授权
sudo chmod +x /usr/local/bin/docker-compose
# 查看版本
docker-compose version
```