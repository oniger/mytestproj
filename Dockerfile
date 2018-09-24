FROM alpine
WORKDIR /home
COPY . /home/
RUN apk --update add curl ca-certificates tar
RUN apk add --allow-untrusted /home/glibc-2.21-r2.apk
RUN tar -xzvf /home/jdk-8u181-linux-x64.tar.gz
CMD "/home/jdk1.8.0_181/bin/java" "-jar" "/home/helloworld.war"
EXPOSE 8080
