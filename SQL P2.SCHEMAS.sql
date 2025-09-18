create database library_project_2;

--Library Management System Library 2

--Creating  Tables


Drop table if exists branch;
create Table branch 
(
             branch_id VARCHAR(10) PRIMARY KEY,
			 manager_id	VARCHAR(10),
			 branch_address	VARCHAR(55),
			 contact_no VARCHAR(10)
);

DROP TABLE if EXISTS EMPLOYEE;
create table employee
(            
             emp_id	VARCHAR(10) PRIMARY KEY,
             emp_name VARCHAR(25),
			 position VARCHAR(25),
			 salary INT,
			 branch_id VARCHAR(25)--FK
);

DROP TABLE IF EXISTS books;
CREATE TABLE books
(
             isbn VARCHAR(20) PRIMARY KEY,
			 book_title	VARCHAR(75),
			 category VARCHAR (10),
			 rental_price FLOAT,
			 status	VARCHAR(15),
			 author	VARCHAR(35),
			 publisher VARCHAR(55)
);

DROP TABLE IF EXISTS members;
CREATE Table members
(                   
            member_id VARCHAR(10) PRIMARY KEY,
			member_name VARCHAR(25),
			member_address VARCHAR(75),
			reg_date DATE
);

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(       
            issued_id VARCHAR(10) PRIMARY KEY,
			issued_member_id VARCHAR(10),--FK
			issued_book_name VARCHAR(75),
			issued_date DATE,
			issued_book_isbn VARCHAR(25),--FK
			issued_emp_id VARCHAR(10)--FK
);

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
			issued_id VARCHAR(10),--FK
			return_book_name VARCHAR(75),
			return_date DATE,
			return_book_isbn VARCHAR(20)
);

--foreign key
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY(issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books (isbn);

ALTER TABLE issued_status 
ALTER COLUMN issued_book_isbn VARCHAR(20);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

ALTER TABLE employee
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE employee
ALTER COLUMN branch_id VARCHAR (10);