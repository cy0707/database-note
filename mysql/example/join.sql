-- 内连接
-- 查询boy表和girl表中hid相同的boy和girl
 create table boy (
    hid char(1),
     bname varchar(20)
 );
 insert into boy (bname,hid)
     values
     ('屌丝','A'),
     ('杨过','B'),
     ('陈冠希','C');

 
 create table girl (
    hid char(1),
     gname varchar(20)
     );
 insert into girl(gname,hid)
     values
     ('小龙女','B'),
     ('张柏芝','C'),
     ('死宅女','D');

-- 两张表的连接方法INNER JOIN
-- 两张表的连接是以什么条件进行连接的ON boy.hid = girl.hid
SELECT boy.hid, bname, girl.hid, gname FROM boy INNER JOIN girl ON
boy.hid = girl.hid;
/*
显示的结果
+------+--------+------+--------+
| hid  | bname  | hid  | gname  |
+------+--------+------+--------+
| B    | 杨过   | B    | 小龙女 |
| C    | 陈冠希 | C    | 张柏芝 |
+------+--------+------+--------+
 */



-- 左连接
-- 查询boy表和girl表中hid相同的boy和girl，并且包含全部的boy 
SELECT boy.hid, bname, girl.hid, gname FROM boy LEFT JOIN girl ON
boy.hid = girl.hid;

-- 上面这个可以变形为
SELECT boy.hid, bname, girl.hid, gname FROM girl RIGHT JOIN boy ON
boy.hid = girl.hid;


/*
显示的结果：左边的全部查询，即使没有匹配的话，那么就赋值为NULL.
左边全部查询，找右表中对应的数据。把右表中对应的数据选出来+右边的
全部数据----就是查询的结果
+------+--------+------+--------+
| hid  | bname  | hid  | gname  |
+------+--------+------+--------+
| B    | 杨过   | B    | 小龙女 |
| C    | 陈冠希 | C    | 张柏芝 |
| A    | 屌丝   | NULL | NULL   |
+------+--------+------+--------+
 */

-- 右连接
-- 查询boy表和girl表中hid相同的boy和girl，并且包含全部的girl 

SELECT boy.hid, bname, girl.hid, gname FROM boy RIGHT JOIN girl ON
boy.hid = girl.hid;

-- 上面这个可以变形为
SELECT boy.hid, bname, girl.hid, gname FROM girl LEFT JOIN boy ON
boy.hid = girl.hid;

/*
显示的结果：
+------+--------+------+--------+
| hid  | bname  | hid  | gname  |
+------+--------+------+--------+
| B    | 杨过   | B    | 小龙女 |
| C    | 陈冠希 | C    | 张柏芝 |
| NULL | NULL   | D    | 死宅女 |
+------+--------+------+--------+
 */


-- 连接查询
-- 这个数据表针对的select.sql文件的goods那张数据表
-- 创建一个分类的表
 create table category (
 cat_id smallint unsigned auto_increment primary key,
 cat_name varchar(90) not null default '',
 parent_id smallint unsigned
 );


INSERT category VALUES 
(1,'手机类型',0),
(2,'CDMA手机',1),
(3,'GSM手机',1),
(4,'3G手机',1),
(5,'双模手机',1),
(6,'手机配件',0),
(7,'充电器',6),
(8,'耳机',6),
(9,'电池',6),
(11,'读卡器和内存卡',6),
(12,'充值卡',0),
(13,'小灵通/固话充值卡',12),
(14,'移动手机充值卡',12),
(15,'联通手机充值卡',12);


-- 根据goods和category这两张表，进行连接

-- 1:取出所有商品的商品名,栏目名,价格
SELECT goods.goods_name, category.cat_name, goods.shop_price FROM
goods LEFT JOIN category ON goods.cat_id = category.cat_id;


-- 2:取出第4个栏目下的商品的商品名,栏目名,价格
SELECT goods.goods_name, category.cat_name, goods.shop_price FROM
goods LEFT JOIN category ON goods.cat_id = category.cat_id WHERE
category.cat_id = 4;


/*结果要求
根据给出的表结构按要求写出SQL语句。
Match 赛程表
字段名称	字段类型	描述
matchID	int	主键
hostTeamID	int	主队的ID
guestTeamID	int	客队的ID
matchResult	varchar(20)	比赛结果，如（2:0）
matchTime	date	比赛开始时间


Team 参赛队伍表
字段名称	字段类型	描述
teamID	int	主键
teamName	varchar(20)	队伍名称


Match的hostTeamID与guestTeamID都与Team中的teamID关联
查出 2006-6-1 到2006-7-1之间举行的所有比赛，并且用以下形式列出：
拜仁  2：0 不来梅 2006-6-21
 */

 create table m(
     mid int,
     hid int,
     gid int,
     mres varchar(10),
     matime date
);

create table t (
     tid int,
     tname varchar(20)
);
 
 
 insert into m
     values
     (1,1,2,'2:0','2006-05-21'),
     (2,2,3,'1:2','2006-06-21'),
     (3,3,1,'2:5','2006-06-25'),
     (4,2,1,'3:2','2006-07-21');

 
 insert into t
     values
     (1,'国安'),
     (2,'申花'),
     (3,'布尔联队');


-- 把每一次的连接的看成一张的新的表。第一次左连接的结果
-- 看成一张新的表，再对t表再进行连接
SELECT mid, t1.tname, t2.tname, mres, matime FROM m LEFT JOIN t
AS t1 ON m.hid = t1.tid LEFT JOIN t AS t2 ON m.gid = t2.tid
/*
+------+----------+----------+------+------------+
| mid  | tname    | tname    | mres | matime     |
+------+----------+----------+------+------------+
|    4 | 申花     | 国安     | 3:2  | 2006-07-21 |
|    3 | 布尔联队 | 国安     | 2:5  | 2006-06-25 |
|    1 | 国安     | 申花     | 2:0  | 2006-05-21 |
|    2 | 申花     | 布尔联队 | 1:2  | 2006-06-21 |
+------+----------+----------+------+------------+
 */


-- 关于时间的筛选
SELECT mid, t1.tname, t2.tname, mres, matime FROM m LEFT JOIN t
AS t1 ON m.hid = t1.tid LEFT JOIN t AS t2 ON m.gid = t2.tid WHERE 
matime BETWEEN '2006-6-1' AND '2006-7-1';
/*
+------+----------+----------+------+------------+
| mid  | tname    | tname    | mres | matime     |
+------+----------+----------+------+------------+
|    3 | 布尔联队 | 国安     | 2:5  | 2006-06-25 |
|    2 | 申花     | 布尔联队 | 1:2  | 2006-06-21 |
+------+----------+----------+------+------------+
 */