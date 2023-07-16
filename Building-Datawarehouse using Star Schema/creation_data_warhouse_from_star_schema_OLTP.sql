create table dimdate
(
	date_key integer not null primary key,
	date date not null,
	year smallint not null,
	quarter smallint not null,
	month smallint not null,
	day smallint not null,
	week smallint not null,
	is_weekend boolean
	

);




create table dimcustomer
(
	qustomer_key serial primary key,
	customer_id smallint not null,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	email varchar(50),
	address varchar(50) not null,
	address2 varchar(50),
	district varchar(20) not null,
        city varchar(20) not null,
	country varchar(20) not null,
	postal_code varchar(10),
	phone varchar(20) not null,
	create_date timestamp not null,
	start_date date not null,
	end_date date not null,

);


create table dimmovie
(
	movie_key serial primary key,
	film_id smallint not null,
	title varchar(255) not null,
	description text,
	release_year year,
	language varchar(20) not null,
	original_language varchar(20),
	rental_duration smallint not null,
	rating varchar(5) not null,
	special_features varchar not null
);

create table dimstore
(
	store_key serial primary key,
	store_id smallint not null,
	address varchar(50) not null,
	district varchar(20) not null,
        city varchar(20) not null,
	country varchar(20) not null,
	postal_code varchar(10),
	manager_first_name varchar(50) not null,
	manager_last_name varchar(50) not null,
	start_date date not null,
	end_date date not null

);


create table factsales
(
	sales_key serial primary key,
	date_key integer references dimdate (date_key),
	customer_key integer references dimcustomer (qustomer_key),
	sales_amount numeric


);

