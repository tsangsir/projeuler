set timing on 

prompt tuned
with n as (
select rownum n, rownum * rownum n_square from all_objects
where rownum <500
)
select * from (
select a.n+b.n+c.n, count(*)
from n a, n b, n c
where a.n_square + b.n_square = c.n_square
and a.n+b.n+c.n <= 1000
and a.n <= b.n
and b.n < c.n
group by a.n+b.n+c.n
order by count(*) desc)
where rownum =  1 ;

prompt original
with n as (
select rownum n from all_objects
where rownum <500
)
select * from (
select a.n+b.n+c.n, count(*)
from n a, n b, n c
where a.n * a.n + b.n * b.n = c.n * c.n
and a.n+b.n+c.n <= 1000
and a.n <= b.n
group by a.n+b.n+c.n
order by count(*) desc)
where rownum =  1 ;

exit

