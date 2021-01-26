<div align="center">
  <img src="https://www.docker.com/sites/default/files/d8/Docker-R-Logo-08-2018-Monochomatic-RGB_Moby-x1.png" width="150">
</div>
  
  
  
- [Imágenes](#Imágenes )
  - [Mostrar imagenes](#Mostrar-todas-las-imagenes-creadas )
  - [Historial de una imagen](#Ver-el-historial-de-una-imagen )
  - [Eliminar imagenes](#Eliminar-una-imagen )
- [Contenedores](#Contenedores )
  - [Crear un contenedor](#Crear-un-contenedor )
    - [Crear un contenedor y mapear puertos](#Crear-un-contenedor-y-mapear-puertos )
  - [Eliminar contenedores](#Eliminar-un-contenedor )
  
  
  
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

Se puede crear un contenedor apartir de un sistema operativo, para hacer pruebas o acceder a la terminal

```
docker run -dit --name nombre_contenedor nombre_imagen:tag_imagen
```

## Crear variables de entorno al crear contenedor

_El flag -e crear una variable de entorno al crear el contenedor_

```
docker run -d -e "variable=valor" --name _nombre_contenedor nombre_imagen:tag_imagen
```

### Limitar recursos al crear un contenedor

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