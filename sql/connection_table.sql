use waste_less_taste;
-- COUNTRY TABLE ----------------------
create table if not exists country_desc (
country_id int auto_increment,
country_name  LONGTEXT,
primary key (country_id));

select * from waste_per;
-- lets populate the table by inserting the unique values for that dimension
insert into country_desc(country_name)
select distinct country  from waste_per order by country desc;
select * from country_desc;

-- now lets adjust the original table so we will use this table
alter table waste_per add column country_id int after id;
-- lets set up the foreign key reference
alter table waste_per ADD CONSTRAINT country_fk FOREIGN KEY (country_id) REFERENCES country_desc (country_id);
-- populate the column using the dimension table we created

select * from waste_per;
select * from country_desc;
update waste_per, country_desc
set waste_per.country_id = country_desc.country_id
where waste_per.country = country_desc.country_name;

-- Add a new column 'country_id' to the 'waste_cap' table
ALTER TABLE waste_per ADD COLUMN country_id INT AFTER id;

-- Set up the foreign key constraint
ALTER TABLE waste_per ADD CONSTRAINT country_fk FOREIGN KEY (country_id) REFERENCES country_desc (country_id);
select * from waste_per;
-- Populate the column using the dimension table we created
UPDATE waste_per,country_desc
SET waste_per.country_id = country_desc.country_id
where waste_per.country = country_desc.country_name;



-- -- now lets adjust the original table so we will use this table
-- alter table waste_cap add column country_id int after id;
-- -- lets set up the foreign key reference
-- alter table waste_cap ADD CONSTRAINT country_fk FOREIGN KEY (country_id) REFERENCES country_desc (country_id);
-- -- populate the column using the dimension table we created
-- update waste_cap, country_desc
-- set waste_cap.country_id = country_desc.country_id
-- where waste_cap.country = country_desc.country_name;

select * from 12_3_eu;
alter table 12_3_eu add column country_id int after id;
update 12_3_eu, country_desc
set 12_3_eu.country_id = country_desc.country_id
where 12_3_eu.country = country_desc.country_name;


select * from composition;
alter table composition add column country_id int after country;
update composition, country_desc
set composition.country_id = country_desc.country_id
where composition.country = country_desc.country_name;

select * from country_region;
alter table country_region add column country_id int after country;
update country_region, country_desc
set country_region.country_id = country_desc.country_id
where country_region.country = country_desc.country_name;

select * from kilo_cap;
alter table kilo_cap add column country_id int after id;
update kilo_cap, country_desc
set kilo_cap.country_id = country_desc.country_id
where kilo_cap.country = country_desc.country_name;


-- select * from tonne_cap;
-- alter table tonne_cap add column country_id int after id;
-- update tonne_cap, country_desc
-- set tonne_cap.country_id = country_desc.country_id
-- where tonne_cap.country = country_desc.country_name;


select * from moderate_percent;
alter table moderate_percent add column country_id int after id;
update moderate_percent, country_desc
set moderate_percent.country_id = country_desc.country_id
where moderate_percent.country = country_desc.country_name;

-- select * from moderate_population;
-- alter table moderate_population add column country_id int after id;
-- update moderate_population, country_desc
-- set moderate_population.country_id = country_desc.country_id
-- where moderate_population.country = country_desc.country_name;


-- select * from national_fruit;
-- alter table national_fruit add column country_id int after country;
-- update national_fruit, country_desc
-- set national_fruit.country_id = country_desc.country_id
-- where national_fruit.country = country_desc.country_name;


select * from severe_percent;
alter table severe_percent add column country_id int after id;
update severe_percent, country_desc
set severe_percent.country_id = country_desc.country_id
where severe_percent.country = country_desc.country_name;


-- select * from severe_population;
-- alter table severe_population add column country_id int after id;
-- update severe_population, country_desc
-- set severe_population.country_id = country_desc.country_id
-- where severe_population.country = country_desc.country_name;




