-- 创建两张表
create table a (
id char(1),
num int
);

insert into a values ('a',5),('b',10),('c',15),('d',10);

create table b (
id char(1),
num int
);

insert into b values ('b',5),('c',15),('d',20),('e',99);

-- 使用union时，会去掉重复的数据
SELECT * FROM a UNION SELECT * FROM b;
/*

从这个结果集中，我们可以看见c=10,这个数据被合并了
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
| b    |    5 |
| d    |   20 |
| e    |   99 |
+------+------+
 */

SELECT * FROM a UNION ALL SELECT * FROM b;

/*显示的结果为：数据重复的没用合并
+------+------+
| id   | num  |
+------+------+
| a    |    5 |
| b    |   10 |
| c    |   15 |
| d    |   10 |
| b    |    5 |
| c    |   15 |
| d    |   20 |
| e    |   99 |
+------+------+
*/

SELECT id FROM a UNION ALL SELECT * FROM b;