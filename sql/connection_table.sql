
-- CLARITY TABLE ----------------------
create table if not exists country_desc (
country_id int auto_increment,
country_name  LONGTEXT,
primary key (country_id));

select * from waste_cate_percent;
-- lets populate the table by inserting the unique values for that dimension
insert into country_desc(country_name)
select distinct country  from waste_cate_percent order by country desc;
select * from country_desc;

-- now lets adjust the original table so we will use this table
alter table waste_cate_percent add column country_id int after id;
-- lets set up the foreign key reference
alter table waste_cate_percent ADD CONSTRAINT country_fk FOREIGN KEY (country_id) REFERENCES country_desc (country_id);
-- populate the column using the dimension table we created

select country_id from waste_cate_percent;
select * from country_desc;
update waste_cate_percent, country_desc
set waste_cate_percent.country_id = country_desc.country_id
where waste_cate_percent.country = country_desc.country_name;
-- lets drop the original column now
-- alter table main drop column clarity;