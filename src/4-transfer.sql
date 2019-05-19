create or replace PROCEDURE transfer (sender in number, receiver in number, amount in number)
is
bal_s number;
bal_r number;
amount_s number;
amount_r number;

begin
select balance into bal_s
from account
where acc_no = sender;

select balance into bal_r
from account
where acc_no = receiver;

if amount <= bal_s then
amount_s := bal_s - amount;
update account set balance = amount_s
where acc_no = sender;

amount_r := bal_r + amount;
update account set balance = amount_r
where acc_no = receiver;

elsif amount > bal_s then
dbms_output.put_line('The requested amount is not available!');
end if;

end;
/

-- main

declare
sender number :=&enter_sender_account_number;
receiver number :=&enter_receiver_account_number;
amount number :=&enter_amount;

begin
transfer(sender, receiver, amount);
end;
/