
-- 把数据表中的字段，要看成变量

 -- 创建一个这个用户表
 CREATE TABLE user(
 	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username CHAR(20) NOT NULL DEFAULT '',
    age TINYINT UNSIGNED NOT NULL DEFAULT 0
 );

 -- 插入某些用户
 INSERT user VALUES(DEFAULT, 'Ann', 24);
 INSERT user VALUES(DEFAULT, 'Jimmy', 28);
 INSERT user VALUES(DEFAULT, 'Tom', 30);


 -- 字段是变量,所以字段可以进行计算
 SELECT username, age+1 FROM user;
 /*
 +----------+-------+
| username | age+1 |
+----------+-------+
| lucy     |    25 |
| Jimmy    |    29 |
+----------+-------+
  */
 


/*
新建一个商品表，有9个字段
goods_id（商品id）goods_name(商品名字) cat_id(目录id)
brand_id(牌子的id) goods_sn(商品编号) goods_number(商品个数)
shop_price(商品的价格) market_price(超市价格) click_count(点击量)
 */

create table goods (
  goods_id mediumint(8) unsigned primary key auto_increment,
  goods_name varchar(120) not null default '',
  cat_id smallint(5) unsigned not null default '0',
  brand_id smallint(5) unsigned not null default '0',
  goods_sn char(15) not null default '',
  goods_number smallint(5) unsigned not null default '0',
  shop_price decimal(10,2) unsigned not null default '0.00',
  market_price decimal(10,2) unsigned not null default '0.00',
  click_count int(10) unsigned not null default '0'
); 

insert goods values (1,'kd876',4,8,'ecs000000',1,1388.00,1665.60,9),
(4,'诺基亚n85原装充电器',8,1,'ecs000004',17,58.00,69.60,0),
(3,'诺基亚原装5800耳机',8,1,'ecs000002',24,68.00,81.60,3),
(5,'索爱原装m2卡读卡器',11,7,'ecs000005',8,20.00,24.00,3),
(6,'胜创kingmax内存卡',11,0,'ecs000006',15,42.00,50.40,0),
(7,'诺基亚n85原装立体声耳机hs-82',8,1,'ecs000007',20,100.00,120.00,0),
(8,'飞利浦9@9v',3,4,'ecs000008',1,399.00,478.79,10),
(9,'诺基亚e66',3,1,'ecs000009',4,2298.00,2757.60,20),
(10,'索爱c702c',3,7,'ecs000010',7,1328.00,1593.60,11),
(11,'索爱c702c',3,7,'ecs000011',1,1300.00,0.00,0),
(12,'摩托罗拉a810',3,2,'ecs000012',8,983.00,1179.60,13),
(13,'诺基亚5320 xpressmusic',3,1,'ecs000013',8,1311.00,1573.20,13),
(14,'诺基亚5800xm',4,1,'ecs000014',1,2625.00,3150.00,6),
(15,'摩托罗拉a810',3,2,'ecs000015',3,788.00,945.60,8),
(16,'恒基伟业g101',2,11,'ecs000016',0,823.33,988.00,3),
(17,'夏新n7',3,5,'ecs000017',1,2300.00,2760.00,2),
(18,'夏新t5',4,5,'ecs000018',1,2878.00,3453.60,0),
(19,'三星sgh-f258',3,6,'ecs000019',12,858.00,1029.60,7),
(20,'三星bc01',3,6,'ecs000020',12,280.00,336.00,14),
(21,'金立 a30',3,10,'ecs000021',40,2000.00,2400.00,4),
(22,'多普达touch hd',3,3,'ecs000022',1,5999.00,7198.80,16),
(23,'诺基亚n96',5,1,'ecs000023',8,3700.00,4440.00,17),
(24,'p806',3,9,'ecs000024',100,2000.00,2400.00,35),
(25,'小灵通/固话50元充值卡',13,0,'ecs000025',2,48.00,57.59,0),
(26,'小灵通/固话20元充值卡',13,0,'ecs000026',2,19.00,22.80,0),
(27,'联通100元充值卡',15,0,'ecs000027',2,95.00,100.00,0),
(28,'联通50元充值卡',15,0,'ecs000028',0,45.00,50.00,0),
(29,'移动100元充值卡',14,0,'ecs000029',0,90.00,0.00,0),
(30,'移动20元充值卡',14,0,'ecs000030',9,18.00,21.00,1),
(31,'摩托罗拉e8 ',3,2,'ecs000031',1,1337.00,1604.39,5),
(32,'诺基亚n85',3,1,'ecs000032',4,3010.00,3612.00,9);


