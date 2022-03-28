drop database technical_prashikshan;
create database technical_prashikshan;
use technical_prashikshan;
CREATE TABLE `contact_master` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `contact_number_1` varchar(13) DEFAULT NULL,
  `contact_number_2` varchar(13) DEFAULT NULL,
  `email_1` varchar(255) DEFAULT NULL,
  `email_2` varchar(255) DEFAULT NULL,
  `contact_type` varchar(255) DEFAULT NULL,
  `contact_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
);

CREATE TABLE `client_master` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `client_status` varchar(255) DEFAULT NULL,
  `primary_contact_id` int DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `client_master_primary_contact_id_fk` (`primary_contact_id`),
  CONSTRAINT `client_master_primary_contact_id_fk` FOREIGN KEY (`primary_contact_id`) REFERENCES `contact_master` (`contact_id`)
);

CREATE TABLE `vendor_master` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(50) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `primary_contact_id` int DEFAULT NULL,
  `vendor_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `vendor_master_primary_contact_id_fk` (`primary_contact_id`),
  CONSTRAINT `vendor_master_primary_contact_id_fk` FOREIGN KEY (`primary_contact_id`) REFERENCES `contact_master` (`contact_id`)
);

CREATE TABLE `user_master` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ;

CREATE TABLE `files_master` (
  `files_id` int NOT NULL AUTO_INCREMENT,
  `file_content_type` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `content_file` longblob,
  PRIMARY KEY (`files_id`)
) ;

CREATE TABLE `banking_master` (
  `banking_id` int NOT NULL AUTO_INCREMENT,
  `account_number` varchar(100) DEFAULT NULL,
  `account_holders_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_address` varchar(255) DEFAULT NULL,
  `pan_card_number` varchar(100) DEFAULT NULL,
  `pan_card_file_id` int DEFAULT NULL,
  `aadhar_number` varchar(255) DEFAULT NULL,
  `aadhar_file_id` int DEFAULT NULL,
  `banking_details_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`banking_id`),
  KEY `aadhar_file_id_fk` (`aadhar_file_id`),
  KEY `pan_card_file_id_fk` (`pan_card_file_id`),
  CONSTRAINT `aadhar_file_id_fk` FOREIGN KEY (`aadhar_file_id`) REFERENCES `files_master` (`files_id`),
  CONSTRAINT `pan_card_file_id_fk` FOREIGN KEY (`pan_card_file_id`) REFERENCES `files_master` (`files_id`)
) ;

CREATE TABLE `trainer_master` (
  `trainer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `per_day_rate` double DEFAULT NULL,
  `profile_file_id` int DEFAULT NULL,
  `trainer_description` varchar(255) DEFAULT NULL,
  `trainer_status` varchar(100) DEFAULT NULL,
  `trainer_contact_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `banking_id` int DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `trainer_master_banking_id_fk` (`banking_id`),
  KEY `trainer_master_prfile_id_fk` (`profile_file_id`),
  KEY `trainer_master_trainer_contact_id_fk` (`trainer_contact_id`),
  KEY `trainer_master_user_id_fk` (`user_id`),
  CONSTRAINT `trainer_master_banking_id_fk` FOREIGN KEY (`banking_id`) REFERENCES `banking_master` (`banking_id`),
  CONSTRAINT `trainer_master_prfile_id_fk` FOREIGN KEY (`profile_file_id`) REFERENCES `files_master` (`files_id`),
  CONSTRAINT `trainer_master_trainer_contact_id_fk` FOREIGN KEY (`trainer_contact_id`) REFERENCES `contact_master` (`contact_id`),
  CONSTRAINT `trainer_master_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user_master` (`user_id`)
) ;

CREATE TABLE `invoice_details` (
  `invoice_id` varchar(255) NOT NULL,
  `raised_date` datetime DEFAULT NULL,
  `clearing_date` datetime DEFAULT NULL,
  `invoice_amount` double DEFAULT NULL,
  `invoice_amount_in_words` varchar(255) DEFAULT NULL,
  `invoice_file_id` int DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT NULL,
  `invoice_cleared_amount` double DEFAULT NULL,
  `tax_deducted_amount` double DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `invoice_details_trainer_id_fk` (`trainer_id`),
  KEY `invoice_details_invoice_file_id_fk` (`invoice_file_id`),
  CONSTRAINT `invoice_details_invoice_file_id_fk` FOREIGN KEY (`invoice_file_id`) REFERENCES `files_master` (`files_id`),
  CONSTRAINT `invoice_details_trainer_id_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_master` (`trainer_id`)
) ;

CREATE TABLE `purchase_order_details` (
  `purchase_order_id` varchar(255) NOT NULL,
  `amount` double DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `purchase_order_file_id` int DEFAULT NULL,
  `purchase_order_status` varchar(100) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`),
  KEY `purchase_order_details_client_id_fk` (`client_id`),
  KEY `purchase_order_details_vendor_id_fk` (`vendor_id`),
  KEY `purchase_order_details_purchase_order_file_id_fk` (`purchase_order_file_id`),
  CONSTRAINT `purchase_order_details_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client_master` (`client_id`),
  CONSTRAINT `purchase_order_details_purchase_order_file_id_fk` FOREIGN KEY (`purchase_order_file_id`) REFERENCES `files_master` (`files_id`),
  CONSTRAINT `purchase_order_details_vendor_id_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`vendor_id`)
) ;

CREATE TABLE `training_details` (
  `training_details_id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) DEFAULT NULL,
  `total_number_of_days` int DEFAULT NULL,
  `per_day_rate` double DEFAULT NULL,
  `session_type` varchar(100) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `training_status` varchar(255) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `purchase_order_id` varchar(255) DEFAULT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`training_details_id`),
  KEY `training_details_client_id_fk` (`client_id`),
  KEY `training_details_vendor_id_fk` (`vendor_id`),
  KEY `training_details_purchase_order_id` (`purchase_order_id`),
  KEY `raining_details_invoice_id` (`invoice_id`),
  CONSTRAINT `raining_details_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`),
  CONSTRAINT `training_details_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client_master` (`client_id`),
  CONSTRAINT `training_details_purchase_order_id` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order_details` (`purchase_order_id`),
  CONSTRAINT `training_details_vendor_id_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_master` (`vendor_id`)
) ;

CREATE TABLE `financial_year_master` (
  `year_id` int NOT NULL AUTO_INCREMENT,
  `year_start_date` datetime DEFAULT NULL,
  `year_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`year_id`)
) ;

