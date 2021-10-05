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

create table EMP_DDL(
    EMPNO NUMBER(4), --숫자로 네자리까지만 허용하겠음
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER,
    HIREDATE DATE,
    SAL NUMBER(7,2), --숫자 7자리까지 소수점 2자리까지
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

DESC EMP_DDL;

DROP TABLE EMP_DDL;

CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;
CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT WHERE DEPTNO=30;
CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;
SELECT * FROM DEPT_DDL2;

CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER ADD HP VARCHAR(20);

ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);

ALTER TABLE EMP_ALTER DROP COLUMN TEL;

RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_RENAME;

SELECT * FROM EMP_RENAME;
TRUNCATE TABLE EMP_RENAME;

CREATE TABLE MEMBER(
 ID CHAR(8),
 NAME VARCHAR2(10),
 ADDR VARCHAR2(50),
 NATION CHAR(4),
 EMAIL VARCHAR2(50),
 AGE NUMBER(7,2)
 );
 
 ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);
 
 ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
 
 ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;
 
 DESC MEMBER;
 
 create view vm_emp20 as (select empno,ename,job, deptno from emp where deptno=20);
 
 select * from vm_emp20;
 
 create view vm_emp as select * from emp;
 
 select * from vm_emp;
 
 update vm_emp set job = 'SALESMAN' where empno=7369;
 
 insert into vm_emp values(6666,'KIM','NETWORK',null,'20/10/05',2650,null,20);
 
 delete from vm_emp where empno=6666;
 
 create view vm_emp30read as select empno,ename,job, deptno from emp where deptno=30 with read only;
 
 CREATE SEQUENCE SEQ_DEPT_SEQEUNCE
 INCREMENT BY 10 START WITH 10 MAXVALUE 90 MINVALUE 0
 NOCYCLE CACHE 2;
 
 drop view vm_emp;
 
 CREATE TABLE DEPT_SEQUENCE AS SELECT * FROM DEPT WHERE 1<>1;
 
 INSERT INTO DEPT_SEQUENCE(DEPTNO,DNAME,LOC) 
 VALUES(SEQ_DEPT_SEQEUNCE.NEXTVAL,'DATABASE','SEOUL');
 
 ALTER SEQUENCE SEQ_DEPT_SEQEUNCE
 INCREMENT BY 3
 MAXVALUE 99
 CYCLE;
 
 DROP SEQUENCE SEQ_DEPT_SEQEUNCE;
 
 SELECT * FROM DEPT_SEQUENCE;
 
 CREATE INDEX IDX_EMP_SAL ON emp(SAL);
 
 DROP INDEX IDX_EMP_SAL;
 
 CREATE TABLE USERTBL(USERID CHAR(8) NOT NULL PRIMARY KEY, USERNAME VARCHAR(10) NOT NULL);
 
 
 
 
 CREATE TABLE EMPIDX AS SELECT * FROM EMP WHERE 1<>1;
 CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);
 
 CREATE VIEW EMPIDX_OVER15K AS (SELECT EMPNO,ENAME,JOB,DEPTNO,SAL,COMM FROM EMPIDX WHERE SAL>1500);
 

 CREATE TABLE DEPTSEQ2 AS SELECT * FROM DEPT;
 
 CREATE SEQUENCE SEQ_DEPT_SEQUENCE2 
 INCREMENT BY 1
 START WITH 1
 MAXVALUE 99
 MINVALUE 1
 NOCYCLE NOCACHE;
 
 INSERT INTO DEPTSEQ2 VALUES(SEQ_DEPT_SEQUENCE2.NEXTVAL,'DATABASE','SEOUL');
  INSERT INTO DEPTSEQ2 VALUES(SEQ_DEPT_SEQUENCE2.NEXTVAL,'WEB','BUSAN');
   INSERT INTO DEPTSEQ2 VALUES(SEQ_DEPT_SEQUENCE2.NEXTVAL,'MOBILE','ILSAN');
 
 SELECT * FROM DEPTSEQ2;

