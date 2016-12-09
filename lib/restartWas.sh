ruta=`cat lib/configuracion.txt | awk '/ruta=/ && !/awk/ {print $2}'`
ruta2=`cat lib/configuracion.txt | awk '/ruta2=/ && !/awk/ {print $2}'`
insta=`cat lib/configuracion.txt | awk '/insta=/ && !/awk/ {print $2}'`
rutaSP=`cat lib/configuracion.txt | awk '/rutaSP=/ && !/awk/ {print $2}'`
rtemp=`cat lib/configuracion.txt | awk '/rtemp=/ && !/awk/ {print $2}'`
rtran=`cat lib/configuracion.txt | awk '/rtran=/ && !/awk/ {print $2}'`
rwste=`cat lib/configuracion.txt | awk '/rwste=/ && !/awk/ {print $2}'`
user=`cat lib/configuracion.txt | awk '/user=/ && !/awk/ {print $2}'`
pass=`cat lib/configuracion.txt | awk '/pass=/ && !/awk/ {print $2}'`

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
			appservice=`ps -fea | grep $insta | egrep -v grep | awk '{print $2}'`
			var=${#appservice}
			if (( $var  > 2  ));
			then
					echo `$ruta $insta "-username" $user "-password" $pass `
					echo `rm -rf $rtemp`
					echo `rm -rf $rwste`
					echo `rm -rf $rtran`
					echo "El servicio se a detenido, eliminado el contenido de las carpetas temp, tranlog y wstemp"
			else
					echo "El proceso no existe."
			fi
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

