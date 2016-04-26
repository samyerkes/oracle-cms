Create or replace PROCEDURE old_content(dayssince in int) IS  
  /* create a cursor to select the websites and their visit counts */
  Cursor c1 is select contents.content_id, contents.content_name, contents.content_updated_time, users.user_name as last_updater 
    from contents, users 
    where contents.content_updated_time < sysdate - dayssince
    and users.user_id = contents.content_updated_by_user
    order by content_updated_time;

  /* declare variables */
  contentID int;
  contentName varchar(200);
  contentTime timestamp;
  lastUpdater varchar(200);
  contentDaysSince date;
  today date := sysdate;
  contentDate date;
BEGIN
  Open c1; -- open cursor
  Loop -- loop through cursor results
    fetch c1 into contentID, contentName, contentTime, lastUpdater;  -- fetch each result in to declared variables
    exit when c1%notfound; -- exit the loop when no more results are found
    contentDate := TO_CHAR(contentTime, 'MM/DD/YYYY'); -- format timestamp into just date
    dbms_output.put_line('Content ID: ' || contentID || ' Name: "' || contentName || '" was last updated ' || floor(round(today - contentDate, 1)) || ' days ago by ' || lastUpdater);  -- display operator output of old content, the days since updated needs to be substracted from the current date and then rounded down with floor
  End loop;  -- end the loop
  Close c1;  -- close the cursor
EXCEPTION
   when no_data_found then
     dbms_output.put_line('All content has been updated in the last ' || dayssince || ' days');
END;

Begin
  old_content(1); 
End;