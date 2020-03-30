set timing on

with ends as (
	select '3' d from dual
	union all
	select '7' d from dual
),
mids as (
	select '1' d from dual
	union all
	select '3' d from dual
	union all
	select '7' d from dual
	union all
	select '9' d from dual
),
cand4 as (
	select s.d || m1.d || m2.d || e.d cand
	from ends s, mids m1, mids m2, ends e
),
cand6 as (
	select s.d || m1.d || m2.d || m3.d || m4.d || e.d cand
	from ends s, mids m1, mids m2, mids m3, mids m4, ends e
),
cand7 as (
	select s.d || m1.d || m2.d || m3.d || m4.d || m5.d || e.d cand
	from ends s, mids m1, mids m2, mids m3, mids m4, mids m5, ends e
),
cand9 as (
	select s.d || m1.d || m2.d || m3.d || m4.d || m5.d || m6.d || m7.d || e.d cand
	from ends s, mids m1, mids m2, mids m3, mids m4, mids m5, mids m6, mids m7, ends e
),
n as (
	select rownum n from all_objects
	where rownum between 1 and 30),
tr4 as (
select cand, substr(cand, 1, n) tr from cand4, n
where n < 4
union all
select cand, substr(cand, n, 100) tr from cand4, n
where n <= 4
),
tr6 as (
select cand, substr(cand, 1, n) tr from cand6, n
where n < 6
union all
select cand, substr(cand, n, 100) tr from cand6, n
where n <= 6
),
tr7 as (
select cand, substr(cand, 1, n) tr from cand7, n
where n < 7
union all
select cand, substr(cand, n, 100) tr from cand7, n
where n <= 7
),
tr9 as (
select cand, substr(cand, 1, n) tr from cand9, n
where n < 8
union all
select cand, substr(cand, n, 100) tr from cand9, n
where n <= 8
)
select distinct cand from cand6 cand
where cand not in (
select cand /*, tr, p, tr/p*/ from tr6 tr, euler_primes p
--select cand , tr, p, tr/p from tr6 tr, euler_primes p
where p <= sqrt(tr.tr)
and tr.tr / p = round(tr.tr / p, 0)
--and cand='373393'
)
and cand in (select p from euler_primes)
;

exit
