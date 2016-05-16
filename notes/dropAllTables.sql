declare

v_str1 varchar2(200) := null;

cursor get_sql is
select
     'drop '||object_type||' '|| object_name|| DECODE(OBJECT_TYPE,'TABLE',' CASCADE CONSTRAINTS PURGE') v_str1
from user_objects
where object_type in ('TABLE','VIEW','PACKAGE','TYPE','PROCEDURE','FUNCTION','SEQUENCE') 
  and object_name not like '%$%'
order by object_type,object_name;

begin

open get_sql;

loop

fetch get_sql into v_str1;

          if get_sql%notfound
          then exit; 
          end if;
  BEGIN
    execute immediate v_str1;
  Exception
    When Others Then
      dbms_output.put_line('drop failed ' || v_str1);
  End;

end loop;

close get_sql;

end; 
/
exit



CREATE OR REPLACE DIRECTORY test_dir AS 'c:\d\TEST_DIR\';
GRANT READ, WRITE ON DIRECTORY test_dir TO CORECMS;


--- impdp SYSTEM/Oracle11 remap_schema=CORECMS_QA:CORECMS DIRECTORY=TEST_DIR DUMPFILE=CORECMS_QA_1.8.DMP LOGFILE=import.log