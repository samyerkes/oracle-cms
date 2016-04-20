Create or replace PROCEDURE add_user(un in varchar, fname in varchar, lname in varchar, newrole in varchar) IS  
  Cursor c1 is SELECT roles.role_id from roles where roles.role_name = newrole;
  roleid int;
  stmt_str VARCHAR(500);
  pwd varchar(200) := 'changeMe';
BEGIN
  Open c1;
  Loop
    fetch c1 into roleid;
    exit when c1%notfound;
  End loop;
  stmt_str := 'INSERT INTO users (user_id, user_name, user_password, user_fname, user_lname, user_last_login, role_id) VALUES (users_sequence.nextval, :un, :pwd, :fname, :lname, CURRENT_TIMESTAMP, :roleid)';
  EXECUTE IMMEDIATE stmt_str USING un, pwd, fname, lname, roleid;
  dbms_output.put_line(fname || ' ' || lname || ' (' || un || ') has been imported into the CMS as a ' || newrole);
  dbms_output.put_line('Please have ' || fname || ' log into the CMS and change the default password');
EXCEPTION
   when no_data_found then
   dbms_output.put_line('User was not able to added to the system');
END;

Begin
  add_user('syerkes', 'Sam', 'Yerkes', 'Admin'); 
End;