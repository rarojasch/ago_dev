ruta="/u01/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/serverStatus.sh"
insta="server1"
user="wasadmin"
pass="wasadmin1"
estado=`echo $ruta $insta "-username" $user "-password" $pass`
estadoD=`$estado | awk '/stopped/ && !/awk/ {print "detenido"}'`
estadoS=`$estado | awk '/STARTED/ && !/awk/ {print "corriendo"}'`

if [ "$estadoD" = "detenido" ]
then
	echo "El servicio se encuentra detenido"
elif [ "$estadoS" = "corriendo"  ]
then
	echo "El servicio se encuentra operativo"
else
	echo "el servicio se encuentra en un estado desconocido"
fi

read -rsp $'Pulsa cualquier tecla para continuar\n' -n1 key
