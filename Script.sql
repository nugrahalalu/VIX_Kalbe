-- Exploratory Data Analysis

-- Average Age by Marital Status

select "Marital Status", round(avg(age)) as average_age, count (1) total_customer
from "Case Study - Customer" csc 
group by "Marital Status"


-- Average Age by Gender
select case when gender = 0 then 'Female' else 'Male' end gender, gender as gender_code, round(avg(age)) average_age
from "Case Study - Customer" csc  
group by 2


-- Store with Highest Total Quantitiy
select css.storename, sum(cst.qty) total_qty
from "Case Study - Store" css  
join "Case Study - Transaction" cst on css.storeid = cst.storeid
group by 1
order by 2 desc
limit 1

-- Product with Highest Total Amount
select csp."Product Name", sum(cst.totalamount) total_amount
from "Case Study - Product" csp  
join "Case Study - Transaction" cst  on csp.productid = cst.productid 
group by 1
order by 2 desc
limit 1


-- Additional Exploratory Data Analysis

-- Product Sales per Month
select csp."Product Name",
	   date_part('month', to_date(cst."Date", 'dd/mm/yyy')) as month_date,
	   sum(cst.qty) total_quantity,
	   sum (cst.totalamount) total_amount  
from "Case Study - Product" csp 
join "Case Study - Transaction" cst on csp.productid = cst.productid
group by 1, 2
order by 1