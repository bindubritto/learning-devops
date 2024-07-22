# Terraform Project | Automate AWS Infrastructure


## Overview

We will provision an EC2 instance, and deploy a nginx docker container to that vm.

But before doing that, we need to create the whole infra using terraform.


### Provision AWS Infra

1. Create custom VPC
2. Create custom Subnet
3. Create Route Table & Internet Gateway
3.1. Association subnet with route table
4. Provision EC2 Instance
5. Deploy nginx Docker Container
6. Create Security Group (Firewall)
7. SSH & Http for that EC2. (port - 8080, 22)


Best Practice
1. Create Infra from scratch.
2. Leave the defaults created by AWS as it is.


Default Subnets
- 3 default subnets in VPC
- 1 default subnet per AZ
- 3 AZ in my region


Network ACL (NACL) -> Subnet Level
Security Group -> Server Level


## Note

Running script after provisioning server is not actually TF type of work. It's like configuration management. Installing docker, yum update, adding user-group and etc. So, It's very good to practice Terraform + Ansible to do such kind of task. TF will handle to provisioning the infra and Ansible will manage the rest.