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
  
  
*se puede agregar -a al final para mostrar todas las imagenes "ocultas"*
  
```
docker images
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
  
  
##  Crear un contenedor

### Listar contenedores

```
docker ps
```

_Tambien podemos ver los contenedores detenidos añadiendo el flag -a_

```
docker ps -a
```

### Crear un contenedor

Para crear un contenedor, primero debe estar creada la imagen
  
*Se agrega el atributo -d para que se ejecute de fondo*

*Si no se agrega el flag --name nombre_contenedor, se asignara un aleatorio*
  
  
```
docker run -d --name nombre_contenedor nombre_imagen:tag_imagen
```
  
###  Crear un contenedor y mapear puertos
  
  
Mapear un puerto, permite que se conecte, el puerto de nuestra maquina local, con el puerto del contenedor
  
*-p mapea el puerto de nuestra maquina con el puerto del contenedor*
  
```
docker run -d --name nombre_contenedor -p puerto_local:puerto_contenedor nombre_imagen:tag_imagen
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

### Borrar todos los contenedores a la vez

_Utilizar solo el flag -q nos permite obtener solo el id de los contenedores_

```
docker ps -q | xargs docker rm -f 
```

# Dockerfile

## SSL

Al configurar nuestro SSL (ssl.conf) en el puerto 443, debemos exponer y mapear ese mismo puerto al crear el contenedor