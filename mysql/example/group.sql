-- 这个数据表针对的select.sql文件的goods那张数据表


-- 1:查出最贵的商品的价格
SELECT  MAX(shop_price) FROM goods;


-- 2:查出最大(最新)的商品编号
SELECT MAX(goods_id) FROM goods;


-- 3:查出最便宜的商品的价格
SELECT MIN(shop_price) FROM goods;


-- 4:查出最旧(最小)的商品编号
SELECT MIN(goods_id) FROM goods;


-- 5:查询该店所有商品的库存总量
SELECT SUM(goods_number) AS totalnumber FROM goods;


-- 6:查询所有商品的平均价
 SELECT FORMAT(AVG(shop_price),2) AS avgprice FROM goods;


-- 7:查询该店一共有多少种商品
SELECT COUNT(goods_name) AS totalnum FROM goods;


-- 8:查询每个栏目下面,最贵商品价格
SELECT cat_id, MAX(shop_price) AS maxprice FROM goods GROUP BY cat_id;


-- 9:查询每个栏目下面,最低商品价格
SELECT cat_id, MIN(shop_price) AS minprice FROM goods GROUP BY cat_id;


-- 10:查询每个栏目下面,商品平均价格
SELECT cat_id, AVG(shop_price) AS avgprice FROM goods GROUP BY cat_id;


-- 11:查询每个栏目下面,商品库存量
SELECT cat_id, SUM(goods_number) AS catnum FROM goods GROUP BY cat_id;


-- 12:查询每个栏目下面,商品种类
SELECT cat_id, COUNT(goods_name) AS cat FROM goods GROUP BY cat_id;


--注意，这里有一个严重的错误，下面这条语句是错误的，尽管能查出数据
SELECT goods_id, cat_id, MAX(shop_price) FROM goods GROUP BY cat_id;

-- 错误的原因是，是以cat_id分组，而1个cat_id对应的是多个goods_id,而这里
-- 只有一个goods_id,所以这种对应关系是错误，在标准的SQL语句，是错误的，MySQL取得是第一个id
/*
+----------+--------+-----------------+
| goods_id | cat_id | MAX(shop_price) |
+----------+--------+-----------------+
|       16 |      2 |          823.33 |
|        8 |      3 |         5999.00 |
|        1 |      4 |         2878.00 |
|       23 |      5 |         3700.00 |
|        3 |      8 |          100.00 |
|        5 |     11 |           42.00 |
|       25 |     13 |           48.00 |
|       29 |     14 |           90.00 |
|       27 |     15 |           95.00 |
+----------+--------+-----------------+
 */
