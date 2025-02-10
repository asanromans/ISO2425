#!/bin/bash

#Manipular ficheros con extension .txt
#Autor: Adrián San Roman
#Fecha: 05/02/2025

clear

if [ $# -gt 2 ];then

	echo "Introduce solo 2 parametros"
	exit
fi

if [ $# -lt 2 ];then

	echo "Introduce 2 parametros"
	exit
fi

if [ -f $1 ];then

	echo "Ese fichero ya existe"
	exit
fi

if [ ! -d $2 ];then

	echo "Ese directorio no existe"
	exit
fi

vaclle=$(ls $2 | wc -l)

if [ $vaclle -eq 0 ];then

	echo "Ese directorio esta vacio"
	exit
fi

echo "Adrian San Roman"

cont=0

for txt in $2/*.txt;do

	lineas=$(wc -l $txt | cut -d " " -f 1)
	if [ $lineas -ge 5 ];then

		echo $txt
		echo $txt >> $1

		palabras=$(wc -w $txt | cut -d " " -f 1)
		echo "El fichero original tiene $palabras palabras" >> $txt.txt.q
		cat $txt >> $txt.txt.q
		cont=$((cont+1))
	else

		echo "$txt no tiene 5 lineas o mas"

	fi
done

echo "El numero de ficheros identificados es $cont"