-- where是一个表达式，为真则取值，为假不取值，进行练习

-- 1:主键为32的商品(即goods_id为32)

SELECT goods_id, goods_name, shop_price FROM goods WHERE goods_id = 32;
/*显示的结果为：
+----------+------------+------------+
| goods_id | goods_name | shop_price |
+----------+------------+------------+
|       32 | 诺基亚n85  |    3010.00 |
+----------+------------+------------+
*/

-- 2:不属第3栏目的所有商品
SELECT goods_id, goods_name, shop_price, cat_id FROM goods WHERE cat_id != 3;
/* 显示的结果：
+----------+------------------------------+------------+--------+
| goods_id | goods_name                   | shop_price | cat_id |
+----------+------------------------------+------------+--------+
|        1 | kd876                        |    1388.00 |      4 |
|        3 | 诺基亚原装5800耳机           |      68.00 |      8 |
|        4 | 诺基亚n85原装充电器          |      58.00 |      8 |
|        5 | 索爱原装m2卡读卡器           |      20.00 |     11 |
|        6 | 胜创kingmax内存卡            |      42.00 |     11 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |     100.00 |      8 |
|       14 | 诺基亚5800xm                 |    2625.00 |      4 |
|       16 | 恒基伟业g101                 |     823.33 |      2 |
|       18 | 夏新t5                       |    2878.00 |      4 |
|       23 | 诺基亚n96                    |    3700.00 |      5 |
|       25 | 小灵通/固话50元充值卡        |      48.00 |     13 |
|       26 | 小灵通/固话20元充值卡        |      19.00 |     13 |
|       27 | 联通100元充值卡              |      95.00 |     15 |
|       28 | 联通50元充值卡               |      45.00 |     15 |
|       29 | 移动100元充值卡              |      90.00 |     14 |
|       30 | 移动20元充值卡               |      18.00 |     14 |
+----------+------------------------------+------------+--------+
 */

-- 3:本店价格高于3000元的商品
SELECT goods_id, goods_name, shop_price FROM goods WHERE shop_price > 3000;
/*显示的结果
+----------+----------------+------------+
| goods_id | goods_name     | shop_price |
+----------+----------------+------------+
|       22 | 多普达touch hd |    5999.00 |
|       23 | 诺基亚n96      |    3700.00 |
|       32 | 诺基亚n85      |    3010.00 |
+----------+----------------+------------+
*/

-- 4:本店价格低于或等于100元的商品
SELECT goods_id, goods_name, shop_price FROM goods WHERE shop_price <= 100;
/*
显示的结果：
+----------+------------------------------+------------+
| goods_id | goods_name                   | shop_price |
+----------+------------------------------+------------+
|        3 | 诺基亚原装5800耳机           |      68.00 |
|        4 | 诺基亚n85原装充电器          |      58.00 |
|        5 | 索爱原装m2卡读卡器           |      20.00 |
|        6 | 胜创kingmax内存卡            |      42.00 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |     100.00 |
|       25 | 小灵通/固话50元充值卡        |      48.00 |
|       26 | 小灵通/固话20元充值卡        |      19.00 |
|       27 | 联通100元充值卡              |      95.00 |
|       28 | 联通50元充值卡               |      45.00 |
|       29 | 移动100元充值卡              |      90.00 |
|       30 | 移动20元充值卡               |      18.00 |
+----------+------------------------------+------------+

 */

