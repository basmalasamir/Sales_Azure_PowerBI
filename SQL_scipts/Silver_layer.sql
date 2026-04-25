CREATE SCHEMA silver;
create table silver.sales(
id varchar(50),
transaction_date datetime,
quantity int,
product_id varchar(50),
product_name varchar(50),
unit_price float,
total_amount float,
store varchar(50),
payment_method varchar(50),
customer_id varchar(50),
customer_type varchar(50),
year varchar(50),
month varchar(50),
day varchar(50),
day_name varchar(50),
hour int
);
insert into silver.sales
select 
id,
TRY_CAST(timestamp as datetime)as timestamp,
try_cast(quantity as int) as quantity,product_id,product_name,
try_cast(unit_price as float) as unit_price,
try_cast(total_amount as decimal(10,2)) as total_amount,store,payment_method,customer_id,customer_type,year,month,day,day_name,
TRY_CAST(
        LTRIM(RTRIM(REPLACE(REPLACE(hour, CHAR(13), ''), CHAR(10), '')))
        AS INT
    ) AS hour

from bronze.sales