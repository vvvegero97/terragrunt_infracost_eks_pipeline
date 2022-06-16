# Terragrunt - CI/CD Provisioning an EKS Cluster
Terragrunt and Infracost pipeline with TF modules
Pull request to main branch tg folder ==> Terragrunt checks ans Infracost info
Push/merge to main branch tg folder ==> Terragrunt apply
# Resources created:
1. VPC with 3 public and private subnets
2. SGs for worker node groups
3. EKS cluster with 2 users and root having master access, 2 worker groups (one t3.medium ec2)
4. ECR for Docker images