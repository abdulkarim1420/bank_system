create or replace PROCEDURE delete_loan (l_no in number)
is

begin
delete from payment where lno = l_no;
delete from loan where lno = l_no;
end;
/

-- main

declare
l_no number :=&enter_loan_number;
begin
delete_loan(l_no);
end;
/

-- trigger backup1

create or replace trigger backup
before delete
	on loan for each row

begin
insert into loan_backup values (:old.lno, :old.amount, :old.loan_term, :old.interest_rate, :old.c_id);
end;
/

-- trigger backup2

create or replace trigger backup2
before delete
	on payment for each row

begin
insert into payment_backup values (:old.lno, :old.pno, :old.pamount, :old.pdate, :old.status);
end;
/