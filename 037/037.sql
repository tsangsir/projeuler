with cand as (
select * from euler_primes
where not regexp_like(p, '[024568]')
and p not like '1%'
and p not like '%1'
and p not like '9%'
and p not like '%9'
),
idx as (
select rownum n from all_objects where rownum < 7),
trun as (
select p, n, 'L' dir, substr(p, 1, n) t_p from idx, cand
where p > power(10, n-1)
union all
select p, n, 'R' dir,  substr(p, n, 100) t_p from idx, cand
where p > power(10, n-1)
)
--t_p as (
--select trun.p, count(distinct t_p), count(distinct prime.p)
--from trun, euler_primes prime
--where trun.t_p=prime.p(+)
--group by trun.p
--having count(distinct t_p)= count(distinct prime.p)
--)
--select p from t_p
select distinct p from cand
where p not in (
select tr.p /*, tr, p, tr/p*/ from trun tr, euler_primes p
--select cand , tr, p, tr/p from tr6 tr, euler_primes p
where p.p <= sqrt(tr.t_p)
and tr.t_p / p.p = round(tr.t_p / p.p, 0)
--and cand='373393'
)
and p in (select p from euler_primes)
;

exit
