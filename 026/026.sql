create table q026 (
d number,
l number
);

insert into q026 
select rownum, null
from all_objects
where rownum <=1000;


with n as 
(select 10 n from dual),
nn as 
(select n, log(10,n) ln from n)
update q026
set l=(select ln from nn)
where mod(nn.n, n)=1
and l is not null
;


