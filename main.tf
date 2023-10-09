# IPv4 CIDR:
# 172.31.0.0/16

# Define the AWS provider and region
provider "aws" {
  region = "eu-central-1"  # Frankfurt region
}

# Retrieve the default VPC for the region
data "aws_vpc" "main" {
  default = true
}
# Launch an EC2 instance in the default VPC
resource "aws_instance" "Julijas_sftp_server" {
  ami           = "ami-08a34e890d3f70022"
  instance_type = "t2.micro" 
  key_name      = "julias_key_pair"

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
