create database technical_prashikshan;

use technical_prashikshan;

drop table financial_year_master;
create table financial_year_master(
	year_id int auto_increment,
    year_start_date datetime,
    year_end_date datetime,
    primary key (year_id)
);

create table months_master(
	month_id int auto_increment,
    month_start_date datetime,
    month_end_date datetime,
    year_id int,
    primary key (month_id),
    constraint year_id_fk foreign key (year_id) references financial_year_master(year_id)
);

