create or replace PROCEDURE pay (l_no in number, p_no in number)
is 

begin
update payment set status = 'paid' where lno = l_no and pno = p_no;
end;
/

-- main

declare
l_no number :=&enter_loan_number;
p_no number :=&enter_payment_number;
begin
pay(l_no, p_no);
end;
/