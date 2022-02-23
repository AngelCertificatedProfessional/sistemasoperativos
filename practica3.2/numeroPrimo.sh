clear
nContinuar=1
echo "Bienvenido al detector de dias"
while [ $nContinuar -eq 1 ]
do
    
    nNumero=$((1 + $RANDOM % 100));
    echo "El valor a utilizar es " $nNumero
    
    nPrim=1
    divisor=2
    while [ $nPrim -eq 1 -a $divisor -ne $nNumero ]
    do
        if [[ "$((nNumero % divisor))" -eq 0 ]]
        then
            nPrim=0
        else
            divisor=$(expr $divisor + 1)
        fi
    done

    if [[ $nPrim = 0 ]]
    then
        echo "No es un numero Primo"
    else
        echo "Es un numero Primo"
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
