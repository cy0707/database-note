-- order by 与 limit查询
-- 这个数据表针对的select.sql文件的goods那张数据表


-- 1:按价格由高到低排序
SELECT goods_id, goods_name, shop_price FROM goods ORDER BY shop_price DESC;

-- 2:按点击量的从低到高排序
SELECT goods_id, goods_name, click_count FROM goods ORDER BY click_count ASC;

-- 3:按栏目由低到高排序,栏目内部按价格由高到低排序
SELECT goods_id, goods_name, cat_id, shop_price FROM goods ORDER BY cat_id, shop_price DESC;

-- 4:取出价格最高的前三名商品
SELECT goods_id, goods_name, shop_price FROM goods ORDER BY shop_price DESC LIMIT 3;

-- 5:取出点击量前三名到前5名的商品
SELECT goods_id, goods_name, click_count FROM goods ORDER BY click_count DESC LIMIT 2,3;