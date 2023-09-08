terraform {
  cloud {
    organization = "example-org-820a64"

    workspaces {
      name = "tc-test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.11"
    }
  }
}
