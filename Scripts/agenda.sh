#!/bin/bash

#Agenda de contactos
#Autor: Adrian San Roman
#Fecha: 03/02/2025

clear

while true; do

	echo "Menu de opciones"
	echo "a)-Añadir una entrada"
	echo "b)-Buscar por dni"
	echo "c)-Ver la agenda completa"
	echo "d)-Eliminar todas las entradas de la agenda"
	echo "e)-Salir"

	read -p "Introduce una opcion: " opcion
	case $opcion in

		a)

			read -p "Introduce un DNI: " DNI
			if grep "^$DNI:" agenda.txt >/dev/null; then

				echo "Esta persona esta dada de alta"
			else

				read -p "Introduce el nombre: " name
				read -p "Introduce los apellidos: " surname
				read -p "Introduce la localidad: " localidad
				echo "$DNI:$name:$surname:$localidad" >> agenda.txt
			fi

		;;

		b)

			read -p "Introduce un DNI: " dni
			if ! grep "^$dni:" agenda.txt >/dev/null; then

				echo "Esa persona no existe"
			else

				nombre=$(grep "^$dni:" agenda.txt | cut -d ":" -f 2)
				apellido=$(grep "^$dni:" agenda.txt | cut -d ":" -f 3)
				localidad=$(grep "^$dni:" agenda.txt | cut -d ":" -f 4)
				echo "La persona con DNI numero $dni es: $nombre $apellido, y vive en $localidad"

			fi
		;;

		c)

			if [ -s agenda.txt ]; then

				cat agenda.txt

			else

				echo "Agenda vacia"

			fi
		;;

		d)

			> agenda.txt

		;;

		e)

			echo "Saliendo..."
			break

		;;

		*)

			echo "Introduce una opcion valida"

		;;

	esac
done

