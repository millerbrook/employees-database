--Query 1: List the following details of each employee: employee number, last name, first name, sex, and salary.
--Uses a simple inner join to bring salary in
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no;

--Query 2:  List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE RIGHT(hire_date, 4) = '1986';

--Query 3: List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
--Try using joins: dept_name from departments, last_name and first_name from employees
SELECT dm.dept_no, dm.emp_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager AS dm
INNER JOIN departments ON
departments.dept_no = dm.dept_no
INNER JOIN employees ON
employees.emp_no = dm.emp_no;

--Query 4:  List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp as de
INNER JOIN employees ON
employees.emp_no = de.emp_no
INNER JOIN departments ON
departments.dept_no = de.dept_no;

--Query 5:  List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE
    first_name = 'Hercules' AND
	last_name LIKE 'B%';

--Query 6: List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
--Try View and Subquery

--weird problem -- some employees listed in more than one department? so, should all departments
--be recorded for these employees
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp AS de
INNER JOIN departments ON
departments.dept_no = de.dept_no
INNER JOIN employees ON
employees.emp_no = de.emp_no
WHERE employees.emp_no IN
    (
        SELECT emp_no
        FROM dept_emp
        WHERE dept_no IN
        (
            SELECT dept_no
            FROM departments
            WHERE dept_name = 'Sales'
        )
    );

--Query 7: List all employees in the Sales and Development departments, including their employee 
--number, last name, first name, and department name.
--weird problem -- some employees listed in more than one department? so, should all departments
--be recorded for these employees
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp AS de
INNER JOIN departments ON
departments.dept_no = de.dept_no
INNER JOIN employees ON
employees.emp_no = de.emp_no
WHERE employees.emp_no IN
    (
        SELECT emp_no
        FROM dept_emp
        WHERE dept_no IN
        (
            SELECT dept_no
            FROM departments
            WHERE 
                (dept_name = 'Sales') OR
                (dept_name = 'Development')
        )
    );

--Query 8: In descending order, list the frequency count of employee last names, i.e., how many 
--employees share each last name.
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC
