-- 查询出2门及2门以上的不及格者的平均成绩

-- 先建立成绩表
CREATE TABLE students(
    name CHAR(10) NOT NULL,
    subject CHAR(10) NOT NULL,
    score SMALLINT UNSIGNED NOT NULL
);

-- 录入学生成绩
INSERT students VALUES('张三', '数学', 90);
INSERT students VALUES('张三', '语文', 50);
INSERT students VALUES('张三', '地理', 40);
INSERT students VALUES('李四', '语文', 55);
INSERT students VALUES('李四', '政治', 45);
INSERT students VALUES('王五', '政治', 30);


-- 先以name进行分组，然后对分组的结果，统计分数小于60的科目大于等于2
-- 再对这些选择的结果，求出平均值
SELECT name, AVG(score) AS avgscore FROM students GROUP BY name
HAVING COUNT(score < 60) >=2;