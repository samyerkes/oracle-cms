Create or replace PROCEDURE move_page(pid in int, direction in varchar) IS  
  parentid int;
  Cursor c1 is SELECT PAGE_NAME from pages where page_parent = parentid;
  pageName varchar(200);
BEGIN
  SELECT page_parent into parentid from pages where page_id = pid;
  open c1;
    loop
      fetch c1 into pageName;
      exit when c1%notfound;
      dbms_output.put_line('name = ' || pageName);
    END LOOP;

  if c1%rowcount > 1 then
    dbms_output.put_line('Page has siblings. Continuing on with the checks...');
    
    if direction = 'down' then
      dbms_output.put_line('Moving page ' || pid || ' down in the order...');
    elsif direction = 'up' then
      dbms_output.put_line('Moving page ' || pid || ' up in the order...');
    else
      dbms_output.put_line('Not a valid direction, please use either the words up or down.');
    end if;
  else
      dbms_output.put_line('Page does not have any siblings so it will not be moved');
  end if;

Close c1; 
EXCEPTION
   when no_data_found then
     dbms_output.put_line('Could not move page in CMS');
END;

Begin
  move_page(12, 'up'); 
End;

select * from pages where page_parent = 10;