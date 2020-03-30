create or replace function sort_chars(p_string in varchar2) return varchar2 deterministic
/* Copy from https://stackoverflow.com/questions/2835634/sort-chars-in-varchar2-alphabetically */
as
     rv varchar2(4000);
     ch  varchar2(1);
     type vcArray is table of varchar2(4000) index by varchar2(1);
     sorted vcArray := vcArray();

     key varchar2(1);

begin
     sorted := vcArray();
     for i in 1 .. length(p_string)
     loop
        ch := substr(p_string, i, 1);

        if (sorted.exists(ch))
        then 
            sorted(ch) := sorted(ch) || ch;
        else
            sorted(ch) := ch;
        end if;
     end loop;


    rv := '';
    key  := sorted.FIRST;
    WHILE key IS NOT NULL LOOP
        rv := rv || sorted(key);
        key := sorted.NEXT(key);
    END LOOP;

     return rv;
end;
/
