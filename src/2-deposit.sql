create or replace PROCEDURE deposit (acc_n in number, bal in number)
is 

begin

update account
set balance = balance + bal, trans_time = to_date(sysdate, 'HH:MI:SS')
WHERE acc_no = acc_n;

end;
/

-- main

declare
acc_n number :=&enter_account_number; 
bal number :=&enter_balance;

begin
deposit(acc_n,bal);
	dbms_output.put_line('Balance credited to account!');
end;
/