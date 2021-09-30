ALTER USER hr IDENTIFIED BY hr;

SELECT
    *
FROM
    hr.employees;

SELECT
    first_name,
    last_name,
    job_id
FROM
    hr.employees;

SELECT
    last_name,
    department_id
FROM
    hr.employees
WHERE
    employee_id = 176;

SELECT
    last_name,
    salary
FROM
    hr.employees
WHERE
    salary >= 12000;

SELECT
    last_name,
    salary
FROM
    hr.employees
WHERE
    5000 > salary
    OR salary > 12000;

SELECT
    last_name,
    department_id
FROM
    hr.employees
WHERE
    department_id IN ( 20, 50 );

SELECT
    last_name,
    salary,
    commission_pct
FROM
    hr.employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct ASC;

SELECT
    *
FROM
    hr.employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    hr.employees
WHERE
        hire_date >= '2008/02/20'
    AND hire_date <= '2008/05/01'
ORDER BY
    hire_date DESC;

SELECT
    last_name,
    hire_date
FROM
    hr.employees
WHERE
        hire_date >= '2004/01/01'
    AND hire_date <= '2004/12/31'
ORDER BY
    hire_date ASC;

SELECT
    *
FROM
    hr.employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;

SELECT
    last_name,
    department_id
FROM
    hr.employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000;

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    hr.employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC;

SELECT
    last_name,
    hire_date
FROM
    hr.employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date ASC;

SELECT
    last_name
FROM
    hr.employees
WHERE
    last_name LIKE '%u%';

SELECT
    last_name
FROM
    hr.employees
WHERE
    last_name LIKE '___a%';

SELECT
    last_name
FROM
    hr.employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name ASC;

SELECT
    last_name,
    job_id
FROM
    hr.employees
WHERE
    manager_id IS NULL;

SELECT DISTINCT
    department_id
FROM
    hr.employees
WHERE
        job_id = 'ST_CLERK'
    AND department_id IS NOT NULL;

SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    hr.employees
WHERE
    commission_pct IS NOT NULL;

SELECT
    first_name,
    last_name,
    email,
    phone_number,
    lower(job_id)
FROM
    hr.employees
WHERE
    first_name = 'Curtis';

SELECT
    employee_id,
    first_name
    || ' '
    || last_name,
    department_id,
    job_id
FROM
    hr.employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CUERK' );