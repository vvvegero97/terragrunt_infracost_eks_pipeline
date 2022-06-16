Status of Last Deployment:<br>
<img src="https://github.com/vvvegero97/
terragrunt_infracost_eks_pipeline/workflows/Terragrunt CI/CD Pipeline/badge.svg?branch=main"><br>
# Terragrunt - CI/CD Provisioning an EKS Cluster
- Terragrunt and Infracost pipeline with TF modules
- Pull request to main branch eks_tutorial folder ==> Terragrunt checks ans Infracost info
- Push/merge to main branch eks_tutorial folder ==> Terragrunt apply
- States are saved remotely on S3 and locked by DynamoDB
# Resources created:
1. VPC with 3 public and private subnets
2. SGs for worker node groups
3. EKS cluster with 2 users and root having master access, 2 worker groups (one t3.medium ec2)
4. ECR for Docker images