-- 5:取出第4栏目或第11栏目的商品(不许用or)
SELECT goods_id, goods_name, cat_id FROM goods WHERE cat_id IN (4, 11);
SELECT goods_id, goods_name, cat_id FROM goods WHERE cat_id=4 or cat_id=11;
/*
显示的结果为：
+----------+--------------------+--------+
| goods_id | goods_name         | cat_id |
+----------+--------------------+--------+
|        1 | kd876              |      4 |
|        5 | 索爱原装m2卡读卡器 |     11 |
|        6 | 胜创kingmax内存卡  |     11 |
|       14 | 诺基亚5800xm       |      4 |
|       18 | 夏新t5             |      4 |
+----------+--------------------+--------+
 */
-- 6:取出100<=价格<=500的商品(不许用and)
SELECT goods_id, goods_name, shop_price FROM goods WHERE shop_price BETWEEN 100 AND 500;
SELECT goods_id, goods_name, shop_price FROM goods WHERE shop_price >=100 AND shop_price<=500;
/*
显示的结果为：
+----------+------------------------------+------------+
| goods_id | goods_name                   | shop_price |
+----------+------------------------------+------------+
|        7 | 诺基亚n85原装立体声耳机hs-82 |     100.00 |
|        8 | 飞利浦9@9v                   |     399.00 |
|       20 | 三星bc01                     |     280.00 |
+----------+------------------------------+------------+
 */
-- 7:取出不属于第3栏目且不属于第11栏目的商品(and,或not in分别实现)
SELECT goods_id, goods_name, cat_id FROM goods WHERE cat_id NOT IN (3, 11);
SELECT goods_id, goods_name, cat_id FROM goods WHERE cat_id !=3 AND cat_id !=11;
/*
显示的结果：
+----------+------------------------------+--------+
| goods_id | goods_name                   | cat_id |
+----------+------------------------------+--------+
|        1 | kd876                        |      4 |
|        3 | 诺基亚原装5800耳机           |      8 |
|        4 | 诺基亚n85原装充电器          |      8 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |      8 |
|       14 | 诺基亚5800xm                 |      4 |
|       16 | 恒基伟业g101                 |      2 |
|       18 | 夏新t5                       |      4 |
|       23 | 诺基亚n96                    |      5 |
|       25 | 小灵通/固话50元充值卡        |     13 |
|       26 | 小灵通/固话20元充值卡        |     13 |
|       27 | 联通100元充值卡              |     15 |
|       28 | 联通50元充值卡               |     15 |
|       29 | 移动100元充值卡              |     14 |
|       30 | 移动20元充值卡               |     14 |
+----------+------------------------------+--------+

 */

-- 8:取出价格大于100且小于300,或者大于4000且小于5000的商品
SELECT goods_id, goods_name, shop_price FROM goods WHERE shop_price>100 AND 
shop_price<300 OR shop_price>4000 AND shop_price<5000; 

/*显示的结果：
+----------+------------+------------+
| goods_id | goods_name | shop_price |
+----------+------------+------------+
|       20 | 三星bc01   |     280.00 |
+----------+------------+------------+
*/

-- 9:取出第3个栏目下面价格>1000且<3000,并且点击量>5的系列商品
SELECT goods_id, goods_name, shop_price, cat_id, click_count FROM goods WHERE cat_id=3 AND 
shop_price BETWEEN 1000 AND 3000 AND click_count>5; 

/*
显示的结果为：
+----------+------------------------+------------+--------+-------------+
| goods_id | goods_name             | shop_price | cat_id | click_count |
+----------+------------------------+------------+--------+-------------+
|        9 | 诺基亚e66              |    2298.00 |      3 |          20 |
|       10 | 索爱c702c              |    1328.00 |      3 |          11 |
|       13 | 诺基亚5320 xpressmusic |    1311.00 |      3 |          13 |
|       24 | p806                   |    2000.00 |      3 |          35 |
+----------+------------------------+------------+--------+-------------+

 */

