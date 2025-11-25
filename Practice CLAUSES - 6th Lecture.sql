#SCHEMA (Create Database + Tables + Insert Data)

CREATE DATABASE schooldb;
USE schooldb;

#Create Tables
 
CREATE TABLE students (
 student_id INT PRIMARY KEY,
 name VARCHAR(50),
 gender VARCHAR(10),
 marks INT,
 city VARCHAR(50),
 class VARCHAR(10)
);

#employees
CREATE TABLE employees (
 emp_id INT PRIMARY KEY,
 emp_name VARCHAR(50),
 department VARCHAR(50),
 salary INT,
 age INT,
 location VARCHAR(50)
);

#products
CREATE TABLE products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(100),
 price INT,
 category VARCHAR(50),
 stock INT
);

# orders
CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 product_name VARCHAR(100),
 quantity INT,
 order_date DATE
);

#Insert Sample Data
#students

INSERT INTO students VALUES
(1, 'Aman', 'Male', 85, 'Delhi', '10th'),
(2, 'Ritu', 'Female', 92, 'Mumbai', '12th'),
(3, 'Ravi', 'Male', 74, 'Kolkata', '10th'),
(4, 'Neha', 'Female', 60, 'Pune', '11th'),
(5, 'Ankit', 'Male', 55, 'Delhi', '12th'),
(6, 'Pooja', 'Female', 89, 'Jaipur', '10th');

#employees

INSERT INTO employees VALUES
(101, 'John', 'IT', 85000, 28, 'Delhi'),
(102, 'Smith', 'HR', 55000, 32, 'Mumbai'),
(103, 'Amit', 'Finance', 92000, 45, 'Pune'),
(104, 'Riya', 'Sales', 48000, 26, NULL),
(105, 'Karan', 'IT', 112000, 38, 'Kolkata'),
(106, 'Divya', 'Marketing', 65000, 30, 'Delhi');

#products

INSERT INTO products VALUES
(201, 'Laptop Pro Max', 85000, 'Electronics', 15),
(202, 'Smartphone X', 35000, 'Electronics', 25),
(203, 'Toy Car', 1200, 'Toys', 60),
(204, 'Washing Machine', 45000, 'Home Appliances', 10),
(205, 'Books Bundle', 800, 'Stationery', 90),
(206, 'Doll House', 3000, 'Toys', 35);

#orders

INSERT INTO orders VALUES
(301, 'Aman', 'Laptop Pro Max', 1, '2024-01-10'),
(302, 'Ritu', 'Toy Car', 2, '2024-02-05'),
(303, 'Ravi', 'Smartphone X', 1, '2024-02-15'),
(304, 'Neha', 'Books Bundle', 3, '2024-03-01'),
(305, 'Ankit', 'Doll House', 1, '2024-03-12'),
(306, 'John', 'Washing Machine', 1, '2024-03-20');

-- SQL Clause Practice Questions
-- WHERE Clause

 -- 1 --Students who scored more than 80.
 SELECT * FROM students 
 WHERE marks > 80;
 
 -- 2 -- Employees whose salary is greater than 70,000.
 SELECT * FROM Employees
 WHERE salary > 70000;
 
 -- 3 -- Products priced less than 2000.
 SELECT * FROM Products
 WHERE price < 2000;
 
 -- 4 -- Orders placed after 2024-02-01.
 SELECT * FROM Orders
 WHERE order_date > 2024-02-01;
 
 -- 5 -- Employees whose department is not 'HR'
SELECT * FROM Employees 
WHERE department != 'HR';

# Wildcards

 -- 6 -- Student names starting with 'A'.
 SELECT * FROM Students
 WHERE name LIKE 'A%';
 
 -- 7 -- Employees whose name ends with 'a'.
 SELECT * FROM Employees
 WHERE emp_name LIKE '%a';
 
 -- 8 -- Cities containing 'pur'.
SELECT * FROM Students
Where City LIKE '%pur%';

