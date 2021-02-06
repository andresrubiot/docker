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

# Politica de reinicio de contenedores
________________________________________________________________________________________________________
|        flag        |                                   description                                    |
________________________________________________________________________________________________________|
|         no         | (Por defecto) - Nunca se va a reiniciar automaticamente                          |
|_______________________________________________________________________________________________________|
|       always       | Siempre se reinicia el contenedor automaticamente                                |
|_______________________________________________________________________________________________________|
|   unless-stopped   | Reinicia el contenedor hasta que nosotros mismos lo detengamos explicitamente    |
|_______________________________________________________________________________________________________|
|     on-failure     | El contenedor se reinicia automaticamente cuando obtiene un error interno        |
|_______________________________________________________________________________________________________|
  
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

## Tipos de redes

### Red bridge

Esta es la red por defecto de docker y a la cual se conectaran los contenedores si no le asignamos una manualmente

### Red host

Esta es la red que utiliza nuestra maquina y al asignarse a un contenedor tomara las mismas caracteristicas de nuestra maquina real.

_--network host_

### Red none

Al asignar esta red a un contenedor, dicho contenedor quedara sin red asignada

_--network none_

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

## Asignar una red a un contenedor

Al crear un contenedor podemos indicarle que red utilizar

*La red debe estar creada con anterioridad*

```
docker run -d --name nombre_contenedor --network _nombre-red_ nombre_imagen:tag_imagen
```

## Conectar contenedor a una red

Cuando tenemos un contenedor en una red diferente a la que estamos usando, podemos conectaro usando el siguiente comando.

El contenedor mantiene su red original, pero docker adjunta la red que se acaba de conectar, lo que hace que el conetenedor tenga acceso y conexión a los contenedores de las redes original y adjuntas

```
docker network connect _nombre-red_ _nombre-contenedor_
```

## Desconectar contenedor de una red

```
docker network disconnect _nombre-red_ _nombre-contenedor_
```

## Eliminar una red

Antes de eliminar una red, esta no debe estar asociada a ningún contenedor

```
docker network rm _nombre-red_
```

## Asignar IP a un contenedor

Para asignar una ip a un contenedor, primero debe estar creada la red, con su respectiva subnet y gateway.
La ip que queremos asignar no debe estar ocupada por otro contenedor

```
docker run -d --name nombre_contenedor --network _nombre-red_ --ip _ip_ nombre_imagen:tag_imagen
```

# Docker compose

Docker compose nos permite crear aplicaciones multicontenedor, esto quiere decir, aplicaciones que necesita mas de un contenedor, y nos permite crear todos los contenedores necesarios, sus respectivos volumenes y configuraciones y las redes necesarias.

ejemplo:

Una aplicación en php la cual necesite una base de datos debe tener:

Un contenedor como servidor web con php instalado
Un contenedor como base de datos para la información

Se crearián estos dos contenedores y los conectariamos por una red que de igual manera creariamos.

## Estructura docker compose

Para crear un archivo docker compose, debemos tener en cuenta que la extensión debe ser *.yml* y sus secciones son:

*Obligatorias*

* version
* services

*Opcionales*

* volumes
* networks

## Crear un contenedor con docker compose

Desde la terminal, ubicados en donde se encuentra el archivo docker-compose.yml, ejecutamos el comando

```
docker-compose up -d
```

## Eliminar un contenedor con docker compose

Desde la terminal, ubicados en donde se encuentra el archivo docker-compose.yml, ejecutamos el comando

```
docker-compose down
```

## Variables de entorno

Para definir variables de entorno tenemos dos opciones:

1. Crearlas directamente en el docker-compose.yml:

```
enviroment:
  - KEY=VAL
```

2. Crear un archivo .env (common.env) e indicar su ruta en el archivo de docker-compose.yml y en este archivo, en cada linea colocar el KEY=VAL

```
env_file: common.env
```