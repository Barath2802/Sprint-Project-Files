use librarydb;
select * from books;
select * from borrowers;
select * from loans;
-- TASK 1:-
delimiter //
CREATE PROCEDURE most_popular_book(in p_age varchar(20))
BEGIN
select B.title,B.author,count(*) as count_popular from books B 
inner join loans as L 
inner join borrowers as BR 
on B.book_id=L.book_id and L.borrower_id=BR.borrower_id where BR.age_group=p_age
group by B.title,B.author
order by count_popular desc;
END //
call most_popular_book("Teens (13-19)");
-- TASK 2:-
DELIMITER //
CREATE PROCEDURE NO_OF_LOANS(in p_year INT)
BEGIN
select count(loan_date),month(loan_date)
 
 from loans
where year(loan_date)=p_year
group by month(loan_date);
END //
call NO_OF_LOANS(2024);
-- TASK 3:-
DELIMITER //
CREATE PROCEDURE NEW_LOAN_ENTRY(IN book_id int,IN borrower_id int)
BEGIN
DECLARE due_date Date;
set due_date = DATE_ADD(CURDATE(),INTERVAL 15 DAY);
insert into loans(book_id,borrower_id,loan_date,return_date)
values(book_id,borrower_id,CURDATE(),due_date);
END //
call NEW_LOAN_ENTRY(7,8);
-- TASK 4:-
DELIMITER //
CREATE PROCEDURE SPECIFIC_LOAN(IN p_loan_id INT )
BEGIN
update loans set return_date=curdate() where loan_id=p_loan_id;
END //
call SPECIFIC_LOAN(5);
SELECT * FROM LOANS;
-- TASK 5:-
DELIMITER //
CREATE PROCEDURE UPDATING(in p_borrower_id int,in p_new_name varchar(50),in p_new_email  varchar(50))
BEGIN 
update borrowers set name=p_new_name,email=p_new_email where borrower_id=p_borrower_id;
END //
call UPDATING(1,"Barath","barath1230208@gmail.com");
select * from borrowers;
-- TASK 6:-





