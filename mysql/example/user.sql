/*

题目要求(简单的增删改查)：

用户注册表单收集,提交数据,注册页面收集到表单的数据后,
形成insert语句,user表插入该条数据,用户注册完成.

前台用户中心,用户新昵称,根据新昵称和用户id,
形成update语句，完成昵称修改.

管理员后台点击会员列表,此时,网页形成select 语句,
查询出所有会员的数据,完成会员的查看.

管理员后台选中某用户并且删除,捕捉此用户的id,
根据用户id形成相应的delete语句,执行delete语句,完成用户的删除.

 */

-- 创建一个这个用户表
CREATE TABLE user(
	id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username CHAR(20) NOT NULL DEFAULT '',
    age TINYINT UNSIGNED NOT NULL DEFAULT 0
);

-- 插入某些用户
INSERT user VALUES(DEFAULT, 'Ann', 24);
INSERT user VALUES(DEFAULT, 'Jimmy', 28);
INSERT user VALUES(DEFAULT, 'Tom', 30);


-- 用户修改昵称,例如我想把ann修改为lucy
UPDATE user SET username = 'lucy' WHERE id = 1;

-- 选择年龄为30的用户
SELECT username FROM user WHERE age = 30;

-- 删除年龄为30的用户
DELETE FROM user WHERE id = 3;
