--Employees and their salaries
SELECT employees.emp_no, 
	first_name, 
	last_name, 
	gender, 
	salaries.salary 
FROM employees
LEFT JOIN salaries 
ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--Employees hired in 1986
SELECT first_name,
last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND
'1986-12-31';

--Information for each manager
SELECT dept_manager.dept_no,
	dept_manager.emp_no,
	departments.dept_name,
	employees.first_name,
	employees.last_name,
	dept_manager.from_date,
	dept_manager.to_date
FROM dept_manager
INNER JOIN departments 
ON (dept_manager.dept_no = departments.dept_no)
INNER JOIN employees 
ON (dept_manager.emp_no = employees.emp_no);

--Employees and their departments
SELECT employees.first_name,
	employees.last_name,
	dept_emp.emp_no,
	departments.dept_name
FROM dept_emp
INNER JOIN employees 
ON (dept_emp.emp_no = employees.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no);

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, 
	employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


--Frequency of last names
SELECT last_name,
COUNT(*) 
FROM employees
GROUP BY last_name;