-- 10:取出名字以"诺基亚"开头的商品
SELECT  goods_name FROM goods WHERE goods_name LIKE '诺基亚%'; 
/*
显示的结果：
+------------------------------+
| goods_name                   |
+------------------------------+
| 诺基亚原装5800耳机           |
| 诺基亚n85原装充电器          |
| 诺基亚n85原装立体声耳机hs-82 |
| 诺基亚e66                    |
| 诺基亚5320 xpressmusic       |
| 诺基亚5800xm                 |
| 诺基亚n96                    |
| 诺基亚n85                    |
+------------------------------+
 */

-- 11:取出名字为"诺基亚Nxx"的手机
SELECT  goods_name FROM goods WHERE goods_name LIKE '诺基亚N__'; 
/*
+------------+
| goods_name |
+------------+
| 诺基亚n96  |
| 诺基亚n85  |
+------------+
 */

-- 12:取出名字不以"诺基亚"开头的商品
SELECT  goods_name FROM goods WHERE goods_name NOT LIKE '诺基亚%';
/*
+-----------------------+
| goods_name            |
+-----------------------+
| kd876                 |
| 索爱原装m2卡读卡器    |
| 胜创kingmax内存卡     |
| 飞利浦9@9v            |
| 索爱c702c             |
| 索爱c702c             |
| 摩托罗拉a810          |
| 摩托罗拉a810          |
| 恒基伟业g101          |
| 夏新n7                |
| 夏新t5                |
| 三星sgh-f258          |
| 三星bc01              |
| 金立 a30              |
| 多普达touch hd        |
| p806                  |
| 小灵通/固话50元充值卡 |
| 小灵通/固话20元充值卡 |
| 联通100元充值卡       |
| 联通50元充值卡        |
| 移动100元充值卡       |
| 移动20元充值卡        |
| 摩托罗拉e8            |
+-----------------------+
 */ 

-- 13:取出第3个栏目下面价格在1000到3000之间,并且点击量>5 "诺基亚"开头的系列商品
SELECT  goods_name, shop_price, cat_id, click_count FROM goods WHERE cat_id=3 AND
shop_price BETWEEN 1000 AND 3000 AND click_count>5 AND goods_name LIKE '诺基亚%'; 

SELECT goods_name, shop_price, cat_id, click_count  FROM ecs_goods WHERE 
cat_id=3 AND shop_price>1000 AND shop_price <3000 AND click_count>5 AND goods_name LIKE '诺基亚%';

/*
显示的结果：
+------------------------+------------+--------+-------------+
| goods_name             | shop_price | cat_id | click_count |
+------------------------+------------+--------+-------------+
| 诺基亚e66              |    2298.00 |      3 |          20 |
| 诺基亚5320 xpressmusic |    1311.00 |      3 |          13 |
+------------------------+------------+--------+-------------+
 */


-- 把good表中商品名为'诺基亚xxxx'的商品,改为'HTCxxxx',substring(),concat(),
-- 我的解法
SELECT goods_id, REPLACE(goods_name, '诺基亚', 'HTC') AS replacename FROM goods WHERE goods_name LIKE '诺基亚%';
-- 老师的解法,相比于我的解法，老师的方法复杂了一些
SELECT goods_id, CONCAT('HTC', SUBSTRING(goods_name, 4)) AS replacename FROM goods WHERE goods_name LIKE '诺基亚%';
/*
显示的结果
+----------+---------------------------+
| goods_id | replacename               |
+----------+---------------------------+
|        3 | HTC原装5800耳机           |
|        4 | HTCn85原装充电器          |
|        7 | HTCn85原装立体声耳机hs-82 |
|        9 | HTCe66                    |
|       13 | HTC5320 xpressmusic       |
|       14 | HTC5800xm                 |
|       23 | HTCn96                    |
|       32 | HTCn85                    |
+----------+---------------------------+
 */
