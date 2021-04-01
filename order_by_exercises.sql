USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
  AND (
        gender = 'M'
    )
ORDER BY last_name ASC, first_name ASC;


SELECT *
FROM employees
WHERE last_name LIKE ('%E%')
ORDER BY emp_no DESC;


SELECT *
FROM employees
WHERE last_name LIKE ('%q%');


SELECT *
FROM employees
WHERE last_name LIKE ('E%')
   OR (
        last_name LIKE ('%e')
    );


SELECT *
FROM employees
WHERE last_name LIKE ('E%')
  AND (
        last_name LIKE ('%e')
    );


SELECT *
FROM employees
WHERE last_name LIKE ('%q%')
  AND (
    last_name ! ('%qu%')
    );