Create or replace PROCEDURE change_user_role(un in varchar, newrole in varchar) IS
  Cursor c1 is SELECT users.user_id, roles.role_name, users.user_name, roles.role_id from users, roles  
    where roles.role_id = users.role_id
    and users.user_name = un;

  Cursor c2 is SELECT roles.role_id from roles where roles.role_name = newrole;
  
  userid int;
  userrole varchar(200);
  username varchar(200);
  oroleid int;
  nroleid int;
  stmt_str VARCHAR(100);
  
BEGIN
  Open c1;
  Open c2;
  Loop
    fetch c1 into userid, userrole, username, oroleid; 
    fetch c2 into nroleid;
    exit when c1%notfound;

    /* make sure the user is not already this role */
    IF oroleid = nroleid THEN
      dbms_output.put_line('User ' || username || ' is already an ' || userrole);
    ELSE
      /* output confirmation to operator of the specified user and the original role */
      dbms_output.put_line('User: ' || username);
      dbms_output.put_line('Original Role: ' || userrole);
      /* construct an update statement */
      stmt_str := 'UPDATE users SET role_id = :r where user_id = :u';
      /* execute the update statement using the defined variables */
      EXECUTE IMMEDIATE stmt_str USING nroleid, userid;
      /* output confirmation to operator of the user's new role */
      dbms_output.put_line('New Role: ' || newrole);
    END IF;
  End loop;
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No users with that username are in the system');
END;

Begin
  change_user_role('syerkes', 'Admin'); 
End;