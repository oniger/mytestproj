provider "aws" {

    access_key = "xxxxx"

    secret_key = "xxxxx"

    region = "eu-central-1"

}

resource "aws_instance" "app" {
  instance_type     = "t2.micro"
  key_name          = "xxxxx"
  vpc_security_group_ids = ["sg-0bb981fc3f0bfba4c"]
  availability_zone = "eu-central-1b"
  ami               = "ami-0f5dbc86dd9cbf7a8"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y install haproxy.x86_64 ansible.x86_64 docker.x86_64
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
}
