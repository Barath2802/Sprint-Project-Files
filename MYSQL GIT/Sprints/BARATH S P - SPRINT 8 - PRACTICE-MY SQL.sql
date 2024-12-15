-- Task 1:-
select * from orders;
select * from products;
DELIMITER $$
USE `ecommerceinvdb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ecommerceinvdb`.`order_items_BEFORE_INSERT` BEFORE INSERT ON `order_items` FOR EACH ROW
BEGIN
declare current_stock INT;
select stock_level into current_stock from products where product_id=new.product_id;
if new.quantity<=0 then signal sqlstate "43000" set message_text="negative or 0 quantity is not allowed";
end if;
if new.quantity>current_stock then signal sqlstate "43000" set message_text="insufficient stock for this product";
end if;
END$$
DELIMITER ;
insert into order_items (order_id,product_id,quantity)
values(1,3,0);
insert into order_items(order_id,product_id,quantity)
values(1,3,-1);
-- Task 2:-
alter table orders  add column total_amount decimal(10,2);
update orders set total_amount=0 where order_id=1;
update orders set total_amount=0 where order_id=2;
update orders set total_amount=0 where order_id=3;
update orders set total_amount=0 where order_id=4;
update orders set total_amount=0 where order_id=5;
update orders set total_amount=0 where order_id=6;
update orders set total_amount=0 where order_id=7;
update orders set total_amount=0 where order_id=8;
update orders set total_amount=0 where order_id=9;
update orders set total_amount=0 where order_id=10;
update orders set total_amount=0 where order_id=11;
CREATE TABLE daily_sales (id int primary key auto_increment,sale_date DATE,total_sales DECIMAL(10,2));
-- Task2(1) 
DELIMITER //
CREATE TRIGGER ORDER_ITEMS_AFTER_INSERT
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
DECLARE unit_price DECIMAL(10,2);
DECLARE amount DECIMAL(10,2);
select price into unit_price from products where product_id=new.product_id;
UPDATE ORDERS 
SET total_amount=total_amount+(new.quantity)*unit_price where order_id=new.order_id and status like "placed";
select total_amount into amount from orders where order_id=new.product_id;
insert into daily_sales(sale_date,total_sales)
values(curdate(),amount);
END; //
drop trigger ORDER_ITEMS_AFTER_INSERT;
select * from order_items;
-- Task 2(2)
insert into order_items(order_id,product_id,quantity)
values(10,1,2);