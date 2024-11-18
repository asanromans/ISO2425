@echo off
::Media de tres numeros
::Adrian San Roman
::18-11-24
set num1=%1
set num2=%2
set num3=%3
set /a mediasuma= %num1% + %num2% + %num3%
set /a mediadivision=%mediasuma%/3
echo La media de %1 %2 %3 es %mediadivision%