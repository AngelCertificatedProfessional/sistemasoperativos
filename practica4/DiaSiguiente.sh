#chmod u=rwx,g=r,o=r DiaSiguiente.sh
clear
nContinuar=1
echo "Bienvenido al detector de dias"
while [ $nContinuar -eq 1 ]
do
    echo "Favor de ingresar la fecha del la siguiente manera dd/mm/yyyy"
    read sFecha
    array=(${sFecha//// })
    
    for i in "${!array[@]}"
    do
        case $i in
            0)
                nDia=${array[i]}
            ;;
            1)
                nMes=${array[i]}
            ;;
            2)
                nAnio=${array[i]}
            ;;
        esac
    done

    nDiaNuevo=$(expr $nDia + 1)

    # read sValorFecha

    if [[ $nMes = @(01|03|05|07|08|1|3|5|7|8|10|12) ]]
    then
        if [ $nDia -eq 31 -a $nMes -ne 12 ]
        then
            nDiaNuevo=1 
            nMes=$(expr $nMes + 1)
        elif [ $nDia -eq 31 -a $nMes -eq 12 ]
        then
            nDiaNuevo=1
            nMes=1
            nAnio=$(expr $nAnio + 1)
        fi 
    elif [[ $nMes =  @(02|2) ]]
    then
        if [ "$((nAnio % 4))" -eq 0 -a "$((nAnio % 100))" -ne 0 ]
        then
            if [ $nDia -eq 29 ]
            then
                nDiaNuevo=1
                nMes=$(expr $nMes + 1)
            fi 
        elif [ "$((nAnio % 400))" -eq 0 ]
        then
            if [ $nDia -eq 29 ]
            then
                nDiaNuevo=1
                nMes=$(expr $nMes + 1)
            fi 
        elif [ $nDia -eq 28 ]
        then
            nDiaNuevo=1
            nMes=$(expr $nMes + 1)
        fi
    elif [[ $nMes = @(04|4|06|6|09|9|11) ]]
    then
        if [ $nDia -eq 30 ]
        then
            nDiaNuevo=1 
            nMes=$(expr $nMes + 1)
        fi 
    fi
    echo "La nueva fecha es: "$nDiaNuevo"/"$nMes"/"$nAnio
    echo "Desea continuar Si/No: "
    read sContinuar
    if [[ ${sContinuar^^} = "SI" ]]
    then
        nContinuar=1
    else
        nContinuar=0
    fi

done