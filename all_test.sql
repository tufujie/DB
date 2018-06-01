
-- 创建mybatis测试所用数据库
create database all_test;

-- 使用这个使句酷
use all_test;

-- 新建测试用户表
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '名字',
  `password` varchar(48) NOT NULL DEFAULT 'e10adc3949ba59abbe56e057f20f883e' COMMENT '加密后的密码',
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `age` smallint(3) NOT NULL COMMENT '年龄',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_phone` (`name`,`phone`) COMMENT '一个人可能有多个手机号码'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 插入测试数据
INSERT INTO `all_test`.`user` (`name`, `password`, `phone`, `age`) VALUES ('Jef', 'e10adc3949ba59abbe56e057f20f883e', '18390220001', 20);
INSERT INTO `all_test`.`user` (`name`, `password`, `phone`, `age`) VALUES ('Ran', 'e10adc3949ba59abbe56e057f20f883e','18390220002', 19);

-- 新建测试订单表
CREATE TABLE all_test.`order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT comment '系统订单ID',
  `extra_order_id` varchar(32) NOT NULL COMMENT '第三方订单ID',
  `shop_id` bigint(20) NOT NULL COMMENT '系统店铺ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_shop` (`extra_order_id`,`shop_id`) COMMENT '同一个店铺不允许有相同订单号'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 新建测试子订单表
CREATE TABLE all_test.`order_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT comment '系统子订单ID',
  `order_id` bigint(20) NOT NULL COMMENT '系统订单ID',
  `product_name` varchar(32) NOT NULL COMMENT '商品名称',
  `num` smallint(4) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_productName` (`order_id`,`product_name`) COMMENT '同一个订单商品名称不重'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 新建测试店铺信息
CREATE TABLE all_test.`shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT comment '系统店铺ID',
  `name` varchar(32) NOT NULL COMMENT '店铺名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 添加订单、子订单、店铺数据
INSERT INTO `all_test`.`order_info` (`extra_order_id`, `shop_id`, `user_id`) VALUES ('123456789', '1', '1');

INSERT INTO `all_test`.`order_product` (`order_id`, `product_name`, `num`) VALUES ('1', '袜子', '3');
INSERT INTO `all_test`.`order_product` (`order_id`, `product_name`, `num`) VALUES ('1', '鞋子', '2');
INSERT INTO `all_test`.`order_product` (`order_id`, `product_name`, `num`) VALUES ('1', '短袖', '1');

INSERT INTO `all_test`.`shop` (`name`) VALUES ('Jef的店铺');

CREATE TABLE `test_all` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(45) DEFAULT NULL COMMENT '测试名称',
  `test_phone` varchar(45) DEFAULT NULL COMMENT '测试电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameAndPhone` (`test_phone`,`test_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



