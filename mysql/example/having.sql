
-- 这个数据表针对的select.sql文件的goods那张数据表
-- having与group综合运用查询:

-- 1:查询该店的商品比市场价所节省的价格shop_price market_price
SELECT goods_id, goods_name, (market_price-shop_price) AS savemoney FROM goods;
/*
+----------+------------------------------+-----------+
| goods_id | goods_name                   | savemoney |
+----------+------------------------------+-----------+
|        1 | kd876                        |    277.60 |
|        3 | 诺基亚原装5800耳机           |     13.60 |
|        4 | 诺基亚n85原装充电器          |     11.60 |
|        5 | 索爱原装m2卡读卡器           |      4.00 |
|        6 | 胜创kingmax内存卡            |      8.40 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |     20.00 |
|        8 | 飞利浦9@9v                   |     79.79 |
|        9 | 诺基亚e66                    |    459.60 |
|       10 | 索爱c702c                    |    265.60 |
|       11 | 索爱c702c                    |  -1300.00 |
|       12 | 摩托罗拉a810                 |    196.60 |
|       13 | 诺基亚5320 xpressmusic       |    262.20 |
|       14 | 诺基亚5800xm                 |    525.00 |
|       15 | 摩托罗拉a810                 |    157.60 |
|       16 | 恒基伟业g101                 |    164.67 |
|       17 | 夏新n7                       |    460.00 |
|       18 | 夏新t5                       |    575.60 |
|       19 | 三星sgh-f258                 |    171.60 |
|       20 | 三星bc01                     |     56.00 |
|       21 | 金立 a30                     |    400.00 |
|       22 | 多普达touch hd               |   1199.80 |
|       23 | 诺基亚n96                    |    740.00 |
|       24 | p806                         |    400.00 |
|       25 | 小灵通/固话50元充值卡        |      9.59 |
|       26 | 小灵通/固话20元充值卡        |      3.80 |
|       27 | 联通100元充值卡              |      5.00 |
|       28 | 联通50元充值卡               |      5.00 |
|       29 | 移动100元充值卡              |    -90.00 |
|       30 | 移动20元充值卡               |      3.00 |
|       31 | 摩托罗拉e8                   |    267.39 |
|       32 | 诺基亚n85                    |    602.00 |
+----------+------------------------------+-----------+
 */

-- 2:查询每个商品所积压的货款(提示:库存*单价)
SELECT goods_id, goods_name, goods_number*shop_price AS overstock FROM goods;
/*
+----------+------------------------------+-----------+
| goods_id | goods_name                   | overstock |
+----------+------------------------------+-----------+
|        1 | kd876                        |   1388.00 |
|        3 | 诺基亚原装5800耳机           |   1632.00 |
|        4 | 诺基亚n85原装充电器          |    986.00 |
|        5 | 索爱原装m2卡读卡器           |    160.00 |
|        6 | 胜创kingmax内存卡            |    630.00 |
|        7 | 诺基亚n85原装立体声耳机hs-82 |   2000.00 |
|        8 | 飞利浦9@9v                   |    399.00 |
|        9 | 诺基亚e66                    |   9192.00 |
|       10 | 索爱c702c                    |   9296.00 |
|       11 | 索爱c702c                    |   1300.00 |
|       12 | 摩托罗拉a810                 |   7864.00 |
|       13 | 诺基亚5320 xpressmusic       |  10488.00 |
|       14 | 诺基亚5800xm                 |   2625.00 |
|       15 | 摩托罗拉a810                 |   2364.00 |
|       16 | 恒基伟业g101                 |      0.00 |
|       17 | 夏新n7                       |   2300.00 |
|       18 | 夏新t5                       |   2878.00 |
|       19 | 三星sgh-f258                 |  10296.00 |
|       20 | 三星bc01                     |   3360.00 |
|       21 | 金立 a30                     |  80000.00 |
|       22 | 多普达touch hd               |   5999.00 |
|       23 | 诺基亚n96                    |  29600.00 |
|       24 | p806                         | 200000.00 |
|       25 | 小灵通/固话50元充值卡        |     96.00 |
|       26 | 小灵通/固话20元充值卡        |     38.00 |
|       27 | 联通100元充值卡              |    190.00 |
|       28 | 联通50元充值卡               |      0.00 |
|       29 | 移动100元充值卡              |      0.00 |
|       30 | 移动20元充值卡               |    162.00 |
|       31 | 摩托罗拉e8                   |   1337.00 |
|       32 | 诺基亚n85                    |  12040.00 |
+----------+------------------------------+-----------+
 */


-- 3:查询该店积压的总货款
SELECT SUM(goods_number*shop_price) AS overstock FROM goods;
/*
+-----------+
| overstock |
+-----------+
| 398620.00 |
+-----------+
 */

-- 4:查询该店每个栏目下面积压的货款.
SELECT cat_id, SUM(goods_number*shop_price) AS overstock FROM goods GROUP BY cat_id;
/*
+--------+-----------+
| cat_id | overstock |
+--------+-----------+
|      2 |      0.00 |
|      3 | 356235.00 |
|      4 |   6891.00 |
|      5 |  29600.00 |
|      8 |   4618.00 |
|     11 |    790.00 |
|     13 |    134.00 |
|     14 |    162.00 |
|     15 |    190.00 |
+--------+-----------+
 */

-- 5:查询比市场价省钱200元以上的商品及该商品所省的钱(where和having分别实现)
SELECT goods_id, goods_name, (market_price-shop_price) AS savemoney FROM goods WHERE (market_price-shop_price)>=200;
/*
+----------+------------------------+-----------+
| goods_id | goods_name             | savemoney |
+----------+------------------------+-----------+
|        1 | kd876                  |    277.60 |
|        9 | 诺基亚e66              |    459.60 |
|       10 | 索爱c702c              |    265.60 |
|       13 | 诺基亚5320 xpressmusic |    262.20 |
|       14 | 诺基亚5800xm           |    525.00 |
|       17 | 夏新n7                 |    460.00 |
|       18 | 夏新t5                 |    575.60 |
|       21 | 金立 a30               |    400.00 |
|       22 | 多普达touch hd         |   1199.80 |
|       23 | 诺基亚n96              |    740.00 |
|       24 | p806                   |    400.00 |
|       31 | 摩托罗拉e8             |    267.39 |
|       32 | 诺基亚n85              |    602.00 |
+----------+------------------------+-----------+
 */

SELECT goods_id, goods_name, (market_price-shop_price) AS savemoney FROM goods HAVING savemoney >=200;

/*
这个考察的知识点，就是where和having的区别，区别就是在于，where (market_price-shop_price)>=200;
HAVING savemoney >=200-----因为，having的结果中包含了别名 savemoney，所以可以用，而where不是
从结果中寻找，所以找不到，只能(market_price-shop_price)>=200
 */

-- 6:查询积压货款超过2W元的栏目,以及该栏目积压的货款
SELECT cat_id, SUM(goods_number*shop_price) AS overstock FROM goods GROUP BY cat_id HAVING overstock>=20000;
/*
+--------+-----------+
| cat_id | overstock |
+--------+-----------+
|      3 | 356235.00 |
|      5 |  29600.00 |
+--------+-----------+
 */