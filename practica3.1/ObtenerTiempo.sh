#chmod u=rwx,g=r,o=r numeroPrimo.sh
clear
nContinuar=1
echo "Bienvenido al detector de dias"
while [ $nContinuar -eq 1 ]
do
    echo "Favor de ingresar el anio: "
    read nAnio
    echo "Favor de ingresar el mes: "
    read nMes

    # if [ nMes in 1|3|5|7|8|10|12] 
    if [[ $nMes = @(01|03|05|07|08|1|3|5|7|8|10|12) ]]
    then
        echo "Este mes tiene 31 dias"
    elif [[ $nMes =  @(02|2) ]]
    then
        if [ "$((nAnio % 4))" -eq 0 -a "$((nAnio % 100))" -ne 0 ]
        then
            echo "Este mes tiene 29 dias"
        elif [ "$((nAnio % 400))" -eq 0 ]
        then
            echo "Este mes tiene 29 dias"
        else
        echo "Este mes tiene 28 dias" 
        fi
    elif [[ $nMes = @(04|4|06|6|09|9|11) ]]
    then
        echo "Este mes tiene 30 dias"
    else
        echo "El mes ingresado es invalido"
    fi

    echo "Desea continuar Si/No: "
    read sContinuar
    if [[ ${sContinuar^^} = "SI" ]]
    then
        nContinuar=1
    else
        nContinuar=0
    fi

done