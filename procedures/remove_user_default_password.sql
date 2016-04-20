Create or replace PROCEDURE remove_user_default_password IS  
  Cursor c1 is select users.user_id, users.user_name from users where users.user_password = 'changeMe';
  userid int;
  uname varchar(200);
  stmt_str VARCHAR(300);
BEGIN
  Open c1;
    dbms_output.put_line('The following users have been removed from the CMS due to not updating their default password in 5 days:');  
    Loop
      fetch c1 into userid, uname;
          stmt_str := 'DELETE from users WHERE user_id = :userid';
            execute immediate stmt_str USING userid;
          exit when c1%notfound;
          dbms_output.put_line(uname);
    End loop;
  Close c1;
EXCEPTION
   when no_data_found then
     dbms_output.put_line('All users have good passwords');
END;

Begin
  remove_user_default_password(); 
End;

Begin
  add_user('syerkes2', 'Sam', 'Yerkes', 'Admin'); 
End;