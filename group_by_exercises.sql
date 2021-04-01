USE employees;

SELECT DISTINCT title FROM titles;


SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE ('E%')
   AND (
        last_name LIKE ('%e')
    )
GROUP BY last_name;


SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE ('E%')
  AND (
        last_name LIKE ('%e')
    )
GROUP BY first_name, last_name;


SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE ('%q%')
  AND (
        last_name NOT LIKE ('%qu%')
    )
GROUP BY last_name;


SELECT DISTINCT COUNT(last_name), last_name
FROM employees
WHERE last_name LIKE ('%q%')
  AND (
        last_name NOT LIKE ('%qu%')
    )
GROUP BY last_name;


SELECT DISTINCT COUNT(gender), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;