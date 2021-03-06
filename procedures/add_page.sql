Create or replace PROCEDURE add_page(ppar in int, pname in varchar, cname in varchar, ccontent in varchar, cuser in int) IS  
  Cursor pageOrderCursor is select website_id, page_order from pages where page_parent = ppar order by page_order desc;
  plastorder int;
  porder int;
  pwebsite int;
  pid int := pages_sequence.nextval;
  pagestmt varchar(300) := 'INSERT INTO pages VALUES (:pid, :wid, :pname, :porder, :pparid, CURRENT_TIMESTAMP)';
  contentstmt varchar(300) := 'INSERT INTO contents VALUES (contents_sequence.nextval, :cname, :ccontent, CURRENT_TIMESTAMP, :cuser, :pid)';
BEGIN
  /* check to make sure the user is not trying to add a page on the website root; they should be using the add_website procedure */
  if ppar = 0 then
    dbms_output.put_line('You can not add a page to the parent page: 0, please use the add_website procedure');
  else
    /* loop through the pages to the find the page with the highest page order */
    Open pageOrderCursor;
      for i in 1..1 loop
        fetch pageOrderCursor into pwebsite, plastorder;
          exit when pageOrderCursor%notfound;
      End loop;
    Close pageOrderCursor;

    /* add 1 to the page order */
    porder := (plastorder+1);

    /* Output a confirmation to the user about the page that is going to be added */
    dbms_output.put_line('A new page has been added to the pages table with the following values:');
    dbms_output.put_line('page_id: ' || pid);
    dbms_output.put_line('website_id: ' || pwebsite);
    dbms_output.put_line('page_name: ' || pname);
    dbms_output.put_line('page_order: ' || porder);
    dbms_output.put_line('page_parent: ' || ppar);

    /* Execute the query to input the page */
    EXECUTE IMMEDIATE pagestmt USING pid, pwebsite, pname, porder, ppar;

    /* Output a confirmation to the user about the piece of content that is going to be added */
    dbms_output.put_line('A new piece of content has been added to the contents table with the following values:');
    dbms_output.put_line('content_id: ' || contents_sequence.nextval);
    dbms_output.put_line('content_name: ' || cname);
    dbms_output.put_line('content_body: ' || ccontent);
    dbms_output.put_line('content_updated_time: ' || CURRENT_TIMESTAMP);
    dbms_output.put_line('content_updated_by_user: ' || cuser);
    dbms_output.put_line('page_id: ' || pid);

    /* Execute the query to input the content */
    EXECUTE IMMEDIATE contentstmt USING cname, ccontent, cuser, pid;
  end if; 
EXCEPTION
   when no_data_found then
     dbms_output.put_line('Could not add page to CMS');
END;

Begin
  add_page(1, 'Sams new page', 'My content heading', 'All the content', 2); 
End;