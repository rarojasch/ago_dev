insta=`cat lib/configuracion.txt | awk '/insta=/ && !/awk/ {print $2}'`
rutaSP=`cat lib/configuracion.txt | awk '/rutaSP=/ && !/awk/ {print $2}'`

if [ -f $rutaSP ];
then
        pid=`cat $rutaSP`
        appservice=`ps -fea | grep $pid | egrep -v grep | awk '{print $2}'`
        if [ $appservice = $pid ]
        then
                kill -3 $pid
                echo "se ha obtenido el javacore del servicio $pid."
        else
                echo "El proceso no existe."
        fi
else
        appservice=`ps -fea | grep $insta | egrep -v grep | awk '{print $2}'`
        var=${#appservice}
        if (( $var  > 2  ));
        then
                kill -3 $appservice
                echo "se ha obtenido el javacore del servicio $appservice."
        else
                echo "El proceso no existe."
        fi

fi

read -rsp $'Pulsa cualquier tecla para continuar\n' -n1 key

