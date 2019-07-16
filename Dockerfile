FROM fedora:30

MAINTAINER franciscojavier.jerez@gmail.com

# Installing Oracle JDK 8u211

COPY jdk-8u211-linux-x64.tar.gz /tmp

RUN mkdir -p /usr/local/java

RUN tar xvzf /tmp/jdk-8u211-linux-x64.tar.gz  -C /usr/local/java/ && rm /tmp/jdk-8u211-linux-x64.tar.gz

COPY profile /tmp

RUN cat /tmp/profile >> /etc/profile && cat /tmp/profile >> /etc/bashrc && rm /tmp/profile

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_211/bin/java" 1 & \
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_211/bin/javac" 1 & \
    update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_211/bin/javaws" 1

RUN sudo update-alternatives --set java /usr/local/java/jdk1.8.0_211/bin/java & \
    sudo update-alternatives --set javac /usr/local/java/jdk1.8.0_211/bin/javac & \
    sudo update-alternatives --set javaws /usr/local/java/jdk1.8.0_211/bin/javaws

RUN source /etc/profile && source /etc/bashrc

ENV JAVA_HOME /usr/local/java/jdk1.8.0_211

# Installing Tomcat 9

COPY apache-tomcat-9.0.22.tar.gz /tmp

RUN mkdir -p /opt/tomcat

RUN tar xvzf /tmp/apache-tomcat-9.0.22.tar.gz -C /opt/tomcat/ --strip-components 1

ENV CATALINA_HOME /opt/tomcat

WORKDIR /opt/tomcat/webapps

RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
