Create or replace PROCEDURE visits_by_geo(website in int) IS 
  /* open up a cursor to collect the visit_ips of people who have viewed this website */ 
  Cursor c1 is select visit_ip from visits, pages
    where visits.page_id = pages.page_id
    and pages.website_id = website;

  /* Declare variables */
  ip_address varchar(15);
  ip_octet number;
  
  /* Give each content a base count */
  n_america int := 0;
  s_america int := 0;
  europe int := 0;
  africa int := 0;
  asia int := 0;
  australia int := 0;
  antarctica int := 0;
BEGIN
  Open c1; -- open cursor
  Loop -- begin loop
    fetch c1 into ip_address; -- add the data into the ip_address variable
      ip_octet := to_number(REGEXP_SUBSTR(ip_address,'(\d{1,3})'));  -- regex out the first digits up until the first period, then convert that varchar to a number

      /* if the digits fall within a certain range add one to each continents count */
      if ip_octet < 36 then
        n_america := n_america + 1;
      elsif ip_octet >= 36 and ip_octet < 72 then
        s_america := s_america + 1;
      elsif ip_octet >= 72 and ip_octet < 108 then
        europe := europe + 1;
      elsif ip_octet >= 108 and ip_octet < 144 then
        africa := africa + 1;
      elsif ip_octet >= 144 and ip_octet < 180 then
        asia := asia + 1;
      elsif ip_octet >= 180 and ip_octet < 216 then
        australia := australia + 1;
      else
        antarctica := antarctica + 1;
      end if;

    exit when c1%notfound; -- exit the loop when no more data is found
  End loop; -- close the loop
  Close c1; -- close the cursor

  /* output operation confirmation to the user */
  dbms_output.put_line('Website #' || website || ' received the following hits from different continents:');
  
  /* output each continents count */
  dbms_output.put_line('North America: ' || n_america);
  dbms_output.put_line('South America: ' || s_america);
  dbms_output.put_line('Europe: ' || europe);
  dbms_output.put_line('Africa: ' || africa);
  dbms_output.put_line('Asia: ' || asia);
  dbms_output.put_line('Australia: ' || australia);
  dbms_output.put_line('Antarctica: ' || antarctica);
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No visit data could be found');
END;

Begin
  visits_by_geo(5); 
End;