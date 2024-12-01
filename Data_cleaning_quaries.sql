use powerbi;

select * from Students;

select * from parents;

select * from students 
where _id is null;

SELECT *, CONCAT(`First Name`, " ", `Last Name`) AS Full_name
FROM students;

select * from students
where userscore is not null and resultstatus = 'Absent';

select * from students
where userscore  <> "" and resultstatus = 'Absent';


update students
set resultstatus = 'present'
where userscore  <> "" and resultstatus = 'Absent';

#SET SQL_SAFE_UPDATES = 0;

create table final_data as 
SELECT *, CONCAT(`First Name`, " ", `Last Name`) AS Full_name
FROM students;

--------------------------------------------------------

select * from final_data;

select *,userscore - (physics + chemistry) as Maths_new 
from final_data;

Alter Table final_data 
Add column maths_new int;

update final_data
set maths_new = userscore - (physics + chemistry);

Alter table final_data
drop maths;

ALTER TABLE final_data
DROP COLUMN `First Name`, 
DROP COLUMN `Last Name`;

---------------------------------------------------------

with CTE as (
select physics + chemistry + maths_new as new_total, userscore 
from final_data)

select * from CTE 
where new_total <> userscore;

alter table final_data
add  column new_total int;

select * from final_data;

update final_data
set new_total = physics + chemistry + maths_new;

alter  table final_data 
drop userscore;

-------------------------------------------------------------------

select * from final_data as a
join 
parents as b
on a._id = b._id;

select * ,b.phone,b.name, b.password
from final_data as a
join 
parents as b
on a._id = b._id;


create table new_final_data as 
select a. * ,b.phone,b.name, b.password
from final_data as a
join 
parents as b
on a._id = b._id;

select * from new_final_data;








