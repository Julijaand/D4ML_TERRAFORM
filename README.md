# D4ML_TERRAFORM

Install terraform from official source:
https://developer.hashicorp.com/terraform/downloads
$ sudo-apt get update
check Terraform version: 
$ terraform -v

install iptabels:
$ sudo apt-get install iptables

create directory for you project:
$ mkdir D4ML_TERRAFORM
create necesary files: main.tf, S3_backup.sh, sftp_setup.sh

run:
terraform init
terraform plan
terraform apply
terraform destroy
