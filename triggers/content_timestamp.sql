CREATE OR REPLACE TRIGGER content_timestamp
BEFORE UPDATE ON contents
for each row
BEGIN
  :new.CONTENT_UPDATED_TIME := SYSTIMESTAMP;
  dbms_output.put_line('Content_updated_time for content id #' || :old.content_id || ' has been updated to: ' || :new.content_updated_time);
end;