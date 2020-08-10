use mysql;
-- 密码为mysqlpw_123456
-- 8.0的加密方式有变化，需要退回来
ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysqlpw_123456' PASSWORD EXPIRE NEVER;
ALTER USER 'root'@'%' IDENTIFIED BY 'mysqlpw_123456' PASSWORD EXPIRE NEVER;
alter user 'root'@'localhost' identified with mysql_native_password by 'mysqlpw_123456';
alter user 'root'@'%' identified with mysql_native_password by 'mysqlpw_123456';

-- 将docker_mysql数据库的权限授权给创建的docker用户，：
grant all on *.* to 'root'@'%';

-- 这一条命令一定要有：
flush privileges;

