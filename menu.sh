#Main
while true
do
clear
echo ""
echo ""
echo "             Menu Was:"
echo "            +-------------------------------------------------------------+"
echo "            |                                                             |"
echo "            |   1. Status Was.                                            |"
echo "            |   2. Stop Was.                                              |"
echo "            |   3. Start Was.                                             |"
echo "            |   4. Matar Was.                                             |"
echo "            |   5. Reiniciar Was.                                         |"
echo "            |   6. Obtener Javacore.                                      |"
echo "            |   7. Respaldar App.                                         |"
echo "            |   8. Deploy Was.                                            |"
echo "            |   0. Finalizar.                                             |"
echo "            |                                                             |"
echo "            +-------------------------------------------------------------+"
echo ""
echo "                   Ingrese la opcion:"
read n
case ${n} in
        1)      clear
                sh lib/statusWas.sh
                ;;
        2)      clear
                sh lib/stopWas.sh
                ;;
        3)      clear
                sh lib/startWas.sh
                ;;
        4)      clear
                sh lib/killWas.sh
                ;;
        5)      clear
                sh lib/restartWas.sh
                ;;
        6)      clear
                sh lib/dumpWas.sh
		;;
        7)      clear
                ;;
        8)      clear
                ;;
        0)      break
                ;;
esac
done


