set serverout on 
declare
    a number(16,0) := 1504170715041707;
    n number(16,0) := 4503599627370517;
    cur number(16,0) := a;
    last_ecoin number(16,0) := 9999999999999999;
    found number := 0;
    iter number :=1;
begin
    begin
        select remainder, coin
        into cur, last_ecoin
        from (
            select ec.*,
	    row_number() over (order by ec.n desc) r
            from eulercoin ec
        )
        where r = 1;
    exception when NO_DATA_FOUND then
	null;
    end;
    
    while found <= 10 loop
        if cur < last_ecoin then
            dbms_output.put_line('Found EulerCoin: ' || cur);
	    insert into eulercoin values (
		iter, cur, cur);
	    last_ecoin := cur;
	    found := found + 1;
        else
            if mod(iter, 5000) = 0 then
	        insert into eulercoin values (
		   iter, cur, null);
	        commit;
	    end if;
	end if;
	cur := cur + a;
	iter := iter + 1;
        if cur > n then 
            cur := cur - n;
	end if;
    end loop;
end;
/

    

