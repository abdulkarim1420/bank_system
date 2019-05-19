create or replace PROCEDURE withdrawal (acc_n in number, withdraw in number)
is

bal number;
begin
select balance into bal 
from account
where acc_no = acc_n;

if withdraw <= bal then
bal := bal - withdraw;
update account set balance = bal, trans_time = to_date(sysdate, 'HH:MI:SS') where acc_no = acc_n;
dbms_output.put_line('Balance withdrawn!');

else
dbms_output.put_line('Sorry, your balance is not enough');
end if;

end;
/


-- main

declare
acc_n number :=&enter_account_number;
withdraw number :=&enter_withdraw;

begin
withdrawal(acc_n, withdraw);
end;
/