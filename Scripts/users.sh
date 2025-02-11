#!/bin/bash

#Usuarios del sistema
#Autor: Adrian San Roman
#Fecha: 10/02/2025

clear

if [ $# -gt 1 ];then

	echo "Has introducido mas de un parametro"
	exit
fi

if [ $# -eq 0 ];then

	param=1000
else

	param=$1
fi

uid=$(cat /etc/passwd | cut -d ":" -f 3)

echo "======================================"
hora=$(date +%H:%m)
fecha=$(date +%d-%m-%Y)
echo "Informe de usuarios el dia $fecha a las $hora"

IFS=:

while read user x uid gid d h shell;do

	if [ $uid -ge $param ];then

		echo "$user - $uid"

	fi

done < /etc/passwd

echo "======================================"
