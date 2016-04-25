CREATE OR REPLACE TRIGGER content_timestamp
BEFORE UPDATE ON contents
for each row
BEGIN
  /* Use the new keyword to update the time with the system timestamp */
  :new.CONTENT_UPDATED_TIME := SYSTIMESTAMP;
  /* Output a confirmation so the user knows the timestamp has automatically be updated */
  dbms_output.put_line('Content_updated_time for content id #' || :old.content_id || ' has been updated to: ' || :new.content_updated_time);
end;