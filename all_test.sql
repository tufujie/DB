
-- 创建测试所用数据库
create database all_test;

-- 使用这个数据库
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

-- 新建测试表
CREATE TABLE `test_all` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(45) DEFAULT NULL COMMENT '测试名称',
  `test_phone` varchar(45) DEFAULT NULL COMMENT '测试电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nameAndPhone` (`test_phone`,`test_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 常用与一些通用的操作
CREATE TABLE `test_a` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(255) NOT NULL COMMENT '水果名称',
  `season` char(4) NOT NULL DEFAULT '一年四季' COMMENT '水果所属季节'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `test_b` (
  `id` int(11) NOT NULL primary key,
  `name` varchar(255) NOT NULL COMMENT '水果名称',
  `season` char(4) NOT NULL DEFAULT '一年四季' COMMENT '水果所属季节'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO test_a VALUES (1, '苹果', '秋季'); 
INSERT INTO test_a VALUES (2, '菠萝', '一年四季');  
INSERT INTO test_a VALUES (3, '橘子', '冬集');  
INSERT INTO test_a VALUES (4, '西瓜', '夏季');  
INSERT INTO test_a VALUES (5, '香蕉', '秋季');

INSERT INTO test_b VALUES (1, '香蕉', '秋季'); 
INSERT INTO test_b VALUES (2, '草莓', '夏季');  
INSERT INTO test_b VALUES (3, '苹果', '秋季');  
INSERT INTO test_b VALUES (4, '桃子', '夏季');  
INSERT INTO test_b VALUES (5, '荔枝', '夏季');
INSERT INTO test_b VALUES (6, '橙子', '夏季');
-- 常用于MySQL开发技巧
-- 学生
CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL COMMENT '学生ID，学号',
  `student_name` varchar(8) NOT NULL COMMENT '学生名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 学生数据
INSERT INTO `school`.`student` (`student_id`, `student_name`) VALUES ('2012010101', 'Jef');
INSERT INTO `school`.`student` (`student_id`, `student_name`) VALUES ('2012010102', 'Ran');
INSERT INTO `school`.`student` (`student_id`, `student_name`) VALUES ('2012010103', 'Dage');
INSERT INTO `school`.`student` (`student_id`, `student_name`) VALUES ('2012010104', 'Haonan');

-- 学生着装
CREATE TABLE `student_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(8) NOT NULL COMMENT '学生名称',
  `cap` varchar(64) DEFAULT NULL COMMENT '帽子',
  `clothing` varchar(64) DEFAULT NULL COMMENT '衣服',
  `pants` varchar(64) DEFAULT NULL COMMENT '裤子',
  `shoe` varchar(64) DEFAULT NULL COMMENT '鞋子',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 学生着装数据
INSERT INTO `school`.`student_info` (`student_name`, `cap`, `clothing`, `pants`, `shoe`) VALUES ('Jef', '流行帽', '流行衣', '流行裤', '流行鞋');
INSERT INTO `school`.`student_info` (`student_name`, `cap`, `clothing`, `pants`, `shoe`) VALUES ('Ran', '复古帽', '复古衣', '复古裤', '复古鞋');

-- 学生分数
CREATE TABLE `score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(8) NOT NULL COMMENT '学生名称',
  `course_name` varchar(16) NOT NULL COMMENT '课程名称',
  `score` tinyint(3) NOT NULL COMMENT '分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 学生分数数据
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Jef', '语文', '90');
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Jef', '数学', '95');
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Jef', '英语', '100');
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Ran', '语文', '100');
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Ran', '数学', '95');
INSERT INTO `school`.`score` (`student_name`, `course_name`, `score`) VALUES ('Ran', '英语', '90');

-- 学生购物
CREATE TABLE `student_shopping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL COMMENT '学生ID，学号',
  `num` int(11) NOT NULL COMMENT '购物种类',
  `buy_date` date NOT NULL COMMENT '购物日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
-- 学生购物数据
INSERT INTO `school`.`student_shopping` (`student_id`, `num`, `buy_date`) VALUES ('2012010101', 3,  '2018-05-06');
INSERT INTO `school`.`student_shopping` (`student_id`, `num`, `buy_date`) VALUES ('2012010101', 4, '2018-05-05');
INSERT INTO `school`.`student_shopping` (`student_id`, `num`, `buy_date`) VALUES ('2012010101', 5, '2018-05-04');
INSERT INTO `school`.`student_shopping` (`student_id`, `num`, `buy_date`) VALUES ('2012010102', 1, '2018-05-04');
INSERT INTO `school`.`student_shopping` (`student_id`, `num`, `buy_date`) VALUES ('2012010102', 2, '2018-05-03');

-- 学生技能
CREATE TABLE `student_skill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(8) NOT NULL COMMENT '学生ID，学号',
  `skill_name` varchar(16) NOT NULL COMMENT '技能名称',
  `skill_level` tinyint(2) NOT NULL COMMENT '技能等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 学生技能数据
INSERT INTO `school`.`student_skill` (`student_id`, `skill_name`, `skill_level`) VALUES ('2012010101', 'Java', '4');
INSERT INTO `school`.`student_skill` (`student_id`, `skill_name`, `skill_level`) VALUES ('2012010101', 'C++', '3');
INSERT INTO `school`.`student_skill` (`student_id`, `skill_name`, `skill_level`) VALUES ('2012010102', 'HTML', '2');
INSERT INTO `school`.`student_skill` (`student_id`, `skill_name`, `skill_level`) VALUES ('2012010102', 'CSS', '1');

-- 学生兴趣爱好
CREATE TABLE `interest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(8) NOT NULL COMMENT '学生名称',
  `interesting` varchar(64) NOT NULL COMMENT '兴趣爱好',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 学生兴趣爱好数据
INSERT INTO `school`.`interest` (`student_name`, `interesting`) VALUES ('Jef', '篮球,羽毛球,乒乓球,游泳');
INSERT INTO `school`.`interest` (`student_name`, `interesting`) VALUES ('Ran', '篮球,乒乓球,台球');
INSERT INTO `school`.`interest` (`student_name`, `interesting`) VALUES ('Dage', '篮球,乓乓球,台球');


