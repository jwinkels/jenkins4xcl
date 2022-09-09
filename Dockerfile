FROM jenkins/jenkins:alpine-jdk11
USER root
RUN apk update
RUN apk add wget
RUN mkdir -p /opt/sqlcl/
RUN wget -P /opt/sqlcl/ https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-21.4.0.348.1716.zip
RUN unzip /opt/sqlcl/sqlcl-21.4.0.348.1716.zip -d /opt/
RUN ln -s /opt/sqlcl/bin/sql /usr/bin/sql
RUN apk add nodejs
RUN apk add npm
RUN apk add libaio
RUN apk add libc6-compat
RUN apk add findutils
RUN npm add -g xcl

RUN  ln -s /root/AppData/Roaming/xcl/instantclient_21_6/libclntsh.so.21.1 /usr/lib/libclntsh.so && \
     ln -s /root/AppData/Roaming/xcl/instantclient_21_6/libocci.so.21.1 /usr/lib/libocci.so && \
     ln -s /root/AppData/Roaming/xcl/instantclient_21_6/libociicus.so /usr/lib/libociicus.so && \
     ln -s /root/AppData/Roaming/xcl/instantclient_21_6/libnnz21.so /usr/lib/libnnz21.so && \
     ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 && \
     ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 && \
     ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2

ENV LD_LIBRARY_PATH /root/AppData/Roaming/xcl/instantclient_21_6