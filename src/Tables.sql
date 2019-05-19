create table Account (acc_no number primary key, balance number, trans_time date, c_id number, foreign key (c_id) REFERENCES client (c_id));

--

create table Client (c_id number primary key, c_name varchar2(25), city varchar2(25));

--

create table Loan (lno number primary key, amount number, loan_term number(2), interest_rate number(3), c_id number, foreign key (c_id) REFERENCES client (c_id)); 

--

create table Payment (pno number, lno number, pamount number, pdate date, status varchar2(6), primary key (pno,lno), foreign key (lno) REFERENCES loan (lno));

-- backup tables

create table Loan_backup (lno number, amount number, loan_term number(2), interest_rate number(3), c_id number); 

--

create table Payment_backup (pno number, lno number, pamount number, pdate date, status varchar2(6));