CREATE TABLE TABLE_NOTNULL(
    LOGIN_ID VARCHAR(20) NOT NULL,
    LOGIN_PWD VARCHAR(20)NOT NULL,
    TEL VARCHAR(20));
 
 INSERT INTO TABLE_NOTNULL VALUES('TEST_01',NULL,'010-1234-1234');
 INSERT INTO TABLE_NOTNULL(LOGIN_ID,LOGIN_PWD) VALUES('TEST_01','TEST_01');
 SELECT * FROM TABLE_NOTNULL;
 
 CREATE TABLE TABLE_NOTNULL2(
    LOGIN_ID VARCHAR(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    LOGIN_PWD VARCHAR(20) CONSTRAINT TBLNN2_LGNPWD_NN NOT NULL,
    TEL VARCHAR(20));
    
    SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME='TABLE_NOTNULL2';
 SELECT * FROM TABLE_NOTNULL;   
 UPDATE TABLE_NOTNULL SET TEL='010-2022-2222'WHERE LOGIN_ID='TEST_01';
 ALTER TABLE TABLE_NOTNULL MODIFY(TEL NOT NULL); 
 
 SELECT * FROM TABLE_NOTNULL2;
 ALTER TABLE TABLE_NOTNULL2 MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);
 
 ALTER TABLE TABLE_NOTNULL2 RENAME CONSTRAINT TBLNN_TEL_NN TO TBLENN2_TEL_NN;

 ALTER TABLE TABLE_NOTNULL2 DROP CONSTRAINT TBLENN2_TEL_NN;
 
 CREATE TABLE TABLE_UNIQUE(
    LOGIN_ID VARCHAR(20) UNIQUE,
    LOGIN_PWD VARCHAR(20) NOT NULL,
    TEL VARCHAR2(20));
   
SELECT OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
    
INSERT INTO TABLE_UNIQUE VALUES('TEST_ID_01','PWD081','010-2345-6789');

 CREATE TABLE TABLE_UNIQUE2(
    LOGIN_ID VARCHAR(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
    LOGIN_PWD VARCHAR(20) CONSTRAINT TBLUNQ2_LGNPWD_UNQ NOT NULL,
    TEL VARCHAR2(20));
    
ALTER TABLE TABLE_UNIQUE MODIFY(TEL UNIQUE);  

 CREATE TABLE TABLE_PK(
    LOGIN_ID VARCHAR(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR(20) NOT NULL,
    TEL VARCHAR2(20));

INSERT INTO TABLE_PK VALUES('TEST_01','PWD01','010-2121-2112');
INSERT INTO TABLE_PK VALUES('TEST_01','PWD01','010-2121-2112');

 CREATE TABLE TABLE_PK2(
    LOGIN_ID VARCHAR(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR(20) NOT NULL,
    TEL VARCHAR2(20));
    
CREATE TABLE TABLE_CON(
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(20),
    COL3 VARCHAR(20),
    PRIMARY KEY(COL1),
    CONSTRAINT TBLCON_UNQ UNIQUE(COL2));
    
CREATE TABLE DEPT_FK(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));
    
CREATE TABLE EMP_FK(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)ON DELETE CASCADE);

INSERT INTO DEPT_FK VALUES(10,'DATABASE','SEOUL');    
INSERT INTO EMP_FK VALUES(9999,'TEST_NAME','TEST_JO ',NULL,'21-10-05',3000,NULL,10); 



DELETE FROM EMP_FK WHERE DEPTNO = 10;
DELETE FROM DEPT_FK WHERE DEPTNO = 10;

CREATE TABLE DEPT_FK2(
    DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK2 PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13));

CREATE TABLE EMP_FK2(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK2 PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK2 REFERENCES DEPT_FK(DEPTNO)ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');    
INSERT INTO EMP_FK2 VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10); 

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK2;


CREATE TABLE EMP_FK3(
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK3 PRIMARY KEY,
    ENAME VARCHAR(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK3 REFERENCES DEPT_FK2(DEPTNO)ON DELETE SET NULL);
    
INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');    
INSERT INTO EMP_FK3 VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);     

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK3;

DELETE FROM DEPT_FK2 WHERE DEPTNO = 10;

create table table_check(
    login_id varchar2(20) constraint tblck_lgnid_pk primary key,
    login_pwd varchar2(20) constraint tblck_lgnpwd_nn check (length(login_pwd)>3),
    tel varchar2(20));
insert into table_check values('test_id','1234','010-1234-2222');

create table table_default(
    login_id varchar2(20) constraint tbldf_lgnid_pk primary key,
    login_pwd varchar2(20) default '1234',
    tel varchar2(20));
    
insert into table_default(login_id,login_pwd) values('test_id','test_id');

insert into table_default(login_id,tel) values('test_id2','010-2222-2222');

insert into table_default(login_id,login_pwd,tel) values('test_id3',null,'010-2222-2222');

select * from table_default;

--문1
CREATE TABLE DEPT_CONST(
    DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
    DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
    LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL);
--문2    
CREATE TABLE EMP_CONST(
    EMPNO NUMBER(2) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
    JOB VARCHAR2(9),
    TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
    HIREDATE DATE,
    SAL NUMBER(7,2)  CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO)
    );
    
 DROP TABLE EMP_CONST; 
 DROP TABLE DEPT_CONST;

drop USER C##test;