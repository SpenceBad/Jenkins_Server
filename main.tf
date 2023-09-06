# Create an EC2 Instance
resource "aws_instance" "ubuntu" {
  instance_type          = var.instance_type
  ami                    = var.instance_ami
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  tags = {
    Name = var.instance_name
  }

  user_data = file("script.sh")
}

# Create a Security group for Jenkins
resource "aws_security_group" "jenkins_sg" {
  name        = var.security_group_name
  description = "inbound rules for security group"
  vpc_id      = var.vpc_id


  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "incoming 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    description = "outbound rules"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "jenkins-bucket" {
  bucket = "jenkins-bucket-${random_id.randomness.hex}"

  tags = {
    Name = "jenkins-bucket"
  }
}

# Generate a random ID
resource "random_id" "randomness" {
  byte_length = 10
}