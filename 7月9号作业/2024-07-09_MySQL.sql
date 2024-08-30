use demo01;


create table student(sid integer,sname varchar(20),ssex char(2), sage integer,birthday date,score double,classId integer);

insert into student 
values
(1,'张三','男',23,'2016-08-04',91.5,101),
(2,'李四','男',23,'2016-02-01',83,102),
(3,'王五','女',24,'2015-11-28',82.5,102),
(4,'赵六','女',23,'2016-05-24',94,103),
(5,'刘七','男',22,'2017-02-10',79.5,101),
(6,'于八','女',22,'2017-06-10',null,103);


create table className (classId integer ,cname varchar(20),classroom varchar(20),tid integer);

insert into className
values
(101,'软件工程1班','2号教学楼202',20190210),
(102,'软件工程2班','1号教学楼103',20183025),
(103,'软件工程3班','2号教学楼206',20190210),
(104,'计算机1班','3号教学楼303',20200222);


create table teacher (tid integer ,tname varchar(20),teach varchar(20));

insert into teacher
values
(20190210,'李晓','操作系统'),
(20183025,'王峰','数据库原理'),
(20200222,'赵毅','设计模式');




# 将及格的学生按照成绩从高到低进行排序，如果成绩并列，就按照班级顺序升序排列，如果班级也相同，就按照学号升序排列。

select student.score, classname.classid, classname.tid 
from student
join classname 
on student.classid = classname.classid
where score>60
order by score desc, classid asc, tid asc;


# 查询每名学生是哪位老师上课，在哪个教室上课。

select student.sname, teacher.tname, classname.classroom
from classname
join teacher
on classname.tid = teacher.tid
join student
on classname.classid = student.classid;



# 查询在2号教学楼上课的男同学的信息。

select student.*, classname.classroom
from student
join classname
on student.classid = classname.classid
where classroom like '2%' and ssex = '男';



# 查询所有在2号教学楼讲“操作系统”课程的老师对应的授课班级名称。

select teacher.tname, teacher.teach, classname.cname, classname.classroom
from teacher
join classname
on teacher.tid = classname.tid
where classroom like '2%' and teach = '操作系统';



# 查看所有老师（在校的全部老师）讲授的学生，请编写SQL语句进行查询。

select teacher.tname, student.sname
from teacher, student
order by tname;



# 查看所有老师（全部讲师）对应所有教室（所有教室）的信息，请写一条SQL语句来实现此功能。

select teacher.tname, classname.classroom
from teacher, classname
order by tname;



