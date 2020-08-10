use mysql;
-- 将docker_mysql数据库的权限授权给创建的docker用户，密码为123456：
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456'
-- 这一条命令一定要有：
flush privileges;

