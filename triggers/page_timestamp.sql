CREATE OR REPLACE TRIGGER page_timestamp
BEFORE UPDATE ON pages
for each row
BEGIN
  /* Use the new keyword to update the time with the system timestamp */
  :new.PAGE_LAST_REVISED := SYSTIMESTAMP;
  /* Output a confirmation so the user knows the timestamp has automatically be updated */
  dbms_output.put_line('Page_last_revised for page id #' || :old.page_id || ' has been updated to: ' || :new.page_last_revised);
end;