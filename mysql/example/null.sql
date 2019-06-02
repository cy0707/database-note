-- 新建一张表
CREATE TABLE user1(
	id SMALLINT,
	name VARCHAR(20)
);

-- 插入数据
INSERT user1 VALUES(1, 'ann'),(2,NULL);

-- 查找名字为ann，很容易找到
SELECT name FROM user1 WHERE name = 'ann';
/*
+------+
| name |
+------+
| ann  |
+------+
 */

-- 查找名字为NULL的，就找不到
SELECT name FROM user1 WHERE name = NULL;
-- Empty set (0.00 sec)

-- 查找名字不为NULL的，也找不到
SELECT name FROM user1 WHERE name != NULL;
-- Empty set (0.00 sec)


-- NULL=NULL的结果是null
SELECT NULL = NULL;
/*
+-------------+
| NULL = NULL |
+-------------+
|        NULL |
+-------------+
 */

-- NULL=!NULL的结果是null
SELECT NULL != NULL;
/*
+-------------+
| NULL != NULL |
+-------------+
|        NULL |
+-------------+
 */

-- NULL是一个特殊的值，都没有值，所以NULL不等于任何值,即使本身也不行
-- 要比较NULL的话，需要专门的 IS NULL, IS NOT NULL

-- 找到名字为NULL的用户
SELECT name FROM user1 WHERE name IS NULL;
/*
+------+
| name |
+------+
| NULL |
+------+
 */

-- 找到名字不为NULL的用户
SELECT name FROM user1 WHERE name IS NOT NULL;
/*
+------+
| name |
+------+
| ann  |
+------+
 */