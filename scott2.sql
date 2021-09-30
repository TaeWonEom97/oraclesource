select sal from emp where ename='JONES';

select * from emp where sal > (select sal from emp where ename='JONES');

select * from emp where comm > (select comm from emp where ename='ALLEN');

select * from emp where hiredate < (select hiredate from emp where ename='WARD');

select empno, ename, job, sal , d.deptno,dname,loc 
from emp e,dept d where e.deptno=d.deptno and d.deptno=20 and e.sal >(select avg(sal) from emp) ;

select * from emp where sal >any (select max(sal) from emp group by deptno);

select * from emp where sal <any (select max(sal) from emp where deptno=30);

select * from emp where sal >all (select max(sal) from emp where deptno=30);

select * from emp where exists (select dname from dept where deptno=10);

select ename, empno, job, sal, d.deptno, dname
from emp e, dept d 
where e.deptno=d.deptno 
and e.job in (select job from emp where ename='ALLEN');

select ename, empno, job, sal,d.deptno, dname, grade 
from emp e,dept d,salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal 
and e.sal>(select avg(sal) from emp) order by e.sal desc, e.empno asc;

select * from emp where sal IN (select max(sal) from emp group by deptno);

select empno, ename, d.deptno, dname, loc 
from (select * from emp where deptno=10) e10,(select *from dept) d
where e10.deptno=d.deptno;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno) 
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno from emp e,salgrade s
where e.sal between s.losal and s.hisal and s.grade=1;

update dept_temp set(dname,loc)=(select dname,loc from dept where deptno=30)
where deptno=40;

update dept_temp set loc='SEOUL' where deptno=(select deptno from dept where dname='ACCOUNTING');

select * from dept_temp;

select * from emp_temp;

delete emp_temp where empno in 
(select empno from emp_temp e,salgrade s 
where e.sal between s.losal and s.hisal and s.grade=3 and deptno=30);


create table EXAM_EMP as select * from emp;
create table EXANM_DEPT2 as select * from dept;
create table EXAM_SALGRADE2 as select * from salgrade;

insert into EXAM_EMP values (7201,'TEST-USER1','MANAGER',7788,'2016-01-02'
,4500,NULL,50);
insert into EXAM_EMP values (7202,'TEST-USER2','CLERK',7201,'2016-02-21'
,1800,NULL,50);
INSERT INTO EXAM_EMP VALUES (7203,'TEST-USER3','ANALYST',7201,'2016-04-11',3400,NULL,60);
insert into EXAM_EMP values (7204,'TEST-USER4','SALESMAN',7201,'2016-05-31'
,2700,300,60);
insert into EXAM_EMP values (7205,'TEST-USER5','CLERK',7201,'2016-07-20'
,2600,NULL,70);
insert into EXAM_EMP values (7206,'TEST-USER6','CLERK',7201,'2016-09-08'
,2600,NULL,70);
insert into EXAM_EMP values (7207,'TEST-USER7','LECTURER',7201,'2016-10-28'
,2300,NULL,80);
insert into EXAM_EMP values (7208,'TEST-USER8','STUDENT',7201,'2018-03-09'
,1200,NULL,80);

SELECT * FROM EXAM_EMP;

update exam_emp set deptno=70 where sal>any(select avg(sal) from exam_emp where deptno=50); 

update exam_emp set deptno=80, sal=sal*1.1 where hiredate>any(select min(hiredate) from exam_emp where deptno=60);

delete from exam_emp where empno in (select empno from exam_emp e, exam_salgrade2 s where e.sal between s.losal and s.hisal and grade=5);

commit;

create table DEPT_TCL as select * from dept;
select * from dept_tcl;

insert into dept_tcl values(50,'DATABASE','SEOUL');

UPDATE DEPT_TCL SET LOC='BUSAN' WHERE DEPTNO=40;

DELETE FROM DEPT_TCL WHERE DNAME='RESEARCH';

ROLLBACK;

COMMIT;

delete from dept_tcl where deptno=50;
commit;

update dept_tcl set loc='SEOUL' where deptno=30;
commit;