# mytestproj
Requirements
Dockerfile -- Alpine-based linux

glibc-2.21-r2.apk -- library needed for Oracle Java

helloworld.war -- spring boot hello world 

jdk-8u181-linux-x64.tar.gz - Oracle JDK 8

Under /root/myansi directory, run the terraform commands. Ensure the main.tf file is present.

This initializes terraform 

#terraform init

This checks the terraform syntax for errors 

#terraform plan

This executes the template and spins up the host based on the template main.tf

#terraform apply

