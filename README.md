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

Login to the EC2 host.

#ssh -i "xxxx.pem" ec2-user@xxx.eu-central-1.compute.amazonaws.com

To check for running docker containers

#sudo docker ps

To check if the site is up run 

#curl -s localhost

The haproxy service will proxy connection to the two containers that run the hello world app in port 8080 in load balancing fashion.

To check the running processes for docker and haproxy, run

#ps -ef