-- 9 -- Product names having word “Pro”.
SELECT * FROM Products
WHERE product_name LIKE '%Pro%';

-- 10 -- Customer names with second character as 'a'.
SELECT * FROM Orders
WHERE customer_name LIKE '_a%';

#  IN / NOT IN

-- 11 -- Students from (Delhi, Mumbai, Jaipur).
SELECT * FROM Students
WHERE city IN ('Delhi', 'Mumbai', 'Jaipur');

-- 12 -- Employees NOT in departments (IT, HR).
SELECT * FROM Employees 
WHERE department NOT IN ('IT','HR');

-- 13 --  Products in category (Electronics, Toys).
SELECT * FROM Products
WHERE category IN ('Electronics','Toys');

# BETWEEN


-- 14 -- Students with marks between 60 and 90.
SELECT * FROM Students
WHERE Marks BETWEEN 60 AND 90;

-- 15 -- Products priced between 500 and 5000.
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 5000;

-- 16 --  Employees aged between 25 and 35.
SELECT * FROM Employees
WHERE age BETWEEN 25 AND 35;

# ORDER BY

-- 17 --  List employees sorted by salary (descending).
SELECT * FROM Employees
ORDER BY salary DESC;

-- 18 -- Products sorted by stock (ascending).
SELECT * FROM Products
ORDER BY stock ASC;

-- 19 --  Students sorted by marks (highest first).
SELECT * FROM Students
ORDER BY Marks DESC;

# GROUP BY

-- 20 -- Count students in each class.
SELECT class, Count(class) AS Total_students
FROM Students
GROUP BY class;

-- 21 --  Total salary of each department.
SELECT salary, Count(*) AS Total_salary
FROM Employees
GROUP BY salary;

-- 22 -- Count products in each category.
SELECT category, count(*) AS Product_Count
FROM Products
GROUP BY category;

-- 23 -- Count orders placed by each customer
SELECT customer_name, count(*)
FROM Orders
GROUP BY customer_name;

# HAVING
 
-- 24 -- Departments with total salary > 1,50,000.
SELECT department, sum(salary) AS Total_salary
FROM Employees
GROUP BY department
HAVING sum(salary) > 150000;

SELECT * FROM Employees;

 -- 25 -- Classes where average marks > 80.
 SELECT class, avg(marks) AS Average_Marks
 FROM Students
 GROUP BY class
 HAVING avg(marks) >80;
 
-- 26 --  Categories with total stock > 50.
SELECT category, Sum(stock) AS Total_stock
FROM Products
GROUP BY category
HAVING Sum(stock) >50;

# DISTINCT

-- 27 --  List unique cities from students.
SELECT DISTINCT city 
FROM Students;

-- 28 -- List unique departments from employees.
SELECT DISTINCT department
FROM Employees;

-- 29 --  List unique categories from products.
SELECT DISTINCT category
FROM Products;

# LIMIT

-- 30 --  Top 3 highest paid employees.
SELECT emp_name, salary
FROM Employees 
ORDER BY salary DESC LIMIT 3;

-- 31 -- First 5 student records.
 SELECT * 
 FROM Students
 ORDER BY student_id ASC LIMIT 5;
 
 # CASE Expression
 
-- 32 --  Grade students:
-- • A (≥90), B (≥75), C (≥60), Fail (<60).
SELECT Name, Marks, 
CASE 
WHEN marks >= 90 THEN 'A'
WHEN marks >= 75 THEN 'B'
WHEN marks >= 60 THEN 'C'
ELSE 'FAIL'
END AS GRADE
FROM Students;


-- 33 --  Mark salary level:
-- • High (> 100 000), Medium (50 000–100 000), Low (< 50 000).
SELECT emp_name, salary,
CASE 
WHEN salary > 100000 THEN 'HIGH'
WHEN salary BETWEEN 50000 AND 100000 THEN 'MEDIUM'
WHEN salary < 50000 THEN 'LOW'
END AS Salary_Level
FROM Employees;

