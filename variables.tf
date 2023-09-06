variable "instance_name" {
  description = "name of the ec2 instance"
  type        = string
  default     = "jenkins-ec2"
}
variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "instance_ami" {
  description = "ami of ubuntu ec2 instance"
  type        = string
  default     = "ami-0f8e81a3da6e2510a"
}
variable "vpc_id" {
  description = "id of your vpc"
  type        = string
  default     = "vpc-08820a0ba153495ca"
}
variable "security_group_name" {
  description = "security group name"
  type        = string
  default     = "jenkins_sg"
}