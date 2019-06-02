/*
一道面试题
有如下表和数组
把num值处于[20,29]之间,改为20
num值处于[30,39]之间的,改为30

mian表
+------+
| num  |
+------+
|    3 |
|   12 |
|   15 |
|   25 |
|   23 |
|   29 |
|   34 |
|   37 |
|   32 |
|   45 |
|   48 |
|   52 |
+------+

 */

create table num ( num int);
insert into num values 
(3),
(12),
(15),
(25),
(23),
(29),
(34),
(37),
(32);

-- 我自己的思路，是采用两个UPDATE语句
-- 如果有很多的数据20-100,那么就要写好几条语句
UPDATE num SET num = 20 WHERE num>20 AND num <=29;
UPDATE num SET num = 30 WHERE num>30 AND num <=39;

-- 老师的思路,FLOOR(num/10)这个的思路---是牢记字段是变量
-- 可以进行计算的，这句话可以这样理解，选择20到39之间的数字
-- 分别除以10,再对结果向下取整,然后再乘以10。老师的更简单
UPDATE num SET num = FLOOR(num/10)*10 WHERE num>=20 AND num<=39;