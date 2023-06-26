terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terraform-org-state"
    dynamodb_table = "terraform-org-lock"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
  }
}

module "backend_root" {
  source      = "./modules/backend"
  bucket_name = "terraform-org-state"
  table_name  = "terraform-org-lock"
}

# Master account
provider "aws" {
  region = "eu-west-1"
}

# For dev, staging and prod
provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.dev.id}:role/Admin"
  }

  alias  = "dev"
  region = "us-east-1"
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.staging.id}:role/Admin"
  }

  alias  = "staging"
  region = "us-east-1"
}

provider "aws" {
  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.production.id}:role/Admin"
  }

  alias  = "production"
  region = "us-east-1"
}
