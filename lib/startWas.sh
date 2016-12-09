ruta="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh"
insta="server1"
rutaSP="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/server1.pid"
user="wasadmin"
pass="wasadmin1"

if [ -f $rutaSP ];
then
    echo "FALLO CTM"
else
    echo `$ruta $insta`
	echo "Servicio ya iniciado"
    
fi
