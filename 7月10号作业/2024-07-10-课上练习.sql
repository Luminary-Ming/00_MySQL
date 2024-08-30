
# 1.查询入职日期最早的员工姓名，入职日期

select ename, min(hiredate)
from emp
group by ename
limit 1;


# 2.查询工资比SMITH工资高并且工作地点在CHICAGO的员工姓名，工资，部门名称。

select ename, sal, dname
from emp, dept
where sal>(
select sal
from emp
where ename = 'SMITH'
) and loc = 'CHICAGO';


# 3.查询部门平均工资 高于 10号部门平均工资 的部门编号和平均工资。

select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>(select avg(sal)
from emp
where deptno = 10);


# 4.查询入职日期比10部门任意一个员工晚的员工姓名、入职日期，不包括10部门员工

select ename, hiredate
from emp
where hiredate >any(
select hiredate
from emp
where deptno = 10
) and deptno != 10;


# 5.查询入职日期比10部门所有员工晚的员工姓名、入职日期，不包括10部门员工

select ename, hiredate
from emp
where hiredate >all(
select hiredate
from emp
where deptno = 10
) and deptno != 10;



# 6.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工

select ename, hiredate
from emp
where hiredate =any(
select hiredate
from emp
where deptno = 10
) and deptno != 10;


# 1.查询工资高于编号为7782的员工工资，并且和7369号员工从事相同工作的员工的编号、姓名及工资。
select  empno, ename, sal
from emp
where sal > (
select sal
from emp
where empno = 7782)
and job = (
select job
from emp
where empno = 7369
);



# 2.查询工资最高的员工姓名和工资。
select ename, sal
from emp
order by sal desc
limit 1;


# 3.查询高于 20号部门最低工资 的员工的编号和姓名及工资。
select empno, ename, sal
from emp
where sal > (
select min(sal)
from emp
where deptno = 20
);


# 4.显示经理是KING的员工姓名，工资。
select ename, sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);


# 5.显示比 10号部门所有员工入职时间 都要晚的 员工姓名，参加工作时间。
select ename, hiredate
from emp
where hiredate > all(
select hiredate
from emp
where deptno = 10
);


# 6.查询部门最低工资 高于 10号部门最低工资 的部门的编号、名称及部门最低工资。（选做）
select dept.deptno, dname, min(sal)
from emp,dept
group by dept.deptno
having min(sal) > (
select min(sal)
from emp
where emp.deptno = 10
);




























