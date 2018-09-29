provider "aws" {
  access_key = "xxx"
  secret_key = "xxx"
  region     = "eu-central-1"
}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  key_name          = "xxx"
  vpc_security_group_ids = ["sg-2318fd4c","sg-0bb981fc3f0bfba4c"]
  availability_zone = "eu-central-1b"
  ami               = "ami-0f5dbc86dd9cbf7a8"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y install haproxy.x86_64
              sudo yum -y install docker.x86_64
              sudo yum -y install git
              sudo amazon-linux-extras install -y ansible2
              sudo mkdir /home/testme
              sudo git clone https://github.com/oniger/mytestproj /home/testme/
              sudo service docker start
              sudo docker pull alpine
              sudo wget -P /home/testme --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
              sudo chmod u+x /home/testme/chgip
              sudo docker build -t figlet12 /home/testme/.
              sudo docker build -t figlet13 /home/testme/.
              sudo ansible-playbook /home/testme/playbook.yml 
              EOF
}
resource "aws_security_group" "web" {

    name = "web"

    description = "Allow HTTP and SSH connections."

    ingress {

        from_port = 22

        to_port = 22

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {

        from_port = 80

        to_port = 80

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress {

        from_port = 8080

        to_port = 8080

        protocol = "tcp"

        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {

        from_port = 0

        to_port = 0

        protocol = "-1"

        cidr_blocks = ["0.0.0.0/0"]

    }
}
