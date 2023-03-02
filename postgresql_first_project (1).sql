select * from store;

--Write a query to show current date ?
select current_date;

--How many rows in the table?
select count(*) as rows from store;

--How many columns in a table?
SELECT count(*) as No_of_Column FROM information_schema.columns WHERE table_name ='store';

-- Write a query to find the first 5 rows in table?
select * from store limit 5

-- Filtering the data ?


select years,to_char(order_date,'Month') as Month,extract(month from order_date) as Month_Number,round(sum(sales))as sales from store 
group by Years, to_char(order_date,'Month'),extract(month from order_date)
order by  years asc,Month_Number asc;

--Write a query to find the total_sales in each ship_mode ?
select ship_mode,round(sum(sales)) as Sales from store group by ship_mode order by sales desc ;

--Write a query to find the total_sales in each segment?
select segment ,round(sum(sales)) as Sales from store group by segment;

--Write a query to find the total_sales in each region?
select region,round(sum(sales)) as Sales from store group by region;

--Write a query to find The total_sales in each Category?
select category,round(sum(sales)) as  Sales from store group by category;

--In Office supplies category how many total sales in each Year ?
select years,round(sum(Sales)) as sales from store where category='Office Supplies' group by years order by sales desc;

--Write a query to find the total_sales in each year and in each Catgeory?
select years,category,round(sum(sales))as sales from store group by years,category order by years asc ,sales desc;

select customer_duration,round(sum(sales)) as sales from store group by customer_duration order by sales desc;

select * from store;

select years,count(returned_items)as returned_items from store where returned_items='Returned' group by years order by returned_items desc;

select * from store;

select segment,count(returned_items) as returned_items from store where returned_items='Returned' group by segment order by returned_items desc;


select category ,sum(quantity) as quantity from store group by category order by quantity desc;

select years ,sum(quantity) as quantity_sales ,round(sum(profit)) as profit from store group by years order by quantity_sales desc;


select years,to_char(order_date,'Month'),sum(quantity) as quantity_sales from store where years =2013 group by years,to_char(order_date,'Month') 
order by quantity_sales desc;

select * from store;

select customer_duration ,sum(quantity) as Sold_quantity from store group by customer_duration order by Sold_quantity desc;


select * from store;

select sub_category as Product,round(sum(sales)) as Sales  from store group by sub_category order by Sales desc limit 5;

select segment ,customer_name ,sales from store where sales in(
select max(sales) as Sales from store group by segment order by sales desc );

select segment ,max(sales) from store group by segment;

select segment,customer_name,sales from store where sales in(select min(sales) as sales from store group by segment order by sales desc);

select segment,customer_name,profit from store where profit in (select max(profit) as profit from store group by segment order by profit desc);

select * from store;

select customer_name,ship_mode,Category,sub_category,profit from store where profit in(
select max(profit) as profit from store group by ship_mode order by profit desc);

-- Write a query to find the monthly sales in 2013 and monthly profit in 2013 ?
select * from store;

select to_char(order_date,'Month') as Month ,round(sum(sales)) as Sales,round(sum(profit)) as profit from store where Years=2013 
group by to_char(order_date,'Month')  order by Sales desc ,profit desc  ;

-- Write a query to find which month sold_quantity is more than 250 in year 2013?
select * from store;
select to_char(order_date,'Month') as Month,count(quantity) as sold_quantity from store where years=2013 
group by to_char(order_date,'Month') having count(quantity) > 250 order by sold_quantity desc;

--Which product is mostly prefferd by customers?
select product_name,count(product_name) as customers_prefferd from store
group by product_name order by count(product_name) desc limit 1;

-- Which ship_mode is mostly Prefferd?
select * from store;
select ship_mode,count(ship_mode) as prefferd from store group by ship_mode order by prefferd desc ;

--Top 5 sub_category is mostly preffred the customers?
select * from store ;
select sub_category,count(sub_category) as prefferd from store group by sub_category order by prefferd desc limit 5;

-- Bottom 5 sub_category which is not preffred by customers?
select * from store;
select sub_category,count(sub_category) as not_preffred from store 
group by sub_category order by not_preffred asc limit 5;

select * from store;

--Write a query to find max sales in store table in different year and in which month?
select Years,to_char(order_date,'Month') as Month,sales as Max_sales from store where sales in(
select max(sales) as sales from store group by years order by sales desc) ;

-- Write a query to find max_profit category wise  and find the customer_name ?
select category,customer_name,profit as max_profit from store where profit in(
select max(profit) as max_profit from store group by category order by max_profit desc);


-- Write a query to find year wise number of customer and in decrease from and increase from buy the year?
select * from store;
select years,count(*) as Number_of_cuastomer from store group by years order by years asc 
--Result is increasing the number of customer in every year

-- Write a query to find the quarter profit of the year 2013 and which trend increase profit or decrease profit in quarter?
select extract(year from order_date) as Year,extract(quarter from order_date) as Quarter,round(sum(profit)) as profit from store 
where years=2013
group by extract(quarter from order_date),extract(year from order_date) order by Quarter asc;
--Note:- In increase profit quarter wise

--Write a query to find max profit in the each year and which quarter and name the customer and month name also ?
select customer_name ,years,extract(quarter from order_date) as quarter,to_char(order_date,'Month') as Month
,round(profit) as max_profit 
from store where profit in
(select max(profit) as profit from store group by years);

select * from store;

--Write a query to find central region which category and sub_category sold in each year return 
--years,sales,profit,quantity sold,category,sub-category,region="Central"?

select region,category,sub_category,years,round(sum(sales))as Sales,round(sum(profit)) as Profit,count(quantity) as Quantity_sold
from store where region='Central' group by region,category,sub_category ,years
order by category asc,years;



































