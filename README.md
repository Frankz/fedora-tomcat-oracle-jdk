# Intro

Es necesario contar con una imagen de docker base para el Proyecto Vu del POM, la misma debe ser un OS Fedora (versión no específicada), con Oracle JDK 1.8 (puede ser también la útlima 211) y Tomcat (puede ser la útlima versión, 9).

Para esto se utiliza la útima imagen oficial de Fedora en DockerHub "Fedora:30".

## Cómo utilizo esto?

Con los .tar.gz de Oracle JDK y Tomcat descargados en el directorio raíz para construir la imagen ejecutamos

```bash
docker build -t fedora-oracle-jdk:2.0 .
```

Luego para poder utilizar la imagen creada ejecutar

```bash
docker run -d -t -p 8080:8080/tcp fedora-oracle-jdk:2.0
# con `docker ps` vemos el nombre o el Id de del container
# con `docker exec ...` entramos al contenedor
docker exec -ti <<nombre_del_contenedor>> bash
```

## Sobre Oracle JDK

En la pagina oficial de Oracle tenemos (https://www.oracle.com/technetwork/java/javase/downloads/index.html) hoy en día las "Java SE 12.0.1", "Java SE 11.0.3 (LTS)" y "Java SE 8u211 / Java SE 8u212".

Utilizamos la "Java SE 8u211 / Java SE 8u212" (jdk-8u211-linux-x64.tar.gz) ya que es la que "suponemos/entendemos es la recomendada"

>NOTA: Para que este dockerfile funcione es necesario descargar el Oracle JDK 1.8  (jdk-8u211-linux-x64.tar.gz) desde la web de Oracle

## Sobre Tomcat

Obtenemos tomcat de la página oficial https://tomcat.apache.org/download-90.cgi, la versión utilizada es "apache-tomcat-9.0.22.tar.gz"

>NOTA: Para que este dockerfile funcione es necesario descargar el Tomcat 9 (apache-tomcat-9.0.22.tar.gz) desde la web de Oracle

## Fuentes

https://fedoraproject.org/wiki/JDK_on_Fedora#Installing_Oracle_JDK_on_Fedora

https://www.oracle.com/technetwork/java/javase/downloads/index.html

https://tomcat.apache.org/download-90.cgi

https://www.tecmint.com/install-java-in-fedora/

https://unix.stackexchange.com/questions/423631/suppress-all-output-in-yum-except-for-errors

https://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead

https://www.reddit.com/r/Fedora/comments/9t8eyr/nothing_provides_binbasename_in_fedora_29_while/

https://www.middlewareinventory.com/blog/docker-tomcat-example-dockerfile-sample/