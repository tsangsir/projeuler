with x as (select rownum-1 x from all_objects
where rownum <=10)
select * from (
select xx.*, rownum r  from (
select x1.x x1, x2.x x2, x3.x x3, x4.x x4, x5.x x5, x6.x x6, x7.x x7, x8.x x8, x9.x x9, x10.x x10
from x x1, x x2, x x3,  x x4, x x5, x x6, x x7, x x8, x x9, x x10
where x1.x not in (x2.x, x3.x, x4.x, x5.x, x6.x, x7.x, x8.x, x9.x, x10.x)
and x2.x not in (x1.x, x3.x, x4.x, x5.x, x6.x, x7.x, x8.x, x9.x, x10.x)
and x3.x not in (x1.x, x2.x, x4.x, x5.x, x6.x, x7.x, x8.x, x9.x, x10.x)
and x4.x not in (x1.x, x2.x, x3.x, x5.x, x6.x, x7.x, x8.x, x9.x, x10.x)
and x5.x not in (x1.x, x2.x, x3.x, x4.x, x6.x, x7.x, x8.x, x9.x, x10.x)
and x6.x not in (x1.x, x2.x, x3.x, x4.x, x5.x, x7.x, x8.x, x9.x, x10.x)
and x7.x not in (x1.x, x2.x, x3.x, x4.x, x5.x, x6.x, x8.x, x9.x, x10.x)
and x8.x not in (x1.x, x2.x, x3.x, x4.x, x5.x, x6.x, x7.x, x9.x, x10.x)
and x9.x not in (x1.x, x2.x, x3.x, x4.x, x5.x, x6.x, x7.x, x8.x, x10.x)
and x10.x not in (x1.x, x2.x, x3.x, x4.x, x5.x, x6.x, x7.x, x8.x, x9.x)
order by x1.x, x2.x, x3.x, x4.x, x5.x, x6.x, x7.x, x8.x, x9.x, x10.x
) xx
where rownum <= 1000000
)
where r=1000000
/
