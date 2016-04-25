Create or replace PROCEDURE top_websites(dayssince in int) IS  
  /* create a cursor to select the websites and their visit counts */
  Cursor c1 is select websites.website_address, count(visits.visit_ip) as totalHits from websites, pages, visits
      where websites.website_id = pages.website_id
        and pages.page_id = visits.page_id
        and visits.visit_timestamp > sysdate - dayssince
      group by websites.website_address
      order by totalHits desc;

  /* declare variables */
  websiteName varchar(200);
  visitCount int;
BEGIN
  Open c1; -- open cursor
  Loop -- loop through cursor results
    fetch c1 into websiteName, visitCount;  -- fetch each result in to declared variables
    exit when c1%notfound; -- exit the loop when no more results are found
    dbms_output.put_line(websiteName || ': ' || visitCount || ' visits in the last ' || dayssince || ' days');  -- display operator output of top pages and their visit counts
  End loop;  -- end the loop
  Close c1;  -- close the cursor
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No visits were found for this system');
END;

Begin
  top_websites(21); 
End;