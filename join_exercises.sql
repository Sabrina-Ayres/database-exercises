USE
employees;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;


SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'F'
ORDER BY d.dept_name;


SELECT t.title, COUNT(t.emp_no) AS Total
FROM titles AS t
         JOIN dept_emp AS de
              ON de.emp_no = t.emp_no
         JOIN employees e
              ON de.emp_no = e.emp_no
         JOIN departments d
              ON d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01'
  AND d.dept_name = "Customer Service"
GROUP BY t.title;


SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary AS 'Salary'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
         JOIN salaries as s
              ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name;