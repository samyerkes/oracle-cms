CREATE OR REPLACE TRIGGER page_timestamp
BEFORE UPDATE ON pages
for each row
BEGIN
  :new.PAGE_LAST_REVISED := SYSTIMESTAMP;
  dbms_output.put_line('Page_last_revised for page id #' || :old.page_id || ' has been updated to: ' || :new.page_last_revised);
end;