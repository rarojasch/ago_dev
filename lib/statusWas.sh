ruta=`cat lib/configuracion.txt | awk '/ruta=/ && !/awk/ {print $2}'`
insta=`cat lib/configuracion.txt | awk '/insta=/ && !/awk/ {print $2}'`
user=`cat lib/configuracion.txt | awk '/user=/ && !/awk/ {print $2}'`
pass=`cat lib/configuracion.txt | awk '/pass=/ && !/awk/ {print $2}'`
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
