# Guide to Demonstrate `count` using Terraform and AWS EC2
This example walks through deploying a single HashiCorp Vault instance, AWS EKS cluster, and AWS RDS PostgreSQL database.  The goal is to demonstration static and dynamic database credentials using Vault for databases running in EKS as well as EKSRDS

## Requirements
This demonstration uses the following software tools:
 - HashiCorp Terraform
 - AWS VPC and EC2 Instances
 - Packages: awscli

## Deploy default AWS VPC
```sh
apt update -y && apt install awscli -y
export AWS_DEFAULT_REGION=us-west-2
aws ec2 create-default-vpc
```

## Clone repo
Clone repository and provision.
```sh
git clone https://github.com/nickyoung-hashicorp/count-aws-instance.git
cd count-aws-instance
```

## Initialize Terraform, then apply while defining the `scale` variable with a value of `1`
```sh
terraform init && terraform apply -auto-approve -var scale=1
```
View the outputs and see the list containing 1 public IP and 1 tag

## Scale up the number of instances to `4`
```sh
terraform apply -auto-approve -var scale=4
```
View the output and see the list containing 4 public IPs and 4 tags

OPTIONAL: You can open the AWS web console, navigate to `EC2`, and show the provisioned EC2 instances and their names with iterative counts.

## Clean up
```sh
terraform destroy -auto-approve
```

## Supporting docs
https://www.vaultproject.io/docs/agent/template#static-roles, specifically as it pertains to Static Roles, `If a secret has a rotation_period, such as a database static role, Vault Agent template will fetch the new secret as it changes in Vault. It does this by inspecting the secret's time-to-live (TTL).`
```