\timing

with
pfx_10 as (select generate_series(1, 999)::varchar(20) p),
pal_10 as (
        select cast(concat(p, reverse(p)) as int) n from pfx_10 
        where substr(p,1,1) in ('1','3','5','7','9')
        union
        select cast(concat(p, substr(reverse(p),2, 100)) as int) from pfx_10
        where substr(p,1,1) in ('1','3','5','7','9')
),
pal_10_b2 as (
select n, ltrim(n::bit(20)::varchar(20), '0') b2
 from pal_10)
 select sum(n) from pal_10_b2
 where b2=reverse(b2)
;
