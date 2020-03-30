create or replace function rotate_min(p_string in varchar2) return varchar2 deterministic
as
     p number := 1;
     min_str varchar2(100) := p_string;
     rot_str varchar2(100) ;

begin
	
     for i in 2 .. length(p_string)
     loop
	rot_str := substr(p_string, i, 100) || substr(p_string, 1, i-1) ;
        --dbms_output.put_line('Checking ' || rot_str );
        if rot_str < min_str then
	    min_str := rot_str;
	    p := i;
	end if;
     end loop;
     return min_str;
end;
/
