FROM fedora:30

COPY jdk-8u211-linux-x64.tar.gz /tmp

RUN mkdir -p /usr/local/java

RUN tar xvzf /tmp/jdk-8u211-linux-x64.tar.gz  -C /usr/local/java/

COPY profile /tmp

RUN cat /tmp/profile >> /etc/profile

RUN update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_211/bin/java" 1 & \
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_211/bin/javac" 1 & \
    update-alternatives --install "/usr/bin/javaws.itweb" "javaws.itweb" "/usr/local/java/jdk1.8.0_211/bin/javaws.itweb" 1

RUN sudo update-alternatives --set java /usr/local/java/jdk1.8.0_211/bin/java & \
    sudo update-alternatives --set javac /usr/local/java/jdk1.8.0_211/bin/javac & \
    sudo update-alternatives --set javaws.itweb /usr/local/java/jdk1.8.0_211/bin/javaws.itweb

RUN source /etc/profile

#USER 10001

