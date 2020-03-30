set timing on

with
function eul_bin_to_num_wrapper(bin_str_with_comma varchar2) return number
is
        res number;
begin
		        -- make sure bin_str_with_comma has only 0,1,comma to avoid injection
        --if replace(replace(replace(bin_str_with_comma, ','), '0'), '1') is not null then
        --      raise_application_error(-20999, 'Invalid input');
        --end if;
        --dbms_output.put_line('select bin_to_num(' || bin_str_with_comma || ') from dual' );
      execute immediate 'select bin_to_num(' || bin_str_with_comma || ') from dual' into res;
      return res;
end;

d_2 as (select 1 d from dual union all select 0 d from dual ),
d_10 as (select rownum-1 d from all_objects where rownum <= 10),
pfx_2 as (
        select '1' || ',' || to_char(d) n from d_2 d2
        union all
        select '1,' || d2.d || ',' || d2.d from d_2 d2, d_2 d3
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d from d_2 d2, d_2 d3, d_2 d4
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d || ',' || d6.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5, d_2 d6
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d || ',' || d6.d || ',' || d7.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5, d_2 d6, d_2 d7
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d || ',' || d6.d || ',' || d7.d || ',' || d8.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5, d_2 d6, d_2 d7, d_2 d8
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d || ',' || d6.d || ',' || d7.d || ',' || d8.d || ',' || d9.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5, d_2 d6, d_2 d7, d_2 d8, d_2 d9
        union all
        select '1,' || d2.d || ',' || d3.d || ',' || d4.d || ',' || d5.d || ',' || d6.d || ',' || d7.d || ',' || d8.d || ',' || d9.d || ',' || d10.d 
        from d_2 d2, d_2 d3, d_2 d4, d_2 d5, d_2 d6, d_2 d7, d_2 d8, d_2 d9, d_2 d10
),
pal_2 as (
        select '1' n from dual
        union
        select '1,1' n from dual
        union
        select n || ',' || reverse(n) n from pfx_2
        union
        select n || ',' || substr(reverse(n),3, 100) from pfx_2
),
pal_2_num as (
select eul_bin_to_num_wrapper(pal.n) pal_num,
replace(pal.n, ',','') pal_str
from pal_2 pal
),
d_10_1 as (select d from d_10 where d not in (0,2,4,6,8)),
pfx_10 as (
        select to_char(d) n from d_10_1
        union all
        select d1.d || d2.d  from d_10_1 d1, d_10 d2
        union all
        select d1.d || d2.d || d3.d from d_10_1 d1, d_10 d2, d_10 d3
),
pal_10 as (
        select n || reverse(n) n from pfx_10
        union
        select n || substr(reverse(n),2, 100) from pfx_10
),
pal_10_num as (
select to_number(pal.n) pal_num, pal.n pal_str
from pal_10 pal
)
select sum(p2.pal_num) from pal_2_num p10, pal_10_num p2
where p10.pal_num=p2.pal_num;
/

exit
