ruta="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/stopServer.sh"
ruta2="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh"
insta="server1"
rutaSP="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/server1.pid"
rtemp="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/temp/*"
rtran="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/tranlog/*"
rwste="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/wstemp/*"
user="wasadmin"
pass="wasadmin1"

stopW()
{
	if [ -f $rutaSP ]
	then
			pid=`cat $rutaSP`
			appservice=`ps -fea | grep $pid | egrep -v grep | awk '{print $2}'`
			if [ $appservice = $pid ]
			then
					echo `$ruta $insta "-username" $user "-password" $pass `
					echo `rm -rf $rtemp`
					echo `rm -rf $rwste`
					echo `rm -rf $rtran`
					echo "El servicio se a detenido, eliminado el contenido de las carpetas temp, tranlog y wstemp"
			else
					echo "El pid no concuerda con el servicio a detener, favor de detenerlo de manera manual"
			fi
	else
			echo "El servicio ya se encuentra detenido"
	fi
}

startW()
{	
			echo `$ruta2 $insta `
			pid=`cat $rutaSP`
			appservice=`ps -fea | grep $pid | egrep -v grep | awk '{print $2}'`
			if [ $pid = $appservice]
			then
				echo "El servicio se ha reiniciado de manera correcta."
			fi
			
}

stopW;sleep 2;clear;startW

read -rsp $'Pulsa cualquier tecla para continuar\n' -n1 key

