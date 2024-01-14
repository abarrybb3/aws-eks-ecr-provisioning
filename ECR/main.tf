terraform {
  cloud {
    organization = "KSU-MEAN-stack-Project"

    workspaces {
      name = "EKS-ECR-Provisioning"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "devops-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}