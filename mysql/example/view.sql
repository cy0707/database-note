-- view
-- 这个数据表针对的select.sql文件的goods那张数据表

-- 题目要求：查询每个栏目下商品的平均价格，并按照平均
-- 价格进行排序，取出平均价格前三名的栏目。

SELECT cat_id, AVG(shop_price) FROM goods GROUP BY cat_id
ORDER BY AVG(shop_price) DESC LIMIT 3;



-- 上面的语句有点复杂，我们可以创建一个视图，简化语句

CREATE VIEW avgprice AS SELECT cat_id, AVG(shop_price) AS avgp FROM goods GROUP BY cat_id;
SELECT * FROM avgprice ORDER BY avgp DESC LIMIT 3;

-- 上面似乎并没简化，其实在这样的简单的语句，体现不了简单。但是在复杂
-- 的语句中,视图的优势就体现出来了。

