#!/bin/bash

#Calculadora sencilla
#Autor: Adrian San Roman
#Fecha: 03/02/2025

clear

if [ $# -gt 2 ]; then

	echo "Introduce solo dos parametros"
	exit
fi

if [ $# -lt 2 ]; then

	echo "Introduce dos parametros"
	exit
fi

if [ -f $1 ]; then

	echo "Ese fichero ya existe"
	exit
fi

	read -p "Nombre del autor: " autor1
        read -p "Apellido/s del autor: " autor2
        echo "El nombre y apellido/s del autor son: $autor1 $autor2"

cont=1

while [ $cont -le $2 ]; do

	cont=$(($cont+1))

	read -p "Introduce el primer operando: " op1
        read -p "Introduce el segundo operando: " op2

	echo "Menu de opciones"
	echo "S-Suma"
	echo "R-Resta"
	echo "D-Division"
	echo "M-Multiplicacion"

	read -p "Introduce una opcion: " opcion

	case $opcion in

	S)

		echo "$opcion $op1 $op2"
		resS=$(($op1+$op2))
		echo "La suma de $op1 mas $op2 es $resS"
		echo "$opcion $op1 $op2" >> $1

	;;

	R)

		echo "$opcion $op1 $op2"
                resR=$(($op1-$op2))
		echo "La resta de $op1 menos $op2 es $resR"
                echo "$opcion $op1 $op2" >> $1

	;;

	D)

		echo "$opcion $op1 $op2"
                resD=$(($op1/$op2))
		echo "La division de $op1 entre $op2 es $resD"
                echo "$opcion $op1 $op2" >> $1

	;;

	M)

		echo "$opcion $op1 $op2"
                resM=$(($op1*$op2))
		echo "La multplicacion de $op1 por $op2 es $resM"
                echo "$opcion $op1 $op2" >> $1

	;;

	X)

		echo "Saliendo..."
		break

	;;

	*)

		echo "Introduce una opcion valida"

	;;

	esac
done

if [ ! -f $1 ]; then

	exit

else

	pwd
	cat $1
fi
