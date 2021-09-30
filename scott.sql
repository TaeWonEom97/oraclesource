--SQL은 대소문자 구별을안함
--scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

--조회(Select) : 행 단위로 조회, 열 단위로 조회

--emp 테이블 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno,ename,job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

--emp 테이블의 empno,deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;

-- 중복 제거 후 조회: distinct
SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS 직책,
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

--정렬 : ORDER BY 컬럼명 기준(오름차순,내림차순) 

--ename, sal 조회할 때 sal 내림차순으로 정렬

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

SELECT
    empno  AS emplyee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

-- 특정 조건을 기준으로 원하는 데이터를 조회 : where
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'CLERK';

--산술연산자를 사용한 WHERE
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
--오라클 함수

--내장함수 -  1) 문자함수

--              대소문자변경
--              UPPER() : 괄호안 문자를 모두 대문자로 변환
--              LOWER() : 괄호안 문자를 모두 소문자로 변환
--              INITCAP() : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- 문자 길이 구하기
-- LENGTH() : 해당 문자열의 길이 돌려줌
-- LENGTHB() : 해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;

-- 한글자당 3byte 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

-- 문자열 일부를 추출하기
-- SUBSTR(문자열데이터, 시작위치, 추출길이)
-- SUBSTR(문자열데이터, 시작위치)

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

-- 문자열 데이터 안에서 특정 문자를 찾기
-- INSTR(문자열, 찾을 문자열, 시작위치, 몇번째에 있는걸 찾을 것인지) 
-- 해당 문자열의 길이를 알려줌
SELECT
    instr('hello,oracle!', 'l'),
    instr('hello,oracle!', 'l', 5),
    instr('hello,oracle!', 'l', 2, 2)
FROM
    dual;

SELECT
    instr('이것이 oracle이다. 이것도 오라클이다', '이것')
FROM
    dual;

SELECT
    instr('이것이 oracle이다. 이것도 오라클이다', '이것', 3)
FROM
    dual;

SELECT
    instr('이것이 oracle이다. 이것도 오라클이다', '이것', 1, 2)
FROM
    dual;

SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';

-- 특정 문자를 다른 문자로 바꾸는 함수
-- replace(문자열 데이터,찾는 문자, 바꿀문자)
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

-- 두 문자열 데이터를 합치는 함수
-- CONCAT(문자열1,문자열2)
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- || : 문자열 데이터 연결 연산자    
SELECT
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';
    
--문자열 함수 : 공백제거
SELECT
    '   이것이 ',
    TRIM('  이것이 ')
FROM
    dual;

SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim_training,
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;
    
select
round(1234.5678) AS trunc,
round(1234.5678, 0) AS trunc0,
round(1234.5678, 1) AS trunc1,
round(1234.5678, 2) AS trunc2,
round(1234.5678, - 1) AS trunc_minus1,
round(1234.5678, - 2) AS trunc_minus2
from dual;

select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14) from dual;