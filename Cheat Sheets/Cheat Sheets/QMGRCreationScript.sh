exec &> qmgrcreate.log

echo "-------------------------------Start of Script. Logging to file 'qmgrcreate.log ---------------------------------------------------------------------"
echo "-------------------------------Creating Queue Mangaer KCB_UAT_FTEQM----------------------------------------------------------------------------------"
crtmqm KCB_UAT_FTEQM
echo "-------------------------------Displaying Queue Managers---------------------------------------------------------------------------------------------"
dspmq
echo "-------------------------------Starting Queue Mangaer------------------------------------------------------------------------------------------------"
strmqm KCB_UAT_FTEQM
echo "-------------------------------Displaying Queue Managers---------------------------------------------------------------------------------------------"
dspmq
echo "-------------------------------Displaying Queue Managers Details-------------------------------------------------------------------------------------"
echo "DIS QMGR ALL" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Defining Listener-----------------------------------------------------------------------------------------------------"
echo "define listener(KCB_UAT_FTEQM_LSNR) trptype(tcp) control(qmgr) port(1414)" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Starging Listener-----------------------------------------------------------------------------------------------------"
echo "start listener(KCB_UAT_FTEQM_LSNR)" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Displaying all listeners----------------------------------------------------------------------------------------------"
echo "DISPLAY LISTENER(*) ALL" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Displaying listener status -------------------------------------------------------------------------------------------"
echo "DISPLAY LSSTATUS(KCB_UAT_FTEQM_LSNR)" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Defining Channel -----------------------------------------------------------------------------------------------------"
echo "DEFINE CHANNEL(SYTEM.DEF.SVRCONN) CHLTYPE(SVRCONN) TRPTYPE(TCP) MCAUSER('mqm')" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Disabling Channel Authentication--------------------------------------------------------------------------------------"
echo "alter qmgr chlauth(disabled)" | runmqsc KCB_UAT_FTEQM
echo "-------------------------------Checking listeners status---------------------------------------------------------------------------------------------"
echo "DISPLAY LISTENER(*) PORT " | runmqsc KCB_UAT_FTEQM
echo "-------------------------------End of Script---------------------------------------------------------------------------------------------------------"
