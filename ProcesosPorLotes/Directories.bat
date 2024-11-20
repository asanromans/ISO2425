@echo off
::Crear directorios con if
::Adrian San Roman
::20-11-24
:opciones
set /p opciones="Introduce un numero del 1 al 5: "

if %opciones% EQU 1 goto Fichero
if %opciones% EQU 2 goto Tusuario
if %opciones% EQU 3 goto Mtxt
if %opciones% EQU 4 goto Cdirectorios
if %opciones% EQU 5 goto Ccontenido
if %opciones% LSS 1 goto error
if %opciones% GTR 5 goto error
pause
exit

:Fichero
set /p nfichero="Introduce un nombre para el fichero: "
echo > %nfichero%.txt
pause
exit

:Tusuario
tree %userprofile%
pause
exit

:Mtxt
dir *.txt
pause
exit

:Cdirectorios
mkdir alfredoff marinapg ramonam
pause
exit

:Ccontenido
xcopy /E %userprofile% C:\Copia
pause
exit

:error
echo 1 al 5
pause
goto opciones
exit
