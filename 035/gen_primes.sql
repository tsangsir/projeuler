create or replace procedure gen_primes(target number) 
as
	cur number ;
	n number;
begin
	select max(p) + 2 into cur from euler_primes;

	if cur is null then
		cur := 3;
		insert into euler_primes values (2, 4);
	if cur = 4 then
		cur := 3;
	end if;

	while cur < target loop
		if mod(cur, 5) != 0 then
			select count(*) into n from euler_primes
			where p < sqrt(cur)
			and cur / p = round(cur / p)
			and rownum = 1;

			if n = 0 then
				insert into euler_primes values (cur, cur * cur);
			end if;
		end if;
		cur := cur + 2;
	end loop;
end;
/


	

