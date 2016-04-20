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

      dbms_output.put_line('User ID: ' || userid);
      dbms_output.put_line('User Name: ' || username);
  End loop;
  user_website_stmt_str := 'DELETE FROM users_websites WHERE user_id = :userid';
  EXECUTE IMMEDIATE user_website_stmt_str USING userid;

  user_stmt_str := 'DELETE FROM users WHERE user_id = :userid';
  EXECUTE IMMEDIATE user_stmt_str USING userid;
  dbms_output.put_line('User ' || username || ' has been removed from the CMS');
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No users with that username are in the system');
END;

Begin
  remove_user('syerkes'); 
End;