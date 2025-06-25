bucket_name = "tee-terraform-state-bucket"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-us-east-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["us-east-1a", "us-east-1b"]

public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII8vpcSyEjGCEVb7CXNO/zBeCfSlUkFJ6OOBrNNM0dEj teeadmin@master-node.mycompany.com"
ec2_ami_id = "ami-020cba7c55df1f615"
