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
  
  
* Crear una imagen a partir de un Dockerfile
  
En la raiz de la carpeta donde se ejecuta el comando, debe estar el archivo llamado DockerFile
  
```
docker build -t nombre_imagen:tag_imagen .
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
  
  
Para crear un contenedor, primero debe estar creada la imagen
  
*Se agrega el atributo -d para que se ejecute de fondo*
  
  
```
docker run -d --name nombre_contenedor nombre_imagen:tag_imagen
```
  
###  Crear un contenedor y mapear puertos
  
  
Mapear un puerto, permite que se conecte, el puerto de nuestra maquina local, con el puerto del contenedor
  
*-p mapea el puerto de nuestra maquina con el puerto del contenedor*
  
```
docker run -d --name nombre_contenedor -p puerto_local:puerto_contenedor nombre_imagen:tag_imagen
```
  
##  Eliminar un contenedor
  
  
```
docker rm -fv nombre_contenedor
```
  