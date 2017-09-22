-- 用于社团之家的数据库管理文件
-- 2017/7/19
CREATE DATABASE communityhome;
use communityhome;

-- 用于储存社团发送的动态
-- 2017/7/19

CREATE TABLE commdynamic(
id bigint NOT NULL AUTO_INCREMENT COMMENT '动态的id',
information varchar(120) NOT NULL COMMENT '动态的内容',
createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '动态创建时间',
communityid bigint NOT NULL  COMMENT '社团的id',
PRIMARY KEY (id),
key idxcreatetime(createtime)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '社团动态表';


-- 插入数据
insert into commdynamic(information,communityid)
values
	('开始活动了哦',1000),
	('又开始活动了哦',1000),
	('再开始活动了哦',1000);
	
	
-- 查找数据
select * from commdynamic;




-- 用于储存社团的信息
-- 2017/7/19

CREATE TABLE community(
id bigint NOT NULL AUTO_INCREMENT COMMENT '社团的id',
name varchar(50) NOT NULL COMMENT '社团的名字',
email varchar(50) NOT NULL COMMENT '社团的email',
introduction varchar(200) NOT NULL COMMENT '社团的简介',
school varchar(50) NOT NULL COMMENT '社团的学校',
type varchar(50) NOT NULL COMMENT '社团的类型',
picture varchar(50) NOT NULL COMMENT '社团的图片',
PRIMARY KEY (id),
key idxtype(type),
key idxname(name),
key idxschool(school)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '社团表';

-- 设置触发器当删除数据时也把与他相关的数据一起删除
CREATE TRIGGER deletetocommunityuser after DELETE ON community FOR EACH ROW delete from communityuser where communityid = OLD.id;
CREATE TRIGGER deletetoactivity after DELETE ON community FOR EACH ROW delete from activity where commid = OLD.id;
CREATE TRIGGER deletetocommdynamic after DELETE ON community FOR EACH ROW delete from commdynamic where communityid = OLD.id;

-- 插入数据
-- 这个触发器是富润峰第一次发现要一行一行执行的触发器所以之前可能存在问题
insert into community(name,email,introduction,school,type,picture)
values
('吉他社','m15211122240@163.com','弹吉他','东北大学','吉他','image/j.jpg'),
('科协','m15211122240@163.com','爱吉他的人','东北大学','社团','image/j.jpg'),
('百亿项目组','m15211122240@163.com','数模大神','东北大学','社团','image/j.jpg'),
('数模社','m15211122241@163.com','玩数模','东北大学','数模','image/a,jpg');

-- 查找数据
select * from community;

-- 用于储存社团发送的活动的信息
-- 2017/7/21
CREATE TABLE communityuser(
communityid bigint NOT NULL COMMENT 'id',
userid bigint COMMENT '成员id',
PRIMARY KEY (communityid,userid)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '社团人员表';

-- 插入数据
insert into communityuser(communityid,userid)
values
	(1001,1000),
	(1000,1001),
	(1000,1002);
	
-- 查找数据
select * from communityuser;
-- 用于储存社团的图片
CREATE TABLE communityphotoalbum(
  id bigint NOT NULL COMMENT '社团id',
  picture varchar(50) COMMENT '图片'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '社团相册';

insert into communityphotoalbum
values
  (1,'吉他3.jpg'),
  (2,'吉他.jpg'),
  (1,'吉他1.jpg'),
  (1,'吉他.jpg');
-- 查找数据
select * from communityphotoalbum;

-- 审核社团的id
    
CREATE TABLE examine(
id bigint NOT NULL AUTO_INCREMENT COMMENT '审核的id',
userid bigint NOT NULL  COMMENT '审核的id',
name varchar(50) NOT NULL COMMENT '社团的名字',
email varchar(50) NOT NULL COMMENT '社团的email',
introduction varchar(200) NOT NULL COMMENT '社团的简介',
school varchar(50) NOT NULL COMMENT '社团的学校',
type varchar(50) NOT NULL COMMENT '社团的类型',
picture varchar(50) NOT NULL COMMENT '社团的图片',
createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '动态创建时间',
status int NOT NULL DEFAULT -2 COMMENT '审核社团的状态',
PRIMARY KEY (id),
key idxtype(type),
key idxname(name),
key idxschool(school)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '社团.表';

-- 插入数据(这里曾忘记写入userid2017/9/11)
insert into examine(userid,name,email,introduction,school,type,picture)
values
(1000,'我的社','m15211122240@163.com','弹吉他','东北大学','吉他','image/j.jpg'),
(1000,'测试社','m15211122241@163.com','玩数模','东北大学','数模','image/a,jpg');
-- 查找数据
select * from examine;
-- 用于储存人员关注活动的信息
-- 2017/7/20
CREATE TABLE followacuser(
activityid bigint NOT NULL COMMENT '关注活动id',
userid bigint COMMENT '成员id',
PRIMARY KEY (activityid,userid)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '关注社团活动人员表';

-- 插入数据
insert into followacuser(activityid,userid)
values
	(1000,1000),
	(1000,1001),
	(1000,1002);
-- 查找数据
select * from followacuser;
-- 用于储存人员关注社团的信息
-- 2017/7/20
CREATE TABLE followcommuser(
communityid bigint NOT NULL COMMENT '关注社团id',
userid bigint COMMENT '成员id',
PRIMARY KEY (communityid,userid)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '关注社团人员表';

-- 插入数据
insert into followcommuser(communityid,userid)
values
	(1000,1000),
	(1000,1001),
	(1000,1002);
-- 查找数据
select * from followcommuser;
-- 用于用户的信息
-- 2017/7/19

CREATE TABLE user(
id bigint NOT NULL AUTO_INCREMENT COMMENT '动态的id',
username varchar(16) NOT NULL COMMENT '昵称',
mailbox varchar(25) NOT NULL COMMENT '邮箱',
password varchar(16) NOT NULL COMMENT '密码',
picture varchar(70) NOT NULL COMMENT '图片地址',
name varchar(16) NOT NULL COMMENT '名字',
studentid int NOT NULL COMMENT '学号',
profession varchar(25) NOT NULL COMMENT '专业',
telnumber varchar(25) NOT NULL COMMENT '电话',
birth timestamp NOT NULL COMMENT '生日',
gender varchar(25) NOT NULL COMMENT '性别',
school varchar(25) NOT NULL COMMENT '学校',
PRIMARY KEY (id),
key idxuse(username),
key idxpas(password)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '用户表';
insert into user(username,mailbox,password,picture,name,studentid,profession,telnumber,birth,gender,school)
values
("test","m15211122540@163.com","password1","image/11.jpg","阿是三",20165122,"英件","15245278912","20160801","男","鞍山七中"),
("test2","m15211122240@163.com","password","image/1.jpg","阿三",20165142,"软件","15245678912","20160809","男","鞍山八中"),
("test1","m15214122240@163.com","pssword","image/12.jpg","阿三是",20165122,"功课","15245278912","20160109","男","鞍山九中");
select *from user;


CREATE TABLE hobbyuser(
userid bigint NOT NULL COMMENT '用户id',
hobby varchar(50) COMMENT '兴趣',
PRIMARY KEY (userid,hobby)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '人员兴趣表';

-- 插入数据
insert into hobbyuser
values
	(1001,'吉他 数模'),
	(1000,'钢琴'),
	(1000,'跑步');
-- 查找数据
select * from hobbyuser;

-- 储存用户申请加入社团的审核信息
CREATE TABLE joiningassn(
id bigint NOT NULL AUTO_INCREMENT COMMENT '审核类id',
userid bigint NOT NULL COMMENT '用户id',
assnid bigint NOT NULL COMMENT '社团id',
createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
endtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '截止时间',
status int NOT NULL DEFAULT 0 COMMENT '状态 -2超时,-1拒绝,0未审核,1接受',
PRIMARY KEY (auditingid,userid,assnid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- 插入数据
INSERT INTO joiningassn(userid,assnid,endtime,status) VALUES
(1,1,'2017-7-21 10:00:01',0),
(3,1,'2017-7-25 10:00:01',0);
-- 查找数据
SELECT * FROM joiningassn LEFT JOIN USER ON joiningassn.userid = user.id;

-- 用于储存人员管理的活动的信息
-- 2017/7/21
CREATE TABLE managercommuser(
communityid bigint NOT NULL COMMENT '社团id',
userid bigint COMMENT '成员id',
PRIMARY KEY (communityid,userid)
)ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT '社团管理人员表';

-- 插 入数据
insert into managercommuser(communityid,userid)
values
	(1000,1000),
	(1000,1001),
	(1000,1002);
-- 查找数据
select * from managercommuser;

