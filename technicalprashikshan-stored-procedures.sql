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


CALL insert_month_days_data('2020-06-01',3);

CALL insert_month_data('2020-04-01',1);