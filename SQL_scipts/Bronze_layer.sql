create schema bronze;
create table bronze.sales(
id varchar(50),
timestamp varchar(50),
quantity varchar(50),
product_id varchar(50),
product_name varchar(50),
unit_price varchar(50),
total_amount varchar(50),
store varchar(50),
payment_method varchar(50),
customer_id varchar(50),
customer_type varchar(50),
year varchar(50),
month varchar(50),
day varchar(50),
day_name varchar(50),
hour varchar(50)
);
Copy into bronze.sales
from 'link copied' -- copy the link under the title of workspace sql endpoint
with(
FILE_TYPE ='csv',
FIRSTROW=2,
FIELDTERMINATOR=',',
ROWTERMINATOR = '0x0A'
)
