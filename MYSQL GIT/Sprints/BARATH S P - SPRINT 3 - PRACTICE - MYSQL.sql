use sakila;
select * from customer;
-- Task 1:
select * from customer where active=0;
-- Task 2:
select first_name,last_name,email from customer where active=0;
-- Task 3:
select max(store_id) from customer where active=0;
select * from film;
select title from film where rating="PG-13";
-- Task 4:
select title,rating from film where rating="PG-13";
select * from film;
-- Task 5:
select title,length from film where rating="PG-13" order by length desc limit 3;
-- Task 6:
select max(rental_duration) from film;
select title,rental_duration from film where rating ="PG-13" ORDER BY rental_duration asc limit 1;
-- Task 7:-
select avg(rental_rate) from film;
-- Task 8:-
select title,sum(replacement_cost)as "total_replacement_cost"from film group by title;
-- Task 9:-
select * from film_category;
select * from category;
select category_id,name as catname from category where name in("animation","children");
select count(category_id) from film_category where category_id in(2,3) group by(category_id);