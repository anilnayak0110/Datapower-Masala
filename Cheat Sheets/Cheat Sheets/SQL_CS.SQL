$ lsnrctl start 		-- Starts the Listner controller
$ lsnrctl status 		-- Check the status of the Listner controller
$ ps -ef | grep pmon	-- Lists databases in the system. 
$ dbca					-- Opens UI to configure a new Database
$ sqlplus / as sysdba	-- Connects to databsse as sysdba
sql> startup			-- Starts the databases




--Selecting count from two different tables in a single row. 

SELECT  (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_LOGB
        ) AS bcount,
        (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_LOGt
        ) AS tcount,
         (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_MON_HANDLER
        ) AS hcount,
            (
        SELECT COUNT(*)
        FROM   ESBCORE_IIB_EXCEPTIONS
        ) AS ecount
FROM    dual

--Deleting data from two different tables using a common identifier (column name) --NOT WORKING 

DELETE ESBCORE_SERVICE_LOGB , ESBCORE_SERVICE_LOGT  FROM ESBCORE_SERVICE_LOGB  INNER JOIN ESBCORE_SERVICE_LOGT  
WHERE ESBCORE_SERVICE_LOGB.ESB_MESSAGE_ID= ESBCORE_SERVICE_LOGT.ESB_MESSAGE_ID  

delete from ESBCORE_SERVICE_STARTB;
delete from ESBCORE_SERVICE_STARTT;
delete from ESBCORE_SERVICE_ENDB;
delete from ESBCORE_SERVICE_ENDT;
delete from ESBCORE_SERVICE_MON_HANDLER;
delete from ESBCORE_IIB_EXCEPTIONS;
delete from ESBCORE_SERVICE_MESSAGE_ID;

SELECT  (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_STARTB
        ) AS STARTB,
        (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_STARTT
        ) AS STARTT,
         (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_ENDB
        ) AS ENDB,
            (
        SELECT COUNT(*)
        FROM   ESBCORE_SERVICE_ENDT
        ) AS ENDT,
        (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_MON_HANDLER
        ) AS HANDLER,
          (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_MON_HANDLER where broker_name='KCB_UAT_IIBNODE1'
        ) AS UAT_107, 
         (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_MON_HANDLER where broker_name='KCB_UAT_IIBNODE2'
        ) AS UAT_100,
        (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_MON_HANDLER where broker_name='KCB_DEV_IIBNODE2'
        ) AS SIT_61,
         (
        SELECT COUNT(*) 
        FROM ESBCORE_IIB_EXCEPTIONS 
        ) AS IIB_X,
        (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_MESSAGE_ID
        ) AS uniqueIDs,
         (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_ENDB where SERVICE_STATUS='ERROR'
        ) AS B_err,
        (
        SELECT COUNT(*) 
        FROM ESBCORE_SERVICE_ENDT where SERVICE_STATUS='ERROR'
        ) AS T_err
FROM    dual