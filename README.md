#### Requirements
1. Ansible >= 2.9
2. terraform >= 0.12.25

Things to do before running infra provisioning
* Generate ssh key as `mykey` and place both private and public key in terraform dir
* Get AWS Access & secret key and update in the file called `terraform.tfvars` placed inside terraform folder

```
AWS_ACCESS_KEY = "AKIA5VKP3Z4HZ46MUHHX"
AWS_SECRET_KEY = "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"

```
* Create the s3 bucket in aws console in mentioned region & name inside `backends.tf`


#### provision aws resource
```
$ terraform init
$ terraform plan
$ terraform apply
```
in the output you will get public ip of both provisioned server,update those in hosts inventory file for ansible to use

#### Deploy Code
```
$ ansible-playbook -i hosts deploy-stack.yml  --user=ubuntu --private-key=terraform/mykey
```
####Endpoints
* /Cached
* /internal
* /external