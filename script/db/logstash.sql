-- this is a db script for init
CREATE DATABASE `logstash`;
use `logstash`;

DROP TABLE IF EXISTS `t_nginxlog`;
CREATE TABLE `t_nginxlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stand_time` timestamp NULL DEFAULT NULL,
  `access_time` timestamp NULL DEFAULT NULL,
  `remote_addr` varchar(50) DEFAULT NULL,
  `remote_user` varchar(50) DEFAULT NULL,
  `adt_host` varchar(50) DEFAULT NULL,
  `request` varchar(500) DEFAULT NULL,
  `uri` varchar(500) DEFAULT NULL,
  `request_method` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `request_time` varchar(20) DEFAULT NULL,
  `upstream_response_time` varchar(20) DEFAULT NULL,
  `request_length` varchar(20) DEFAULT NULL,
  `bytes_sent` varchar(20) DEFAULT NULL,
  `upstream_addr` varchar(50) DEFAULT NULL,
  `upstream_status` varchar(20) DEFAULT NULL,
  `http_referrer` varchar(255) DEFAULT NULL,
  `http_x_forwarded_for` varchar(500) DEFAULT NULL,
  `http_user_agent` varchar(500) DEFAULT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;