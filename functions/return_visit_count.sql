Create or replace function return_visit_count(webid in int, dayssince in int) return int
IS visit_count int;
BEGIN
  /* counts all the visits to this website in the days since specified in the function */
  select count(visit_ip) into visit_count from visits, pages, websites
    where visits.page_id = pages.page_id
    and websites.website_id = pages.website_id
    and websites.website_id = webid
    and visits.visit_timestamp > sysdate - dayssince;
  return visit_count;
exception
 /* if no data is found throw an exception */
  when no_data_found then
    dbms_output.put_line('No visits have been recorded for this website');
End;

DECLARE
  visit_count int := return_visit_count(2, 30);
BEGIN
  dbms_output.put_line(visit_count);
END;