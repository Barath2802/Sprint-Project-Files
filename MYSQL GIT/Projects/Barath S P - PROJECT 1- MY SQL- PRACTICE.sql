USE `modelcarsdb`;
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;
-- Task 1:-
-- Task 1(1):-
select * from customers;
select customerNumber,customerName,creditLimit
from customers 
order by creditLimit desc limit 10;
-- INTERPRETATION
/* In this Task we have find the top 10 customers by creditLimit.first we have to use customerNumber,CustomerName from customers we have set the limit and 
by using desc  function we find the top 10 customers by using the creditLimit*/
-- Task 1(2):-
select avg(creditLimit),country
from customers
group by country
order by avg(creditLimit) desc;
-- INTERPRETATION
/*In this Task we have to find the avg of creditLimit in each country 
By using the group by Method we have find the avg of credit limit for each country.*/
-- Task 1(3):-
select count(customerNumber) as no_of_customers,state
from customers 
group by state
order by no_of_customers desc;
-- INTERPRETATION
/* In This Task we have to find the number of customerNumber by each state
By using the count(customerNumber) and group by function we find the number of customers in each state.*/
-- Task 1(4):-
select * from orderdetails;
select * from orders;
select customerNumber,customerName from customers where customerNumber not in(select customerNumber from orders)
 order by CustomerNumber desc;
