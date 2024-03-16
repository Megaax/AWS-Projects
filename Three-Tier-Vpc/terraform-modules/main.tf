provider "aws" {
  region  = var.region
  profile = "terraform-user"
}

module "vpc" {
  source                       = "./modules/vpc"
  region                       = var.region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

# module "jenkins_ec2" {
#   source                    = "./modules/jenkins"
#   ami_id                    = var.ami_id
#   instance_type             = "t2.medium"
#   tag_name                  = "Jenkins:Ubuntu-EC2"
#   subnet_id                 = module.vpc.public_subnet_az1_id
#   sg_for_jenkins            = [module.security_groups.ec2_jenkins_security_group_id]
#   enable_public_ip_address  = true
#   user_data_install_jenkins = templatefile("./modules/jenkins-runner-script/jenkins-installer.sh", {})

# }


# module "application_loadbalancer" {
#   source                   = "./modules/alb"
#   project_name             = var.project_name
#   alb_security_group_id    = module.security_groups.alb_security_group_id
#   public_subnet_az1_id     = module.vpc.public_subnet_az1_id
#   public_subnet_az2_id     = module.vpc.public_subnet_az2_id
#   vpc_id                   = module.vpc.vpc_id
#   lb_target_group_name     = "alb-target-group"
#   lb_target_group_port     = 8080
#   lb_target_group_protocol = "HTTP"
# }
