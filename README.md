<div align="center">
  <img src="https://www.docker.com/sites/default/files/d8/Docker-R-Logo-08-2018-Monochomatic-RGB_Moby-x1.png" width="150">
</div>
  
  
  
- [Imágenes](#Imágenes)
  - [Crear una imágen a partir de un Dockerfile](#crear-una-imagen-a-partir-de-un-Dockerfile)
  - [Crear una imágen a partir de un Dockerfile con nombre diferente](#crear-una-imagen-a-partir-de-un-Dockerfile-con-nombre-diferente)
  - [Mostrar todas las imagenes](#Mostrar-todas-las-imagenes-creadas)
  - [Historial de una imagen](#Ver-el-historial-de-una-imagen)
  - [Eliminar imagenes](#Eliminar-una-imagen)
- [Contenedores](#Contenedores)
  - [Crear un contenedor](#Crear-un-contenedor)
  - [Crear un contenedor y mapear puertos](#Crear-un-contenedor-y-mapear-puertos)
  - [Crear un contenedor desde un sistema operativo](#Crear-un-contenedor-desde-un-sistema-operativo)
  - [Crear variables de entorno al crear contenedor](#Crear-variables-de-entorno-al-clrear-contenedor)
  - [Limitar recursos al crear un contenedor](#limitar-recursos-al-crear-un-contenedor)
  - [Ver el log de un contenedor](#ver-el-log-de-un-contenedor)
  - [Ver recursos de un contenedor](#ver-recursos-de-un-contenedor)
  - [Ingresar a la terminal de un contenedor](#ingresar-a-la-terminal-de-un-contenedor)
  - [Listar contenedores](#listar-contenedores)
  - [Renombrar un contenedor](#renombrar-un-contenedor)
  - [Detener un contenedor](#detener-un-contenedor)
  - [Iniciar un contenedor detenido](#iniciar-un-contenedor-detenido)
  - [Eliminar un contenedor](#eliminar-un-contenedor)
  - [Eliminar todos los contenedores a la vez](#eliminar-todos-los-contenedores-a-la-vez)
  - [Eliminar contenedores](#Eliminar-un-contenedor)
- [Dockerfile](#dockerfile)
  - [SSL](#ssl)
- [Docker commit](#docker-commit)
  
  
#  Imágenes
  
  
## Crear una imagen a partir de un Dockerfile
  
En la raiz de la carpeta donde se ejecuta el comando, debe estar el archivo llamado DockerFile
  
```
docker build -t nombre_imagen:tag_imagen .
```

## Crear una imagen a partir de un Dockerfile con nombre diferente
  
En la raiz de la carpeta donde se ejecuta el comando, debe estar el archivo con el nombre que se desee

*-f indica que tenemos un archivo dockerfile con nombre personalizado*
  
```
docker build -t nombre_imagen:tag_imagen -f nombre_archivo .
```
  
##  Mostrar todas las imagenes creadas

```
docker images
```
  
*se puede agregar -a al final para mostrar todas las imagenes "ocultas"*

```
docker images -a
```
  
##  Ver el historial de una imagen
  
  
```
docker history nombre_imagen:tag_imagen
```
  
o
  
```
docker history id_imagen
```
  
##  Eliminar una imagen
  
  
```
docker rmi nombre_imagen:tag_imagen
```
  
#  Contenedores

## Crear un contenedor

Para crear un contenedor, primero debe estar creada la imagen
  
*Se agrega el atributo -d para que se ejecute de fondo*

*Si no se agrega el flag --name nombre_contenedor, se asignara un aleatorio*
  
```
docker run -d --name nombre_contenedor nombre_imagen:tag_imagen
```

##  Crear un contenedor y mapear puertos
  
  
Mapear un puerto, permite que se conecte, el puerto de nuestra maquina local, con el puerto del contenedor
  
*-p mapea el puerto de nuestra maquina con el puerto del contenedor*
  
```
docker run -d --name nombre_contenedor -p puerto_local:puerto_contenedor nombre_imagen:tag_imagen
```

## Crear un contenedor desde un sistema operativo

Se puede crear un contenedor apartir de un sistema operativo (esto cuando no se define la capa de persistencia o de ejeceución de fondo en el dockerfile), para hacer pruebas o acceder a la terminal

```
docker run -dit --name nombre_contenedor nombre_imagen:tag_imagen
```

## Crear variables de entorno al crear contenedor

_El flag -e crear una variable de entorno al crear el contenedor_

```
docker run -d -e "variable=valor" --name _nombre_contenedor nombre_imagen:tag_imagen
```

## Limitar recursos al crear un contenedor

Limitar la cantidad de memoria que utilizara un contenedor

```
docker run -d -m "500mb" --name _nombre_contenedor nombre_imagen:tag_imagen
```

## Ver el log de un contenedor

```
docker logs -f _id_contenedor_
```

## Ver recursos de un contenedor

Con este código podemos ver cuantos recursos esta consumiedo el contenedor seleccionado

```
docker stats _nombre_contenedor_
```

## Ingresar a la terminal de un contenedor

_El argumento bash puede variar segun el sistema operativo de la imagen_

```
docker exec -it id_contenedor bash
```

_En windows puede ser necesario usar winpty al inicio del comando_

```
winpty docker exec -it id_contenedor bash
```

## Listar contenedores

```
docker ps
```

_Tambien podemos ver los contenedores detenidos añadiendo el flag -a_

```
docker ps -a
```

## Renombrar un contenedor

Si olvidamos colocar el nombre a un contenedor, con la siguiente línea de código es posible cambiarlo

```
docker rename nombre_anterior nuevo_nombre
```

## Detener un contenedor

Para detener un contenedor podemos utilizar su id unico

```
docker stop id_contenedor
```

O podemos utilizar su nombre

```
docker stop nombre_contenedor
```

## Iniciar un contenedor detenido

```
docker start id_contenedor
```

```
docker start nombre_contenedor
```
  
##  Eliminar un contenedor
    
```
docker rm -fv nombre_contenedor
```

## Eliminar todos los contenedores a la vez

*Esto elimina los contenedores que esten ocultos y los que esten corriendo*

_Utilizar solo el flag -q nos permite obtener solo el id de los contenedores_

```
docker rm -fv $(docker ps -aq)
```

# Dockerfile

## SSL

Al configurar nuestro SSL (ssl.conf) en el puerto 443, debemos exponer y mapear ese mismo puerto al crear el contenedor

# Docker commit

*No es recomendable hacer cambios dentro de un contenedor*

_Esta opción nos permite crear una imagen a partir de un contenedor_

*NOTA:* _El proceso de commit, puede causar que el cmd de la imagen no se genere por lo cual, al correr el contenedor puede ser necesario agregar el cmd al correr el contenedor_

*NOTA* _Crear una imagen desde un contenedor, dara como resultado que todo lo que este en la capa VOLUME no se guarde; esto cuando el contenedor se ha creado anteriormente desde un dockerfile y posee un VOLUME, todo lo demas (fuera de la ruta del VOLUME) se guardara_

```
 docker commit _nombre_contenedor_ _nombre_imagen:tag_imagen_
```

# Volumenes

Este comando nos devuelve la ruta root de docker

```
docker info | grep -i root
```

## Volumen nombrado

Este comando nos crea un volumen con el nombre que le indiquemos dentro de la ruta de volumenes

```
docker volume create _nombre_volumen_
```

## Asignar volumen a un contenedor

Para asignar un volumen a un contenedor, primero debe estar creado el volumen y posteriormente se lo asignamos al contenedor al momento de crearlo

_-v nos indica la asignacion del volumen_
_-v volumen-local:ruta-contenedor_

```
docker run -d --name _nombre_contenedor_ -v nombre-volumen:/var/lib/mysql -p puerto-local:puerto-contenedor nombre-imagen
```

## Eliminar volumen

```
docker volume rm _nombre_volumen_
```

## Dangling volume

Los dangling volume son aquellos volumenes que no estan siendo utilizados o asociados a un contenedor

Este comando, nos permite visualizar los volumenes dangling

```
docker volume ls -f dangling=true
```

## Eliminar dangling volume masivamente

```
docker volume ls -f dangling=true -q | xargs docker volume rm
```

# Redes

Todos los contenedores que se creen y no se les asigne una red, tomaran la red por defecto: bridge

## Interface de red

La interface de red nos da la información de getawey creado y utilizado por docker

```
ip a | grep docker
```

## Listar redes

Este comando nos devuelve la información de todas las redes creadas

*La red por defecto de docker es bridge*

```
docker network ls
```

## Crear una red

```
docker network create _nombre-red_
```

## Driver y Subnet de una red

_-d define el tipo de driver de la red_
_--subnet define la subnet de la red, *Debe cumplir los estandares CIDR* y que no se haya utilizado--_

```
docker network create -d bridge --subnet 172.124.10.0/24 --gateway 172.124.10.1 _nombre-red_
```

## Inspeccionar una red

```
docker network inspect _nombre-de-red_
```