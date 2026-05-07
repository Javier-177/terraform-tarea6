###############################################
# BLOQUE 1 — Configuración general de Terraform
###############################################
terraform {
  # Versión mínima de Terraform que se permite usar.
  # El enunciado exige: Terraform >= 1.0
  required_version = ">= 1.0"

  # Declaración de los proveedores que usará este proyecto.
  required_providers {
    aws = {
      # Origen del provider AWS (repositorio oficial de HashiCorp).
      source = "hashicorp/aws"

      # Versión del provider AWS.
      # El enunciado exige: versión ~> 5.0 (cualquier 5.x, pero no 4.x ni 6.x).
      version = "~> 5.0"
    }
  }
}

###############################################
# BLOQUE 2 — Provider AWS apuntando a LocalStack
###############################################
provider "aws" {
  # Región “falsa” que usaremos con LocalStack (no es AWS real).
  region = "us-east-1"

  # Credenciales de prueba. LocalStack no valida credenciales reales.
  access_key = "test"
  secret_key = "test"

  # Hace que S3 use el estilo de ruta (path-style) necesario en LocalStack.
  s3_use_path_style = true

  # Desactiva comprobaciones que fallarían en un entorno local (no AWS real).
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Redefinimos el endpoint de S3 para que apunte a LocalStack en localhost.
  endpoints {
    # Puerto 4566: endpoint unificado de LocalStack para los servicios AWS.
    s3 = "http://localhost:4566"
  }
}

###############################################
# BLOQUE 3 — Recurso: bucket S3 en LocalStack
###############################################
resource "aws_s3_bucket" "demo" {
  # Nombre del bucket que se creará en LocalStack (no en AWS real).
  bucket = "mi-bucket-localstack"
}
# Versión 1.0: infraestructura base
# Comentario para simular cambios
