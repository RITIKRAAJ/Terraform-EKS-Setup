
## Terraform-EKS-Setup

This project automates the provisioning of a scalable and secure Amazon EKS (Elastic Kubernetes Service) cluster using Terraform.


## ✨ Features

- ✅ Fully Automated EKS Cluster: Provisions a complete EKS cluster with worker nodes.

- 🔒 Security Best Practices: Implements secure IAM, networking and node policies.

- 📈 Scalable Architecture: Easily scale control plane and worker nodes.

- ⚙️ Customizable: Configure cluster size, instance types, and more via variables.

- 🌐 Integrated Networking: Sets up VPC, subnets, and security groups optimized for EKS.

 






## 🛠️ Prerequisites

- 🔑 AWS Account with appropriate IAM permissions.

- 🖥️ AWS CLI installed and configured (aws configure).

- 🏗️ Terraform (v1.12.2. or later) installed.

- ☸️ kubectl installed (for cluster interaction).

- 📊 eksctl (optional, for additional management).
## 🚀 Quick Start

1.📥 Clone the repository:

```bash
 git clone https://github.com/RITIKRAAJ/Terraform-EKS-Setup
 cd terraform-aws-eks
```
2.🔄 Initialize Terraform:

```bash
terraform init  
```
3.⚙️ Configure variables:
   locals.tf
```hcl
 region = "us-east-1"
 cluster_name = "eks-cluster"
```
4.📝 Plan & Apply:

```bash
terraform plan  
terraform apply  
```
## ⚙️ Configuration Options

| Variable        | Description           |       Default        |
|-------------    |-----------------------|----------------------|
| cluster_name    | Name of the EKS cluster| "eks-cluster"                    |
| cluster_version | Kubernetes version     | "1.31"                |
| region          | AWS region             | "us-east-1"                    |
| vpc_cidr        | CIDR block for VPC   |   "10.0.0.0/16"                    |
| node_group_instance_types|EC2 instance types for worker        nodes          |    "t2.medium"                                               
| min_size        |Minimum worker nodes|   2                |
| max_size        |Maximum worker nodes|   3                       | 
| desired_size    |Desired worker nodes|   2                      |


## 🏗️ Architecture Overview
The Terraform code provisions:


- 🖥️ VPC with public & private subnets across multiple AZs.

- 🎛️ EKS Control Plane (managed by AWS).

- ⚙️ Worker Node Groups in private subnets.

- 🔑 IAM Roles with least-privilege permissions.

- 🛡️ Security Groups for secure cluster communication.


## 🔒 Security Considerations
This implementation includes:

- 🔒 Worker nodes in private subnets

- 🛡️ Least-privilege IAM policies

- 🔐 EKS secrets encryption

- 🚦 Security groups with restricted traffic

## 🧹 Clean Up
```hcl
terraform destroy  
```

