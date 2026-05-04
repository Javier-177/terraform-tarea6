terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region            = "us-east-1"
  access_key        = "test"
  secret_key        = "test"
  s3_use_path_style = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

module "mi_recurso" {
  source = "./modules/mi-recurso"

  nombre_bucket = "mi-bucket-localstack"
}


