# IPv4 CIDR:
# 172.31.0.0/16

# Define the AWS provider and region
provider "aws" {
  region = var.region  
}

# Retrieve the default VPC for the region
data "aws_vpc" "main" {
  default = true
}
# Launch an EC2 instance in the default VPC
resource "aws_instance" "Julijas_sftp_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # Include the user data scripts directly
  user_data = <<-EOF
    #!/bin/bash
    $(cat sftp_setup.sh)
    $(cat s3_backup.sh)
    EOF

  tags = {
  Name = "SFTP_server"
  }
}
