# Intro

Es necesario contar con una imagen de docker base para el Proyecto Vu del POM, la misma debe ser un OS Fedora (versión no específicada), con Oracle JDK 1.8 (puede ser también la útlima 211) y Tomcat (puede ser la útlima versión, 9).

Para esto se utiliza la útima imagen oficial de Fedora en DockerHub "Fedora:30".
## Instalar Oracle JDK
En la pagina oficial de Oracle tenemos (https://www.oracle.com/technetwork/java/javase/downloads/index.html) hoy en día las "Java SE 12.0.1", "Java SE 11.0.3 (LTS)" y "Java SE 8u211 / Java SE 8u212".

Utilizamos la "Java SE 8u211 / Java SE 8u212" ya que es la que "suponemos/entendemos es la recomendada"

>NOTA: Para que este dockerfile funcione es necesario descargar el Oracle JDK 1.8  tar.gz desde la web de Oracle

---


```bash
yum update -y
yum install wget -y
cd /opt/ && wget https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.tar.gz\?AuthParam\=1562965943_b218b687654961e95a23a7cc3bec3b09 -O jdk-8u211-linux-x64.tar.gz

cp -r jdk-8u211-linux-x64.tar.gz /usr/local/java/

```

## Fuentes
https://www.tecmint.com/install-java-in-fedora/
https://unix.stackexchange.com/questions/423631/suppress-all-output-in-yum-except-for-errors
https://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead
https://www.reddit.com/r/Fedora/comments/9t8eyr/nothing_provides_binbasename_in_fedora_29_while/
https://fedoraproject.org/wiki/JDK_on_Fedora#Installing_Oracle_JDK_on_Fedora

---

```bash
# Actualizamos el repositorio e instalamos wget
yum update -y
yum install wget -y

# Descargamos jdk-8u211-linux-x64.rpm
# wget jdk-8u211-linux-x64.rpm
wget https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.rpm\?AuthParam\=1562963175_8f5bf7a8619ed42def99bed8f1b53a61 
mv "jdk-8u211-linux-x64.rpm?AuthParam=1562963175_8f5bf7a8619ed42def99bed8f1b53a61" jdk-8u211-linux-x64.rpm
docker cp jdk-8u211-linux-x64.rpm eloquent_cori:/opt/

# Revise si sirve esto https://stackoverflow.com/questions/10268583/downloading-java-jdk-on-linux-via-wget-is-shown-license-page-instead
# wget -O /opt/jdk-8u211-linux-x64.rpm ttps://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.rpm\?AuthParam\=1562963175_8f5bf7a8619ed42def99bed8f1b53a61 

# Instalamos jdk-8u211-linux-x64.rpm 
dnf install jdk-8u211-linux-x64.rpm

#[root@9ddcc3e3b396 opt]# dnf install jdk-8u211-linux-x64.rpm
#Last metadata expiration check: 0:23:06 ago on Fri 12 Jul 2019 08:41:14 PM UTC.
#Error:
# Problem: conflicting requests
#  - nothing provides /bin/basename needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/cp needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/ls needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/mkdir needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/mv needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/pwd needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#  - nothing provides /bin/sort needed by jdk1.8-2000:1.8.0_211-fcs.x86_64
#(try to add '--skip-broken' to skip uninstallable packages)

```