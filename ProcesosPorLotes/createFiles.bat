@echo off
::Menu con dos opciones utilizando el if
::Adrian San Roman
::20-11-24
:createFiles
echo Pulsa 1 para crear un archivo .txt
echo Pulsa 2 para crear un archivo .bat

set /p opciones=

if %opciones% EQU 1 goto txt
if %opciones% EQU 2 goto bat
if %opciones% GTR 1 goto error
if %opciones% GTR 2 goto error
pause
exit

:txt
set /p txt="Dame un nombre para el archivo txt: "
echo > %txt%.txt
pause
exit

:bat
set /p bat="Dame un nombre para el archivo bat: "
echo > %bat%.bat
pause
exit

:error
echo Introduce el valor 1 o 2
pause
goto createFiles
exit
