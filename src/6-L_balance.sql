create or replace PROCEDURE L_balance (bal in number)
is

name client.c_name%type;
c_bal account.balance%type;
count_client number;
new_exception EXCEPTION;

cursor names_balances is
select client.c_name, account.balance
from account, client
where account.c_id = client.c_id and balance <= bal;

begin
select count(balance) into count_client
from account where balance <= bal;

open names_balances;
loop 
fetch names_balances into name,c_bal;
exit when names_balances%notfound;
dbms_output.put_line('Name: ' || name || ' Balance: ' || c_bal);
end loop;

if count_client = 0 then
Raise no_data_found;
else
dbms_output.put_line('Number of clients: ' || count_client);
end if;

close names_balances;

if bal < 0 then
raise new_exception;
end if;

EXCEPTION
when NO_DATA_FOUND then
dbms_output.put_line('no one is less than (amount)');
when new_exception then
dbms_output.put_line('the amount must be equal or greater than 0');
when others then
dbms_output.put_line('Error!');
end;
/

-- main

declare
bal number :=&enter_balance;
begin
L_balance(bal);
end;
/