-- INTERPRETATION
/* In This task we have to find the customer who haven't placed any orders
For that i have subquery and not in function to find the customer who havem't placed any orders;*/
-- Task 1(5):-
select * from payments;
select C.customerName,C.customerNumber,sum(OD.quantityOrdered*OD.priceEach) as Total_sales
from customers AS C 
inner join orders AS O
inner join  orderdetails AS OD
ON C.customerNumber=O.customerNumber 
and O.orderNumber=OD.orderNumber
group by C.customerNumber,C.customerName
order by Total_sales desc;
-- INTERPRETATION
/*In This Task we have to find the total sales for each customer 
for This Task i have used inner Join for customers ,orders,orderdetails and i have used the formula like total sales is not available in the orderdetails column 
instead of that i applied the formula like sum(quantityordered*priceEach) as totalsales and i have group by to find the total sales for each and every customer.*/
-- Task 1(6):-
select C.customerNumber,C.customerName,C.salesRepEmployeeNumber,EMP.firstName,EMP.lastName
from customers AS C
INNER JOIN employees AS EMP 
ON C.salesRepEmployeeNumber=EMP.employeeNumber
group by C.customerNumber,C.customerName,C.salesRepEmployeeNumber
order by customerNumber desc;
-- INTERPRETATION
/* In this Task we want to find the list the customers along with the sales representatives
For That i Have taken customerNumber,CustomerName ,salesrepemployeeNumber from customers table and employeenumber,employeeName  from employees
and i joined the two tables via the inner join and use group by function to  display the each customer assigned with the Employeeof sales*/
-- Task 1(7):-
select * from payments;
select * from customers;
select C.customerName,C.customerNumber,P.amount,max(P.paymentDate) as Recent_payment_date
from customers as C
INNER JOIN payments as P
ON C.customerNumber = P.customerNumber
group by C.customerNumber,P.amount
order by max(paymentDate) desc;
-- INTERPRETATION
/*In this task we need to find the customer Information with their most recent detailsFor That i have take customerNumber,Customername 
from customers table ,amount,paymentdate is taken from the payment table 
and  i have used max(P.paymentdate) aggregate function to show the most recent payment details of customer;*/
-- Task 1(8):-
select customerNumber,customerName,creditLimit from customers
where creditLimit=0;
-- INTERPRETATION
/* In this task i have to find the customers who have exceeded their creditlimit.
For this i have used to creditlimit=0; because the customers have exceeded their limit in the credit that's why i have taken as creditlimit=0;*/
-- Task 1(9):-
select customerName,P.productLine,OD.priceEach from customers AS C
inner join orders as O
inner join orderdetails AS OD
inner join products as P
on C.customerNumber=O.customerNumber and
O.orderNumber=OD.orderNumber and
OD.productCode=P.productCode where P.productline="Classic Cars" 
group by C.customerName,OD.priceEach;
-- INTERPRETATION
/*In this Task we have to find the name of the customers who have placed an order for a product an order for a product from a specific product line
for that I have used inner join to connect the tables of customers,orders,orderdetails and products where productline i have specified the 
productline and i have used group by function to display the customerName along with the productLine.*/
-- Task 1(10):-
select C.customerName,max(OD.priceEach),P.productLine from customers AS C
inner join orders as O
inner join orderdetails as OD
inner join products as P
ON c.customerNumber= O.customerNumber and
O.orderNumber=OD.orderNumber and
OD.productCode=P.productCode
group by customerName,P.productLine
order by max(OD.priceEach) desc;
-- INTERPRETATION
/*In this Task we need to find the names of all customers  who have all placed an order for the most expensive product 
For that i have use customer table,orders table orderdetails table and product table and i connect the those table using INNER JOIN using ON clause 
and i have used group by display the customername,product line and max(priceeach) 
and i have used order by function to show the price which is  on top along with the customerName,max of price and productName (I.E productLine)*/
-- Task 2:-
-- Task 2(1):-
select * from offices;
select * from employees;
select count(E.employeeNumber) as count_employee,E.firstName,E.lastName,O.officecode,O.city from employees as E
inner join offices AS O
ON E.officecode=O.officecode
group by o.officecode,e.lastname,e.firstname order by count_employee desc;
-- INTERPRETATION
/*In this task we need to find the number of employee working in each office
For this we need to count the employeeNumber and need to join the office table through the inner join 
and we use group by function to display the  officecode along with the count(employeeNumber)*/
-- Task 2(2):-
select * from employees;
select * from offices;
SELECT O.officeCode, O.city, O.country, COUNT(e.employeeNumber) AS num_employees
FROM offices O
LEFT JOIN employees E ON O.officeCode = E.officeCode
GROUP BY O.officeCode, O.city, O.country
HAVING COUNT(E.employeeNumber) < 5;
-- INTERPRETATION
/*In this Task we need to find the office  withless than certain number of employees
for That join office table,employee table and then we want to give condition like count(employeeNumber<5) 
after that i will show the count of employees */
-- Task 2(3):-
select * from offices;
select E.employeeNumber,E.firstName,E.lastName,O.territory,O.officeCode
from employees AS E
INNER JOIN offices AS O
on E.officeCode=O.officeCode
group by E.employeeNumber,E.firstName,E.lastName,O.territory,O.officeCode;
-- INTERPRETATION
/* In This Task we need to list the offices along with the assigned territories.
for that I have used joins to connect tables of employees and offices to display the employeeNumber,firstName,lastName along with the territories.*/
-- Task 2(4):-
select O.officeCode,E.employeeNumber
from offices AS O
LEFT JOIN employees AS E
ON o.officeCode=E.officeCode
where E.employeeNumber is null;
-- INTERPRETATION
/* In This task we need to find the office that have no employees assigned to them .
For that i have use joins to connect the two tables of employees as well as offices and used where clause to where E.employeeNumber is null in office */
-- Task 2(5):-
select sum(OD.quantityOrdered*OD.priceEach) as total_sales,O.officeCode
from offices as O
INNER JOIN employees as E
INNER JOIN customers AS C
INNER JOIN orders AS OO
INNER JOIN orderdetails AS OD
ON O.officeCode=E.officeCode
and E.employeeNumber=C.salesRepEmployeeNumber
and OO.orderNumber=OD.orderNumber
group by O.officeCode
order by sum(OD.quantityOrdered*OD.priceEach) desc limit 10;
-- INTERPRETATION
/*In this Task we need to find the most profitable office based on total sales
For that case we used to join employee Table,customers table,orders table,orderdetails table
and we used to join these table using ON clause and we need to use the formula total sales=quantityordered*priceEach to find the most profitable office based on total sales */
-- Task 2(6):-
select E.officeCode,count(E.employeeNumber)from
employees as E
group by E.officeCode
order by Count(E.employeeNumber) desc limit 10;
-- INTERPRETATION
/*In This Task we need to find the office  with the highest number of employees.
To find this i have used one table.count(employeeNumber )and office code i have taken to display the records from  
offices table and i will display the count of employees along with the officeCode by using the group by function    */
-- Task 2(7)
select * from customers;
select * from offices;
select avg(creditLimit),O.officeCode ,E.employeeNumber
from customers AS C
INNER JOIN employees AS E
INNER JOIN offices AS O
ON
C.salesRepEmployeeNumber=E.employeeNumber and
E.officeCode=O.officeCode
GROUP BY O.officeCode,E.employeeNumber
order by avg(creditLimit) desc;
-- INTERPRETATION 
/*In this Task we need to find  the avg of credit limit for customers in each office
For that  i have used employee Table and offices table and i have joined the table  through the ON clause 
and i have used group by function to display the officecode,employeeNumber along with  i have used order by to give the top avg values for each customer.*/
-- Task 2(8):-
select count(officeCode),country from offices 
group by country;
-- INTERPRETATION
/*  In This Task we need to find the number of offices in each country.
for that we need to count function to count the officecode along with the country .to find these i used group by function to display the records.  */
-- Task 3:-
-- Task 3(1):-
select * from products;
select count(productCode),ProductLine from products 
group by productLine
order by count(productCode) desc;
-- INTERPRETATION 
/* In this task we need to find the number of products in each product line
for that we need to use the count aggregate function to find the number of products in each product line.*/
-- Task 3(2):-
select * from products;
select * from orderdetails;
select productLine,avg(OD.priceEach)
from  products AS P
INNER JOIN orderDetails AS OD
ON P.productCode=OD.productCode
group by productLine
order by avg(priceEach) desc;
-- INTERPRETATION
/*In this task we need to find the product line with the highest average product price.
For that  we need to join the tables of products table,order table and we need to find the avg(priceeach) to find the avg(priceeach) along with the productLine */
-- Task 3(3):-
select * from products;
select P.productCode,P.productName,P.ProductLine,P.MSRP
from products AS P
where P.MSRP>=50 AND P.MSRP<=100
ORDER BY P.MSRP DESC;
-- INTERPRETATION
/* In this task we need to find the products name,product code,product line along with msrp is>50 andmsrp<=100
for that we need to use the product table alone to find the msrp shouldbe contain less than <100 and more than 50 */
--  Task 3(4):-
select * from productLines;
select * from products;
select * from orderdetails;
select P.productLine,sum(OD.quantityOrdered*OD.priceEach) as Total_sales
from Products as P
INNER JOIN orderDetails AS OD
ON P.productCode=OD.productCode
group by P.productLine
order by Total_sales desc;
-- INTERPRETATION
/*In this task we need to find the total sales amount for each product line.
For that we need to use the formula  for total sales =quantityordered*priceeach. and we need to use the join 
and need to create a relationship between products and orderdetails and we have to group by function to use the    */
-- Task 3(5):-
select productLine,P.quantityInStock as total_Inventory_Levels
from products AS P
where p.quantityInStock <10;
-- INTERPRETATION:-
/*In this task we need to find the quantityinstock is less than 10
for that we need to use where clause to find the quantityinstock is less than 10.*/
-- Task 3(6):-
select * from products;
select productLine,ProductCode,ProductName,MSRP 
from products
group by productLine,productCode,productName,MSRP
order by MSRP desc LIMIT 5;
-- INTERPRETATION:-
/*In this Task we need to find the retrieve most expensive product based on MSRP
For that we need to use order by function to display the most expensive product based on MSRP:-*/
-- Task 3(7):-
select * from orderdetails;
select * from products;
select P.productName,sum(OD.quantityOrdered*OD.priceEach) from products as P
inner join orderdetails AS OD
ON P.productCode=OD.productCode
group by P.productName
order by sum(OD.quantityOrdered*OD.priceEach) desc;
-- INTERPRETATION
/* In this Task we need to find the total sales for each product
For this We need to find the formula total sales=(quantityordered * priceEach) and we need to use joins to connect the table of  orderdetails 
and products because priceeach and quantityinstock is in orderdetails table*/
-- Task 3(8):-
select * from orderdetails;
select * from products;
DELIMITER //
create procedure top_selling_product(in total_selling int)
BEGIN
select P.productName,P.productCode,sum(OD.quantityOrdered)
from products as P
INNER JOIN orderdetails AS OD ON P.productCode=OD.productCode
group by productName,productCode
order by sum(OD.quantityOrdered) desc limit total_selling;
END //
CALL top_selling_product(5);
-- INTERPRETATION
/*In this Task we need to find the create prodecure and then we have set the limit by using the call function
we need to find the top 5 top_selling_product along with the productName,productCode;   */
-- Task 3(9):-
select * from products;
select * from orderdetails;
select P.productLine,P.quantityInStock as low_inventory_levels
from products AS P
where quantityInStock<10
and productLine in("Classic Cars","MotorCycles");
-- INTERPRETATION
/*In this task we need to retrieve the products with low inventory levels(less than threshold value of 10 for quantityin)stock 
For that we need to use the where clause to check the quantityInstock is less than 10 
for the specific products("Classic cars,motorcycles)"P*/
-- Task 3(10):-
select count(C.CustomerNumber),P.productLine,P.productCode,P.productName
from products AS P
INNER JOIN orderdetails AS OD
INNER JOIN orders AS O
INNER JOIN customers AS C
ON P.productCode=OD.productCode
AND OD.orderNumber=O.orderNumber 
AND O.customerNumber=C.customerNumber
group by P.productLine,P.productCode,P.productName
having count(C.customerNumber)>10;
-- INTERPRETATION
/* In this Task we need to find the number of customers that have ordered by more than 10 customers
For that we have to need to join the products table,orderdetails table,orders table,customers table through the ON CLAUSE and 
we need to use group by function to display the records of productline,productcode,productName along with the customer ordered more than 10 products.   */
-- Task 3(11):-  
select * from products;
select * from orderdetails;
SELECT P.productName, P.productCode, P.productLine, OD.quantityordered
FROM products AS P
INNER JOIN orderdetails AS OD ON P.productCode = OD.productCode
INNER JOIN (
  SELECT productCode, AVG(quantityordered) AS avg_quantity
  FROM orderdetails
  GROUP BY productCode
) AS avg_qty ON P.productCode = avg_qty.productCode
WHERE avg_qty.avg_quantity > OD.quantityordered;
--or
select p.productName,p.productLine,od.quantityOrdered from products p join orderdetails od on p.productCode=od.productCode
where od.quantityOrdered>(select avg(quantityOrdered) from orderdetails) group by p.productName,p.productLine,od.quantityOrdered;





