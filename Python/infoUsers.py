import os
import cpuinfo

if os.getuid() == 1000:
    while True:
        print("Menu de opciones")
        print("1:Muestra info del SO y la CPU")
        print("2:Pedir un usuario, para, crearlo si no existe o mostrar informacion de el")
        print("3:Pedir un directorio, si no existe lo crea")
        print("4:Salir")
        op=input("Introduce una opcion: ")
        match op:
            case "1":
                print("Nombre del sistema:",os.uname().sysname,"CPU:",cpuinfo.get_cpu_info()["brand_raw"])
            case "2":
                usuario=input("Introduce un usuario: ")
                fichusuarios=open("/etc/passwd","r")
                usuarios=fichusuarios.readlines()
                enc=0
                for i in usuarios:
                    if i.split(":")[0] == usuario:
                        enc=1
                        found=i
                        break
                if enc == 1:
                    print(found)
                else:
                    print("Usuario no encontrado")
                    os.system("useradd " + usuario)

            case "3":
                directorio=input("Introduce un directorio: ")
                if os.path.isdir(directorio):
                    print("Existe")
                else:
                    os.mkdir(directorio)
            case "4":
                print("Saliendo...")
                break
            case _:
                print("No es una opcion valida")
else:
    print("No eres root")