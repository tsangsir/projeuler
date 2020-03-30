create or replace function same_digits(p_string in varchar2) return varchar2 deterministic
as
     rv varchar2(4000);
     ch  varchar2(1);
     type vcArray is table of varchar2(4000) index by varchar2(1);
     sorted vcArray := vcArray();

     key varchar2(1);

     c char;
     p number;
     min_c char := null;

begin

     if p_string = substr(p_string, 2, 100) || substr(p_string, 1, 1) then
	return 'Y';
     else 
	return 'N';
     end if;

end;
/
