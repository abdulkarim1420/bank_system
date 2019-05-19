create or replace trigger old_new
after
update of balance on account for each row

begin
dbms_output.put_line('the old Balance: ' || :old.balance || ' and the new Balance: ' || :new.balance);
end;
/