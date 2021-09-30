SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20210912', 'YYYY-MM-DD')   AS todate2
FROM
    dual;

SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'YYYY-MM-DD');

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

--DECODE 함수
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
--case함수
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5, 2)     AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN mgr >= 7500
             AND mgr < 7600 THEN
            '5555'
        WHEN mgr >= 7600
             AND mgr < 7700 THEN
            '6666'
        WHEN mgr >= 7700
             AND mgr < 7800 THEN
            '7777'
        WHEN mgr >= 7800
             AND mgr < 7000 THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', to_char(mgr)) AS chg_mgr
FROM
    emp;
    
SELECT
    empno,
    ename,
    mgr,
    case
    WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2)='75' THEN
            '5555'
        WHEN substr(to_char(mgr), 1, 2)='76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2)='77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2)='78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;
    
 -- 다중행 함수 : sum()
 select sum(sal) from emp;
 
 select count(*) from emp;
select count(distinct sal) from emp; 
 
select max(sal) from emp where deptno=10;
select min(sal) from emp where deptno=10;

select min(hiredate) from emp where deptno=20;

select avg(distinct sal) from emp where deptno=30;

select sum(sal),deptno from emp group by deptno order by deptno;

select avg(sal),deptno from emp group by deptno;

select avg(sal),deptno,job from emp group by deptno,job order by deptno,job;

select avg(sal),deptno,job from emp where sal<=3000 group by deptno,job having avg(sal)>=2000 order by deptno,job;

select deptno, trunc(avg(sal),0) as AVG_SAL, max(sal) as MAX_SAL, min(sal) as MIN_SAL, count(*) from emp group by deptno order by deptno;

select job,count(*) from emp group by job having count(job)>=3;

select to_char(hiredate, 'YYYY') AS HIRE_YEAR, deptno, count(*)as CNT from emp group by to_char(hiredate, 'YYYY'),deptno order by deptno;

create table dept_temp as select * from dept;

insert into dept_temp(deptno,dname,loc) values(50,'DATABASE','SEOUL');

insert into dept_temp  values(60,'NETWORK','BUSAN');
insert into dept_temp(dname,loc,DEPTNO) values('NETWORK','BUSAN',70);
insert into dept_temp(DEPTNO,dname) values(90,'DATABASE');
insert into dept_temp(DEPTNO,dname,loc) values(91,'WEB',NULL);
insert into dept_temp(DEPTNO,dname,loc) values(92,'MOBILE','');
select * from dept_temp;

commit;