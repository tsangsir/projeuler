set timing on
set serverout on

declare
    log_1_pt_23 binary_double := log(10, 1.23);
    log_1_pt_24 binary_double := log(10, 1.24);
    log_2 binary_double := log(10, 2);
    log_4 binary_double := log(10, 4);
    log_8 binary_double := log(10, 8);
    log_16 binary_double := log(10, 16);
    total binary_double := 0;
    iter pls_integer := 0;
    found_count pls_integer := 0;
    
    log_12_pt_3_minus_log_2 binary_double := log_1_pt_23 - log_2 + 1;
    log_12_pt_4_minus_log_2 binary_double := log_1_pt_24 - log_2 + 1;
    log_12_pt_3_minus_log_4 binary_double := log_1_pt_23 - log_4 + 1;
    log_12_pt_4_minus_log_4 binary_double := log_1_pt_24 - log_4 + 1;
    log_12_pt_3_minus_log_8 binary_double := log_1_pt_23 - log_8 + 1;
    log_12_pt_4_minus_log_8 binary_double := log_1_pt_24 - log_8 + 1;
   
begin
    while found_count < 678910 loop
        if total > log_12_pt_3_minus_log_2 then
            if total < log_12_pt_4_minus_log_2 then
                found_count := found_count + 1;
            end if;
            total := total + log_2 - 1;
            iter := iter + 1;
        elsif total > log_12_pt_3_minus_log_4 then
            if total < log_12_pt_4_minus_log_4 then
                found_count := found_count + 1;
            end if;
            total := total + log_4 - 1;
            iter := iter + 2;
        elsif total > log_12_pt_3_minus_log_8 then
            if total < log_12_pt_4_minus_log_8 then
                found_count := found_count + 1;
            end if;
            total := total + log_8 - 1;
            iter := iter + 3;
        else
            total := total + log_16 - 1;
            iter := iter + 4;
        end if;
    end loop;
    dbms_output.put_line(iter || ', ' || found_count );
end;
/

