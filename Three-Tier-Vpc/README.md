# AWS Three-Tier VPC with Terraform

## Overview

This Terraform configuration creates a three-tier architecture in AWS, including a VPC with public and private subnets, security groups, and EC2 instances. The architecture is designed to accommodate public-facing resources, application servers, and private data storage.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- AWS credentials configured on your machine.

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/your-username/terraform-three-tier-vpc.git](https://github.com/Megaax/AWS-Projects/blob/main/Three-Tier-Vpc)

2. **Specify your variables in the variables.tfvars file:**
region                  = "your-aws-region"

vpc_cidr                = "10.0.0.0/16"

public_subnet_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]

private_app_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

private_data_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24"]

3. **Initialize the Terraform Configuration:**

```terraform init```

4.**Apply the Configuration to Create the Infrastructure:**

```terraform apply```

Type yes when prompted to confirm the execution.

## Clean up

**To avoid incurring charges, you can destroy the created resources when they are no longer needed:**

```terraform destroy```

## Architecture Overview

- **Public Subnets:** Host resources that need to be publicly accessible, such as load balancers.
- **Private Application Subnets:** Host application servers.
- **Private Data Subnets:** Host databases or other sensitive resources.













