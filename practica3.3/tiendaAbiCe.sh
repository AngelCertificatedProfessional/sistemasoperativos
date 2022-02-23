#chmod u=rwx,g=r,o=r tiendaAbiCe.sh
clear
nContinuar=1
echo "---Bienvenido a la tiendita de GM-----"
while [ $nContinuar -eq 1 ]
do
    nDia=0
    while [ $nDia -lt 1 -o $nDia -gt 7 ]
    do
        echo "Favor de ingresar el dia: (1 a 7)"
        read nDia
        if [ $nDia -lt 1 -o $nDia -gt 7 ]
            then
            echo "El dia tiene que estar entre el rango de: (1 a 7)"
            echo "Favor de volver a ingresar el dia"
        fi
    done
    
    nHora=-1
    while [ $nHora -lt 0 -o $nHora -gt 23 ]
    do
        echo "Favor de ingresar la hora: (0,23)"
        read nHora
    done

    case $nDia in
        1 | 2 | 3 | 4 | 5)
            if [ $nHora -ge 8 -a $nHora -lt 20 ]
            then
                echo "Abierto"
            else
                echo "Cerrado"
            fi
            ;;
        6)
            if [ $nHora -ge 9 -a $nHora -lt 14 ]
            then
                echo "Abierto"
            else
                echo "Cerrado"
            fi
            ;;
        7)
            if [ $nHora -ge 10 -a $nHora -lt 14 ]
            then
                echo "Abierto"
            else
                echo "Cerrado"
            fi
            ;;
        *)
            echo "No se tiene el dia"
            ;;
    esac


    echo "Desea continuar Si/No: "
    read sContinuar
    if [[ ${sContinuar^^} = "SI" ]]
    then
        nContinuar=1
    else
        nContinuar=0
    fi

done