# mytestproj
Requirements
Dockerfile -- Alpine-based linux

glibc-2.21-r2.apk -- library needed for Oracle Java

helloworld.war -- spring boot hello world 

jdk-8u181-linux-x64.tar.gz - Oracle JDK 8

Under /root/myansi directory, run the command

#ansible-playbook -i ./hosts -k playbook.yml

where hosts file contains localhost or the hostname