CREATE TABLE `months_master` (
  `month_id` int NOT NULL auto_increment,
  `month_start_date` datetime DEFAULT NULL,
  `month_end_date` datetime DEFAULT NULL,
  `year_id` int DEFAULT NULL,
  PRIMARY KEY (`month_id`),
  KEY `year_id_fk` (`year_id`),
  CONSTRAINT `year_id_fk` FOREIGN KEY (`year_id`) REFERENCES `financial_year_master` (`year_id`)
) ;

CREATE TABLE `days_master` (
  `day_id` int NOT NULL AUTO_INCREMENT,
  `day_date` datetime DEFAULT NULL,
  `month_id` int DEFAULT NULL,
  PRIMARY KEY (`day_id`),
  KEY `month_id_fk` (`month_id`),
  CONSTRAINT `month_id_fk` FOREIGN KEY (`month_id`) REFERENCES `months_master` (`month_id`)
) ;

CREATE TABLE `training_dates_details` (
  `training_date_id` int NOT NULL AUTO_INCREMENT,
  `day_id` int DEFAULT NULL,
  `training_details_id` int DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  PRIMARY KEY (`training_date_id`),
  KEY `training_dates_details_day_id_fk` (`day_id`),
  KEY `training_dates_details_training_details_id_fk` (`training_details_id`),
  KEY `training_dates_details_trainer_id_fk` (`trainer_id`),
  CONSTRAINT `training_dates_details_day_id_fk` FOREIGN KEY (`day_id`) REFERENCES `days_master` (`day_id`),
  CONSTRAINT `training_dates_details_trainer_id_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer_master` (`trainer_id`),
  CONSTRAINT `training_dates_details_training_details_id_fk` FOREIGN KEY (`training_details_id`) REFERENCES `training_details` (`training_details_id`)
) ;
-- insert days 
DELIMITER $$
CREATE PROCEDURE insert_month_days_data (in start_date datetime, in month_id int)
BEGIN
	declare count int;
    declare next_date datetime;
    declare max_days int;
	set count = 1;
    set max_days = DAY(LAST_DAY(start_date));
	set next_date = start_date;
    
	loop_label:  LOOP
		IF  count > max_days THEN 
			LEAVE  loop_label;
		END  IF;
	
		SET  count = count + 1;
		insert into days_master(day_date,month_id) values(next_date,month_id);
		set next_date = date_add(next_date,interval 1 day);
		ITERATE  loop_label;
		
	END LOOP;
END$$

DELIMITER ;



-- insert month data
DELIMITER $$
CREATE PROCEDURE insert_month_data (in month_start_date datetime,in year_id int)
BEGIN
	declare month_id_value int;
    declare month_counter int;
    declare next_start_date datetime;
    declare next_end_date datetime;
	set month_id_value = 1;
    set month_counter = 1;
    set next_start_date = month_start_date;
    set next_end_date = last_day(next_start_date);
	loop_label:  LOOP
		IF  month_counter > 12 THEN 
			LEAVE  loop_label;
		END  IF;
        
		insert into months_master(month_start_date,month_end_date,year_id) values (next_start_date,next_end_date,year_id);
        commit;
        select max(month_id) into month_id_value from months_master;
		CALL insert_month_days_data(next_start_date,month_id_value);
        set  month_id_value = month_id_value + 1;
        set month_counter = month_counter + 1;
        set next_start_date = date_add(next_start_date,interval 1 month);
        set next_end_date = last_day(next_start_date);
		ITERATE  loop_label;
	END LOOP;
END$$

DELIMITER ;





