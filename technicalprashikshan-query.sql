use technical_prashikshan;
select * from financial_year_master;
select * from months_master;
select * from days_master;
select * from training_details;
select * from purchase_order_details;
select * from invoice_details;
select count(*) from financial_year_master;
select count(*) from months_master;
select count(*) from days_master;

select * from financial_year_master where year_id = 1;
select * from months_master where year_id = (select year_id from financial_year_master where year_id = 1);
select count(month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 1);
select * from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 1));
select count(*) from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 1));

select * from financial_year_master where year_id = 2;
select * from months_master where year_id = (select year_id from financial_year_master where year_id = 2);
select count(month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 2);
select * from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 2));
select count(*) from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 2));

select * from financial_year_master where year_id = 3;
select * from months_master where year_id = (select year_id from financial_year_master where year_id = 3);
select count(month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 3);
select * from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 3));
select count(*) from days_master where month_id IN ( select (month_id) from months_master where year_id = (select year_id from financial_year_master where year_id = 2));

-- retrive full day details(full month) by month start date 
select month_id from months_master where month_start_date = '2022-03-01';
select * from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01');
select count(day_id) from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01');

-- printing training calendar
-- 700
-- 701
-- 702
-- 703
-- 704
-- training_details_id = 1
-- trainer_id = 1
select * from training_dates_details;
select * from training_details;
select * from trainer_master;
insert into training_dates_details(day_id,training_details_id,trainer_id) 
values (700,1,1),(701,1,1),(702,1,1),(703,1,1),(704,1,1);

insert into training_dates_details(day_id,training_details_id,trainer_id) 
values (707,3,1),(708,3,1),(709,3,1),(710,3,1),(711,3,1),(712,3,1);

-- retrive details of complete month
select * from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01');

-- retrive details of trainings in complete month
select * from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01'));
select count(training_date_id) from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01'));

-- retrived details of days date from days_master
select * from days_master where day_id in (select day_id from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01')));
select count(day_id) from days_master where day_id in (select day_id from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01')));

select month_id from months_master where month_start_date = '2022-03-01';
select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01');
select * from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01'));
select * from training_details where training_details_id IN (select training_details_id from training_dates_details where day_id IN ( select day_id from days_master where month_id = (select month_id from months_master where month_start_date = '2022-03-01')));

-- Get selected days details from selected day_ids
select * from days_master where day_id in (705,706);














