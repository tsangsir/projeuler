set timing on

with rng as (select rownum r, ceil(10000/rownum) f from all_objects
where rownum <= 10000),
prd as (
select rng1.r r1, rng2.r r2, rng1.r * rng2.r prd,
rng1.r || rng2.r || rng1.r * rng2.r res
from rng rng1, rng rng2
where rng1.r not like '%0%'
and rng2.r not like '%0%'
--and rng1.r not like substr(rng2.r,1,1)
--and rng2.r not like substr(rng1.r,1,1)
and rng2.r > rng1.r
and rng2.r <= rng1.f
),
prd_dig as (
select prd.*
from prd
where length(prd.res)=9
and prd.res not like '%0%'
and prd.res like '%2%'
and prd.res like '%4%'
and prd.res like '%6%'
and prd.res like '%8%'
and prd.res like '%1%'
and prd.res like '%3%'
and prd.res like '%5%'
and prd.res like '%7%'
and prd.res like '%9%'
)
select sum(distinct prd ) from prd_dig
/

