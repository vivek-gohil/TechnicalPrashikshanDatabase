drop database 
use technical_prashikshan;
select * from financial_year_master;
select * from months_master;
select * from days_master;
select * from temp;
select * from training_calendar_masterclient_master;
select count(*) from months_master;
select count(*) from days_master;
select * from financial_year_master;
insert into financial_year_master(year_start_date,year_end_date) values('2020-04-01','2021-03-31');
insert into financial_year_master(year_start_date,year_end_date) values('2021-04-01','2022-03-31');

select last_day('2020-04-01');
insert into months_master(month_start_date,month_end_date,year_id) values('2020-04-01','2020-04-30',1);

update financial_year_master set year_end_date = '2022-03-31' where year_id = 2;

CALL insert_month_days_data('2020-04-01',1);

commit;

select * from contact_master;

desc client_master;
select * from client_master;
select * from vendor_master;


    select max(month_id) from months_master;
select * from days_master;
select * from days_master where month_id = 24;


