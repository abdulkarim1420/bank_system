create or replace PROCEDURE new_loan (l_amount in number, l_term in number, i_rate in number, id in number)
is
loan_no number;
pay_no number;

begin
select nvl(max(lno), 0)+1 into loan_no from loan;

insert into loan values (loan_no, l_amount, l_term, i_rate, id);

pay_no := l_term * 12;

for i in 1..pay_no loop
insert into payment (lno, pno, pamount, pdate, status) values (loan_no, i, (l_amount + (l_amount * i_rate * l_term)) / (l_term*12) , to_date(add_months(sysdate, i) , 'dd/mm/yy'), 'unpaid');
end loop;

end;
/

-- main

declare
l_amount number :=&enter_loan_amount;
i_rate number :=&enter_interest_rate;
l_term number :=&enter_loan_term;
id number :=&enter_client_id;

begin
new_loan(l_amount, l_term, i_rate, id);
end;
/