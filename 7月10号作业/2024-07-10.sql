# 1.按照 班级名称 统计每个班级成绩 最高分 和 最低分，请编写SQL语句完成此功能。
select classname.cname, max(ifnull(score,0)) '最高分', min(ifnull(score,0)) '最低分'
from classname, student
where classname.classid = student.classid
group by classname.cname;


# 2.查询每位老师所带班级的 平均成绩，请编写SQL语句完成此功能。
select teacher.tname, classname.cname, avg(ifnull(score,0)) '平均成绩'
from teacher
join classname
on teacher.tid = classname.tid
join student
on classname.classid = student.classid
group by teacher.tname,classname.cname;

# 3.查询哪些班级及格学生人数在10以上，显示出班级名称和人数，请编写SQL语句完成此功能。
select  cname, count(sid) '人数'
from classname
join student
on classname.classid = student.classid
where score >= 60
group by cname
having count(sid) > 10;


# 4.查询软件工程1班的成绩前3名的学生信息，请编写SQL语句完成此功能。
select sid, sname, ssex, sage, birthday, score, student.classid
from classname
join student
on classname.classid = student.classid
where cname = '软件工程1班'
order by score desc
limit 3;


# 5.查询软件工程2班成绩最高的学生是谁，请编写SQL语句完成此功能。
select sname, score
from classname
join student
on classname.classid = student.classid
where cname = '软件工程2班' 
order by score desc
limit 1;


# 6.查询每一位讲师 所带 每个班级中成绩最高的学生 是谁，请编写SQL语句完成此功能
select tname, cname, sname, score '最高分' 
from teacher
join classname
on teacher.tid = classname.tid
join student
on classname.classid = student.classid
where score in(select max(ifnull(score,0)) from student group by classid)
order by tname, cname;


# 7.哪位老师所带 班级平均成绩 是最高的，请编写SQL语句完成此功能
select tname, cname, avg(ifnull(score,0)) '班平均分'
from teacher
join classname
on teacher.tid = classname.tid
join student
on classname.classid = student.classid
group by cname, tname
order by avg(ifnull(score,0)) desc
limit 1;


