create database sql7challenge;
use sql7challenge;


-- customers
create table customers(
customer_id int primary key,
full_name varchar(100) not null,
email varchar(100) not null,
city varchar(50) not null,
signup_date date not null,
segment varchar(20) not null
);

-- products
create table products(
product_id int primary key,
product_name varchar(100),
category varchar(40),
price decimal(10,2),
cost decimal(10,2)
);


-- orders
create table orders(
order_id int primary key,
customer_id int not null,
order_date date not null,
status varchar(20),
channel varchar(20),

foreign key (customer_id) references customers(customer_id)
);


-- orders_items
create table order_items(
order_item_id int primary key,
order_id int not null,
product_id int not null,
quantity int,
unit_price decimal(10,2),

foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);


-- payments
create table payments(
payment_id int primary key,
order_id int not null,
payment_method varchar(100),
payment_status varchar(50),
amount decimal(10,2),

foreign key (order_id) references orders(order_id)
);


-- deliveries
create table deliveries(
delivery_id int primary key,
order_id int not null,
dispatch_date date not null,
delivery_date date,
delivery_status varchar(30),

foreign key (order_id) references orders(order_id)
);

