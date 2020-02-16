--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  e.emp_no     "employee number"
		,last_name "last name"
		,first_name "first name"
		,gender
		,salary
FROM public.employees e
	LEFT JOIN public.salaries s ON e.emp_no = s.emp_no
;
--List employees who were hired in 1986.
SELECT *
FROM public.employees
WHERE date_part('year', hire_date) = 1986
;
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT  dm.dept_no   "department number"
		,d.dept_name "department name"
		,dm.emp_no   "employee number"
		,e.last_name "last name"
		,e.first_name "first name"
		,dm.from_date "employment start date"
		,dm.to_date   "employment end date"
FROM public.dept_manager dm
	LEFT JOIN public.departments d on dm.dept_no = d.dept_no
	LEFT JOIN public.employees e on dm.emp_no = e.emp_no
;
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  dm.emp_no   "employee number"
		,e.last_name "last name"
		,e.first_name "first name"
        ,d.dept_name "department name"
FROM public.dept_emp dm
	LEFT JOIN public.departments d on dm.dept_no = d.dept_no
	LEFT JOIN public.employees e on dm.emp_no = e.emp_no
;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM public.employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT  dm.emp_no   "employee number"
		,e.last_name "last name"
		,e.first_name "first name"
        ,d.dept_name "department name"
FROM public.dept_emp dm
	LEFT JOIN public.departments d on dm.dept_no = d.dept_no
	LEFT JOIN public.employees e on dm.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  dm.emp_no   "employee number"
		,e.last_name "last name"
		,e.first_name "first name"
        ,d.dept_name "department name"
FROM public.dept_emp dm
	LEFT JOIN public.departments d on dm.dept_no = d.dept_no
	LEFT JOIN public.employees e on dm.emp_no = e.emp_no
WHERE d.dept_name IN ( 'Sales', 'Development')
;
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT  last_name
		,COUNT(last_name)
FROM public.employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;