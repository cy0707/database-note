-- 子查询:子查询出来的结果，也是一张表
-- 这个数据表针对的select.sql文件的goods那张数据表



-- 1:查询出最新一行商品(以商品编号最大为最新,用子查询实现)
SELECT goods_id, goods_name FROM goods WHERE goods_id = (SELECT MAX(goods_id) FROM goods);
/*
+----------+------------+
| goods_id | goods_name |
+----------+------------+
|       32 | 诺基亚n85  |
+----------+------------+
 */

-- 2:查询出编号为19的商品的栏目名称(用左连接查询和子查询分别)


-- 3:用where型子查询把goods表中的每个栏目下面最新的商品取出来

SELECT goods_id, goods_name, cat_id FROM goods WHERE goods_id IN 
(SELECT MAX(goods_id) FROM goods GROUP BY cat_id);

/*
+----------+------------------------------+--------+
| goods_id | goods_name                   | cat_id |
+----------+------------------------------+--------+
|        6 | 胜创kingmax内存卡            |     11 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |      8 |
|       16 | 恒基伟业g101                 |      2 |
|       18 | 夏新t5                       |      4 |
|       23 | 诺基亚n96                    |      5 |
|       26 | 小灵通/固话20元充值卡        |     13 |
|       28 | 联通50元充值卡               |     15 |
|       30 | 移动20元充值卡               |     14 |
|       32 | 诺基亚n85                    |      3 |
+----------+------------------------------+--------+
 */

-- 4:用from型子查询把goods表中的每个栏目下面最新的商品取出来
-- SELECT语句中的子查询，FROM子查询需要给子查询的结果起一个别名，不然会报错
-- 前面的语句是选择全部的按goods_id的全部记录，然后以GROUP BY 进行分组
-- 此时就取排序的第一个记录
SELECT * FROM (SELECT goods_id, goods_name, cat_id FROM goods ORDER BY goods_id DESC) 
AS newgoods GROUP BY cat_id;
/*
+----------+------------------------------+--------+
| goods_id | goods_name                   | cat_id |
+----------+------------------------------+--------+
|       16 | 恒基伟业g101                 |      2 |
|       32 | 诺基亚n85                    |      3 |
|       18 | 夏新t5                       |      4 |
|       23 | 诺基亚n96                    |      5 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |      8 |
|        6 | 胜创kingmax内存卡            |     11 |
|       26 | 小灵通/固话20元充值卡        |     13 |
|       30 | 移动20元充值卡               |     14 |
|       28 | 联通50元充值卡               |     15 |
+----------+------------------------------+--------+
 */

-- 5 用exists型子查询,查出所有有商品的栏目（即查出有商品的目录，即判断商品有栏目没？）
-- 这个是category表和goods表的结合
SELECT * FROM category WHERE EXISTS (SELECT * FROM goods WHERE goods.cat_id = category.cat_id);
