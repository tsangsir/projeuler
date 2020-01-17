set timing on

spool 034.log
with n as (
select rownum -1 n from all_objects
where rownum <= 10
),
facts as (
select 0 d, 1 f from dual
union all
select 1 d, 1 f from dual
union all
select 2 d, 2 f from dual
union all
select 3 d, 2 * 3 f from dual
union all
select 4 d, 2 * 3 * 4 f from dual
union all
select 5 d, 2 * 3 * 4 * 5 f from dual
union all
select 6 d, 2 * 3 * 4 * 5 * 6 f from dual
union all
select 7 d, 2 * 3 * 4 * 5 * 6 * 7 f from dual
union all
select 8 d, 2 * 3 * 4 * 5 * 6 * 7 * 8 f from dual
union all
select 9 d, 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 f from dual
),
num as (
select 
n1.n n1, n2.n n2, n3.n n3, n4.n n4, n5.n n5, n6.n n6, n7.n n7, n8.n n8,
case when n1.n > 0 then n1.n end d1,
case when n1.n + n2.n > 0 then n2.n end d2,
case when n1.n + n2.n + n3.n > 0 then n3.n end d3,
case when n1.n + n2.n + n3.n + n4.n > 0 then n4.n end d4,
case when n1.n + n2.n + n3.n + n4.n + n5.n > 0 then n5.n end d5,
case when n1.n + n2.n + n3.n + n4.n + n5.n + n6.n > 0 then n6.n end d6,
case when n1.n + n2.n + n3.n + n4.n + n5.n + n6.n + n7.n > 0 then n7.n end d7,
n8.n d8
from n n1, n n2, n n3, n n4, n n5, n n6, n n7, n n8
--n n1, n n2, n n3, n n4, n n5, n n6, n n7, n n8
where n1.n + n2.n + n3.n + n4.n + n5.n + n6.n + n7.n + n8.n > 0 
)
select 
num.n1 * 10000000 + num.n2 * 1000000 + num.n3 * 100000 + num.n4 * 10000 + num.n5 * 1000 +  num.n6 * 100 +  num.n7 * 10 + num.n8 num,
nvl(f1.f, 0) + nvl(f2.f, 0) + nvl(f3.f, 0) +  nvl(f4.f, 0) + nvl(f5.f, 0) + nvl(f6.f, 0) + nvl(f7.f, 0) + f8.f fact_sum
from num, 
facts f1, facts f2, facts f3, facts f4, facts f5, facts f6, facts f7, facts f8
where num.d1=f1.d(+)
and num.d2=f2.d(+)
and num.d3=f3.d(+)
and num.d4=f4.d(+)
and num.d5=f5.d(+)
and num.d6=f6.d(+)
and num.d7=f7.d(+)
and num.d8=f8.d(+)
and num.n1 * 10000000 + num.n2 * 1000000 + num.n3 * 100000 + num.n4 * 10000 + num.n5 * 1000 +  num.n6 * 100 +  num.n7 * 10 + num.n8 = 
    nvl(f1.f, 0) + nvl(f2.f, 0) + nvl(f3.f, 0) +  nvl(f4.f, 0) + nvl(f5.f, 0) + nvl(f6.f, 0) + nvl(f7.f, 0) + f8.f 
and num.n1 * 10000000 + num.n2 * 1000000 + num.n3 * 100000 + num.n4 * 10000 + num.n5 * 1000 +  num.n6 * 100 +  num.n7 * 10 + num.n8 not in (1, 2)
/*
and num.d1 = 0
and num.d2 = 0
and num.d3 = 0
and num.d4 = 0
and num.d5 = 0
and num.d6 = 0
*/
;
spool off


exit
