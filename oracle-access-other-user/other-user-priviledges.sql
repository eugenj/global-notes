--Permissions for corecms on corecms_prev 
BEGIN
  FOR tab IN (SELECT table_name
              FROM all_tables
              WHERE owner = 'CORECMS_PREV'
                    AND iot_type IS NULL OR iot_type != 'IOT_OVERFLOW' ) LOOP
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || tab.table_name || ' TO CORECMS';
  END LOOP;
END;