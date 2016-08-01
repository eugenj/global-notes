--RESTORE FILELISTONLY FROM DISK='c:\DB\Backup\CoreEfile.bak'

RESTORE DATABASE CoreEfilePrev FROM DISK='c:\DB\Backup\CoreEfile.bak'
WITH 
   MOVE 'CoreEfile' TO 'c:\DB\CoreEfilePrev.mdf',
   MOVE 'CoreEfile_log' TO 'c:\DB\CoreEfilePrev_log.ldf'