use exl;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'Engineering'),
(2, 'Human Resources'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'Sales');

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2),
    joining_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employee (emp_id, emp_name, dept_id, salary, joining_date) VALUES
(101, 'Alice Johnson', 1, 85000, '2021-03-15'),
(102, 'Bob Smith', 2, 55000, '2022-01-10'),
(103, 'Charlie Lee', 1, 95000, '2020-07-23'),
(104, 'Diana Prince', 3, 72000, '2019-11-30'),
(105, 'Ethan Hunt', 4, 65000, '2023-02-25'),
(106, 'Fiona Clark', 5, 60000, '2021-08-14'),
(107, 'George Harris', 5, 58000, '2020-12-05'),
(108, 'Helen Mirren', 1, 105000, '2018-06-19'),
(109, 'Ian Wright', 3, 71000, '2022-09-01'),
(110, 'Jane Foster', 4, 67000, '2020-04-11');

-- Find the names of employees who earn more than the average salary of all employees.

select emp_name from employee
where salary>(select avg(salary) as average_salary from employee);

-- List the department names where the highest-paid employee works.

select dept_name from departments as d
join employee as e on
e.dept_id=d.dept_id
where e.salary=(select max(salary) from employee);

-- Find employees whose salary is greater than any employee in the 'Sales' department.

select emp_name 
from employee e 
join departments d on e.dept_id = d.dept_id
where e.salary > any (
    select e2.salary 
    from employee e2
    join departments d2 on e2.dept_id = d2.dept_id
    where d2.dept_name = 'Sales'
);

-- List the employees who joined before the average joining date of all employees.

select emp_name from employee where
joining_date<(select avg(joining_date) from employee);

-- Find the names of departments that have no employees.

select * from employee
where dept_id not in(select distinct(dept_id) from employee);

-- Find the employee(s) who have the second highest salary.

-- select emp_name from employee
 -- where salary>(select distinct(salary) from employee order by salary desc limit 1 offset 1); 

SELECT MAX(salary) 
FROM employee 
WHERE salary < (SELECT MAX(salary) FROM employee);

-- List the employee(s) whose salary is equal to the maximum salary in their department.
select salary  from employee as e
where salary=(select max(salary) from employee where dept_id=e.dept_id);


-- Display all employees who earn more than the average salary of their own department.

SELECT e.emp_name, e.salary, d.dept_name
FROM employee e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);
-- Find departments that have more than one employee.

select dept_name from departments as d join employee as e on e.dept_id=d.dept_id
group by d.dept_name
having count(*)>1;

-- List employees who joined in the same year as the employee with the highest salary.
select emp_name from employee
where year(joining_date) =(select year(joining_date) from employee where salary =(select max(salary) as highest_salary from employee));

