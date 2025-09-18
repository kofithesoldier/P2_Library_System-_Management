-- Project Task

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books
values
('78-1-60129-456-2', 'To Kill a Mockingbird','Classic',6.00,'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


-- Task 2: Update an Existing Member's Address from 123 Main St to 125 Main st.

UPDATE members
SET member_address = '125 Main st'
WHERE member_id ='C101';

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id ='IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
select * from issued_status;
select issued_book_name
from issued_status
where issued_emp_id ='E101';

-- Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

select m.member_name,
       m.member_id,
       count(*) as number_of_issued_books
from issued_status s
join members m 
on s.issued_member_id=m.member_id
group by m.member_id,m.member_name
having count(*) >1;

-- Task 6. Retrieve All Books in a Specific Category:classic

select book_title
from books
where category='Classic';

-- Task 7: Find Total Rental Income by Category:

select b.category,
sum(b.rental_price) as Total_rental_price
from books b
join
issued_status s
on b.isbn=s.issued_book_isbn
group by category;


-- Task 8 List Employees with Their Branch Manager's name and their branch details

select
      e1.emp_name as employee_name,
      e2.emp_name as manager_name,
      b.branch_id,
      b.branch_address,
      b.contact_no
from employee e1
join branch b
on e1.branch_id=b.branch_id
join employee e2
on b.manager_id=e2.emp_id;

select * from employee;
select * from branch;


-- Task 10. select  Books with Rental Price Above a Certain Threshold 7USD:
select book_title
from books
where rental_price >7;


-- Task 11: Retrieve the List of Books Not Yet Returned
select 
      Distinct s.issued_book_name
from issued_status  as s
left join
return_status as rs
on s.issued_id=rs.issued_id
where rs.return_id is null;



--- END OF PROJECT---