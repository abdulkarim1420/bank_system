create or replace PROCEDURE add_new_client (id in number, name in varchar2, city in varchar2)
is

acc_n number;
begin
	select nvl(max(acc_no), 110)+1 into acc_n from account;
	
insert all 
into client values (id, name, city)
into account values (acc_n, 0, null, id)
select * from dual;

end;
/

-- main
declare
id number :=&enter_id;
name varchar2(25) :='&enter_name';
city varchar2(25) :='&enter_city';

begin
add_new_client(id, name, city);
	dbms_output.put_line('Client Added!');
	
	EXCEPTION
when DUP_VAL_ON_INDEX then
	dbms_output.put_line('Client ID is Already Used!');
end;
/