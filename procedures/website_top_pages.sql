Create or replace PROCEDURE website_top_pages(websiteid in int, dayssince in int) IS  
  /* create a cursor to select the pages and their visit counts from the input parameter website */
  Cursor c1 is select pages.page_name, count(pages.page_id) as total_visits from websites, pages, visits
  where websites.website_id = pages.website_id
    and pages.page_id = visits.page_id
    and visits.visit_timestamp > sysdate - dayssince
    and websites.website_id = websiteid
  group by pages.page_id, pages.page_name
  order by total_visits desc, pages.page_id;

  /* declare variables */
  pageName varchar(200);
  visitCount int;
BEGIN
  Open c1; -- open cursor
  Loop -- loop through cursor results
    fetch c1 into pageName, visitCount;  -- fetch each result in to declared variables
    exit when c1%notfound; -- exit the loop when no more results are found
    dbms_output.put_line(pageName || ': ' || visitCount || ' visits in the last ' || dayssince || ' days');  -- display operator output of top pages and their visit counts
  End loop;  -- end the loop
  Close c1;  -- close the cursor
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No visits were found for that website');
END;

Begin
  website_top_pages(2, 14); 
End;