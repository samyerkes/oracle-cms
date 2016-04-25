Create or replace PROCEDURE remove_user(un in varchar) IS
  Cursor c1 is SELECT users.user_id, users.user_name from users  
    where users.user_name = un;
  
  userid int;
  username varchar(200);
  user_stmt_str VARCHAR(400);
  user_website_stmt_str VARCHAR(400);
BEGIN
  Open c1;
  Loop
    fetch c1 into userid, username; 
    exit when c1%notfound;
      /* give confirmation to operator that they have found the correct user */
      dbms_output.put_line('User ID: ' || userid);
      dbms_output.put_line('User Name: ' || username);
  End loop;
  /* construct a new delete statement to delete all user records in the users_websites table that correspond to this user */
  user_website_stmt_str := 'DELETE FROM users_websites WHERE user_id = :userid';
  /* execute the delete statement using the input parameter */
  EXECUTE IMMEDIATE user_website_stmt_str USING userid;

  /* construct a new delete statement to delete all user records in the users table that correspond to this user */
  user_stmt_str := 'DELETE FROM users WHERE user_id = :userid';
  /* execute the delete statement using the input parameter */
  EXECUTE IMMEDIATE user_stmt_str USING userid;

  /* if a user has been found in the cursor and deleted then provide confirmation to the operator */
  if c1%rowcount > 0 then
    /* provide confirmation to the operator that this user has been deleted  from the CMS */
    dbms_output.put_line('User ' || username || ' has been removed from the CMS');
  else
    dbms_output.put_line('No user with that username are in the system'); 
  end if;
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No users with that username are in the system');
END;

Begin
  remove_user('syerkes'); 
End;