SQL Practice Queries for Employee and Department Database
This repository contains a set of common and important SQL query examples focused on employee and department data. These queries demonstrate how to use subqueries, aggregate functions, correlated subqueries, and joins to solve practical database problems.

Table of Contents
Project Overview

Database Schema

Queries

How to Use

License

Project Overview
This project includes SQL queries designed to answer real-world business questions such as:

Finding employees earning above average salaries

Identifying departments with the highest-paid employees

Working with date and salary comparisons

Using subqueries and aggregate functions to filter and group data

These queries are commonly used in technical interviews and practical database management tasks.

Database Schema
The SQL queries assume two main tables:

employee
Column Name	Data Type	Description
emp_id	INT (PK)	Employee unique identifier
emp_name	VARCHAR	Employee name
salary	DECIMAL	Employee salary
dept_id	INT (FK)	Foreign key to departments
joining_date	DATE	Date when employee joined

departments
Column Name	Data Type	Description
dept_id	INT (PK)	Department unique identifier
dept_name	VARCHAR	Department name

Queries
Employees earning more than average salary of all employees

Departments where highest-paid employees work

Employees earning more than any employee in 'Sales' department

Employees who joined before average joining date

Departments with no employees

Employee(s) with second highest salary

Employees with max salary in their department

Employees earning more than average salary in their department

Departments with more than one employee

Employees who joined in same year as highest-paid employee

(See the SQL files or the Queries file for full query details.)

How to Use
Set up a database with the employee and departments tables and populate it with sample data.

Run the queries in your SQL client or script to test the outputs.

Modify queries to fit your specific database schema or requirements.

License
This project is licensed under the MIT License. See the LICENSE file for details.
