SELECT
    last_name,
    salary,
    CASE
        WHEN salary >= 0
             AND salary <= 1999 THEN
            0
        WHEN salary >= 2000
             AND salary <= 3999 THEN
            0.09
        WHEN salary >= 4000
             AND salary <= 5999 THEN
            0.2
        WHEN salary >= 6000
             AND salary <= 7999 THEN
            0.3
        WHEN salary >= 8000
             AND salary <= 9999 THEN
            0.4
        WHEN salary >= 10000
             AND salary <= 11999 THEN
            0.42
        WHEN salary >= 12000
             AND salary < 13999 THEN
            0.44
        WHEN salary >= 14000 THEN
            0.45
    END AS tax_rate
FROM
    hr.employees where department_id=80;

SELECT
    last_name,
    salary,
    decode(trunc(salary / 2000, 0), 0, 0.00, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.40, 5, 0.42, 6, 0.44,
           0.45) AS tax_rate
FROM
    hr.employees
WHERE
    department_id = 80;
    
select max(salary)-min(salary) as sal , count(distinct manager_id) as mng from HR.employees;    