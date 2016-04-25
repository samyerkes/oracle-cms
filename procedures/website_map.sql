Create or replace PROCEDURE website_map(website in int) IS  
  rootPage int;
  Cursor c1 is SELECT page_name, page_parent FROM pages
    START WITH page_id = rootPage
    CONNECT BY page_parent = PRIOR page_id;
  pageName varchar(200);
  pageParent int;
  pageParentCounter int := 0;
  loopCounter int := 0;

BEGIN
  select page_id into rootPage from pages where website_id = website and page_parent = 0;
  Open c1;
  Loop
    fetch c1 into pageName, pageParent;
      exit when c1%notfound;

    if pageParent != pageParentCounter then
      if pageParent > pageParentCounter then
        loopCounter := loopCounter +1;
      else
        loopCounter := loopCounter -1;
      end if;
    end if;

      for i in 1..loopCounter loop
        dbms_output.put(' -- ');
      end loop;

    dbms_output.put('Page: ' || pageName);

    pageParentCounter := pageParent;

    dbms_output.new_line;
  End loop;
  Close c1;
EXCEPTION
   when no_data_found then
     dbms_output.put_line('No website found');
END;

Begin
  website_map(2); 
End;