mysql> create database t_s;
Query OK, 1 row affected (0.02 sec)

mysql> use t_s;
Database changed
mysql> create table student(sno varchar(7) primary key,sname varchar(10) not null,ssex varchar(2),sage integer,dept varchar(20));
Query OK, 0 rows affected (0.09 sec)

mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | varchar(7)  | NO   | PRI | NULL    |       |
| sname | varchar(10) | NO   |     | NULL    |       |
| ssex  | varchar(2)  | YES  |     | NULL    |       |
| sage  | int         | YES  |     | NULL    |       |
| dept  | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> create table course(cno varchar(10) primary key,cname varchar(20) not null,credit integer,semester integer);
Query OK, 0 rows affected (0.09 sec)

mysql> desc course;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cno      | varchar(10) | NO   | PRI | NULL    |       |
| cname    | varchar(20) | NO   |     | NULL    |       |
| credit   | int         | YES  |     | NULL    |       |
| semester | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> create table sc(sno varchar(7),cno varchar(10),grade integer,primary key (sno,cno));
Query OK, 0 rows affected (0.06 sec)

mysql> desc sc;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | varchar(7)  | NO   | PRI | NULL    |       |
| cno   | varchar(10) | NO   | PRI | NULL    |       |
| grade | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> insert into student 
values
(0811101,'李勇','男',21,'计算机系'),
(0811102,'刘晨','男',20,'计算机系'),
(0811103,'王敏','女',20,'计算机系'),
(0811104,'张小红','女',19,'计算机系'),
(0821101,'张立','男',20,'信息管理系'),
(0821102,'吴宾','女',22,'信息管理系'),
(0821103,'张海','男',19,'信息管理系'),
(0831101,'钱小平','女',21,'通信工程系'),
(0831102,'王大力','男',20,'通信工程系'),
(0831103,'张珊珊','女',19,'通信工程系');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from student;
+--------+--------+------+------+------------+
| sno    | sname  | ssex | sage | dept       |
+--------+--------+------+------+------------+
| 811101 | 李勇   | 男   |   21 | 计算机系   |
| 811102 | 刘晨   | 男   |   20 | 计算机系   |
| 811103 | 王敏   | 女   |   20 | 计算机系   |
| 811104 | 张小红 | 女   |   19 | 计算机系   |
| 821101 | 张立   | 男   |   20 | 信息管理系 |
| 821102 | 吴宾   | 女   |   22 | 信息管理系 |
| 821103 | 张海   | 男   |   19 | 信息管理系 |
| 831101 | 钱小平 | 女   |   21 | 通信工程系 |
| 831102 | 王大力 | 男   |   20 | 通信工程系 |
| 831103 | 张珊珊 | 女   |   19 | 通信工程系 |
+--------+--------+------+------+------------+
10 rows in set (0.04 sec)

mysql> insert into course
values
('C001','高等数学',4,1),
('C002','大学英语',3,1),
('C003','大学英语',3,2),
('C004','计算机文化学',2,2),
('C005','Java',2,3),
('C006','数据库基础',4,5),
('C007','数据结构',4,4),
('C008','计算机网络',4,4);
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from course;
+------+--------------+--------+----------+
| cno  | cname        | credit | semester |
+------+--------------+--------+----------+
| C001 | 高等数学     |      4 |        1 |
| C002 | 大学英语     |      3 |        1 |
| C003 | 大学英语     |      3 |        2 |
| C004 | 计算机文化学 |      2 |        2 |
| C005 | Java         |      2 |        3 |
| C006 | 数据库基础   |      4 |        5 |
| C007 | 数据结构     |      4 |        4 |
| C008 | 计算机网络   |      4 |        4 |
+------+--------------+--------+----------+
8 rows in set (0.04 sec)

mysql> insert into sc
values
(0811101,'C001',96),
(0811101,'C002',80),
(0811101,'C003',84),
(0811101,'C005',62),
(0811102,'C001',92),
(0811102,'C002',90),
(0811102,'C004',84),
(0811102,'C006',76),
(0811102,'C003',85),
(0811102,'C005',73),
(0811102,'C007',null),
(0811103,'C001',50),
(0811103,'C004',80),
(0831101,'C001',50),
(0831101,'C004',80),
(0831102,'C007',null),
(0831103,'C004',78),
(0831103,'C005',65),
(0831103,'C007',null);
Query OK, 19 rows affected (0.01 sec)
Records: 19  Duplicates: 0  Warnings: 0

mysql> select * from sc;
+--------+------+-------+
| sno    | cno  | grade |
+--------+------+-------+
| 811101 | C001 |    96 |
| 811101 | C002 |    80 |
| 811101 | C003 |    84 |
| 811101 | C005 |    62 |
| 811102 | C001 |    92 |
| 811102 | C002 |    90 |
| 811102 | C003 |    85 |
| 811102 | C004 |    84 |
| 811102 | C005 |    73 |
| 811102 | C006 |    76 |
| 811102 | C007 | NULL  |
| 811103 | C001 |    50 |
| 811103 | C004 |    80 |
| 831101 | C001 |    50 |
| 831101 | C004 |    80 |
| 831102 | C007 | NULL  |
| 831103 | C004 |    78 |
| 831103 | C005 |    65 |
| 831103 | C007 | NULL  |
+--------+------+-------+
19 rows in set (0.03 sec)

mysql> 