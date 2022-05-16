select emp_no, first_name, last_name
from Employees;


select title, from_date, to_date
from Titles;



select e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
  into retirement_titles
  from Employees e
 inner join Titles t
    on t.emp_no = e.emp_no
 where e.birth_date between '1952-01-01' and '1955-12-31'
 order by e.emp_no;

--133776 rows
select *
from retirement_titles;


--Starter Code

- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
from retirement_titles
where to_date = '9999-01-01';


SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
from retirement_titles
where to_date = '9999-01-01'
ORDER BY emp_no ASC,  to_date DESC;


select *
  from unique_titles;


select count(1) as CNT, title
  into retiring_titles
  from unique_titles
 group by title
 order by count(1) desc;
