
-- inserts for contact_master
insert into contact_master (first_name, last_name, contact_number_1, contact_number_2, email_1, email_2, contact_type, contact_status) 
values
('Samarth','Patil',9920728158,null,'samarth.patil@gmail.com',null,'vendor contact','active'),
('Ranjeet','Patil',9920728158,null,'ranjeet.patil@gmail.com',null,'vendor contact','active'),
('Amruta','Patil',9920728158,null,'amruta.patil@gmail.com',null,'trainer contact','active'),
('Bahubali','Acharekar',9920728158,null,'bahubali.acharekar@gmail.com',null,'client contact','active'),
('Trupti','Acharekar',9920728158,null,'trupti.acharekar@gmail.com',null,'client contact','active');

-- inserts for client_master
select * from client_master;
insert into client_master (company_name,address_line_1,address_line_2,landmark,city,state,pin,primary_contact_id,client_status)
values
('BornToCode','B-212,Nisarga CHS,','Jerbai Wadia Road,Bhoiwada','Opposite Indian Cancer Society','Parel , Mumbai','Maharashtra','400012',3,'active'),
('Technical Prashikshan','B-212,Nisarga CHS,','Jerbai Wadia Road,Bhoiwada','Opposite Indian Cancer Society','Parel , Mumbai','Maharashtra','400012',2,'active');

-- inserts for vendor_master
select * from vendor_master;
insert into vendor_master(vendor_name , address_line_1,address_line_2,landmark,city,state,pin,vendor_status,primary_contact_id)
values
('Pragati Software','109,Lok Center','Marol Maroshi Road','Above ICICI Bank', 'Marol , Mumbai','Maharashtra','400012','active',1),
('Spectrum Networks','109,Lok Center','Marol Maroshi Road','Above ICICI Bank', 'Marol , Mumbai','Maharashtra','400012','active',2);

-- inserts for user_master
select * from user_master;

insert into user_master(password , role) 
values
('Bahubali@01','Trainer'),
('Bahubali@01','Admin');

-- inserts for files_master
select * from files_master;
describe files_master;
insert into files_master(file_content_type,file_name,content_file) values('application/pdf','Citibank_PO',null),('application/msword','Citibank_Invoice',null);

-- inserts for banking_master
select * from banking_master;

describe banking_master;
insert into banking_master(account_number,account_holders_name,ifsc_code,bank_name,branch_address,pan_card_number,pan_card_file_id,aadhar_number,aadhar_file_id,banking_details_status) 
values(123456,'Vivek Gohil','ICICI00123','ICICI Marol Branch, Lok Center ,Marol Maroshi Road','Marol , Andheri-E','APYPG317F',1,'123445677890',1,'active');

commit;
insert into banking_master(account_number,account_holders_name,ifsc_code,bank_name,branch_address,pan_card_number,pan_card_file_id,aadhar_number,aadhar_file_id,banking_details_status) 
values('1234567890','Vivek Gohil','ICICI00123','ICICI Marol Branch, Lok Center ,Marol Maroshi Road','Marol , Andheri-E','APYPG317F',1,'123445677890',1,'active');

-- insert statements for trainer_master
select * from contact_master;
select * from user_master;
select * from banking_master;
insert into trainer_master(first_name,last_name,per_day_rate,profile_file_id,trainer_description,trainer_status,trainer_contact_id,user_id,banking_id) 
values('Vivek','Gohil',8000,2,'Java Trainer','Active',1,1,1);

select * from trainer_master;
describe trainer_master;
commit;

-- insert statements for purchase_order_details
select sysdate();
insert into purchase_order_details(purchase_order_id,amount,received_date,purchase_order_file_id,purchase_order_status,vendor_id,client_id)
values('PO1234',85000,SYSDATE(),2,'Active',1,1);

select * from purchase_order_details;
describe purchase_order_details;
commit;
-- insert statements for invoice_details
describe invoice_details;
select * from trainer_master;
insert into invoice_details(invoice_id,raised_date,clearing_date,invoice_amount,invoice_amount_in_words,invoice_file_id,invoice_status,invoice_cleared_amount,tax_deducted_amount,trainer_id)
values('TechPra-2022-03-22-2',sysdate(),sysdate() + 45,85000,'Eighty Five Thouseand Only',2,'Invoice Raised',0,0,1);

select * from invoice_details;
-- insert statements for financial_year_master 
insert into financial_year_master(year_start_date,year_end_date) values ('2020-04-01','2021-03-31');
insert into financial_year_master(year_start_date,year_end_date) values ('2021-04-01','2022-03-31');

-- insert statements for the training_details
select * from training_details;
insert into training_details(topic,total_number_of_days,per_day_rate,session_type,remarks,training_status,vendor_id,client_id,purchase_order_id,invoice_id)
values('Core Java',5,8000,'Online','No Remarks','Confirmed',1,2,'PO1234','TechPra-2022-03-22-2');

select * from vendor_master;
select * from client_master;
select * from purchase_order_details;
select * from invoice_details;

-- insert statements for the financial_year_details
select * from financial_year_master;
insert into financial_year_master(year_start_date , year_end_date) values('2020-04-01','2021-03-31');
insert into financial_year_master(year_start_date , year_end_date) values('2021-04-01','2022-03-31');
insert into financial_year_master(year_start_date , year_end_date) values('2022-04-01','2023-03-31');
-- inserts for months_master and days_master
-- inserts for the financial_year_id 1
call insert_month_data('2020-04-01',1);
-- inserts for the financial_year_id 2
call insert_month_data('2021-04-01',2);
-- inserts for the financial_year_id 3
call insert_month_data('2022-04-01',3);



-- inserts for the training_date_details
select * from training_dates_details;
select * from training_details;
select * from trainer_master;
insert into training_dates_details(day_id,training_details_id,trainer_id)
values(1,3,1);
commit;