###############################################
# BLOQUE 1 — Configuración general de Terraform
###############################################
terraform {
  # Versión mínima de Terraform permitida
  required_version = ">= 1.0"

  # Declaración del provider AWS
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # Versión exigida por el enunciado
    }
  }
}

###############################################
# BLOQUE 2 — Provider AWS apuntando a LocalStack
###############################################
provider "aws" {
  region = "us-east-1"   # Región ficticia para LocalStack

  access_key = "test"    # Credenciales falsas
  secret_key = "test"

  s3_use_path_style = true

  # Desactivar validaciones que fallan en LocalStack
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Endpoint de LocalStack
  endpoints {
    s3 = "http://localhost:4566"
  }
}

###############################################
# BLOQUE 3 — LLAMADA AL MÓDULO
###############################################
module "mi_recurso" {
  # Ruta al módulo creado en modules/mi-recurso/
  source = "./modules/mi-recurso"

  # Variable que el módulo espera (definida en variables.tf)
  nombre_bucket = "bucket-tarea4-localstack"
}



