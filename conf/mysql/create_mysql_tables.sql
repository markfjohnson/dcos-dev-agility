use mouse_master;
create table cage_temp(cage int, sensor_time datetime, temperature int);
create table food_history(mouse_num int, feed_time datetime, food_type char, food_portion_size varchar(30));