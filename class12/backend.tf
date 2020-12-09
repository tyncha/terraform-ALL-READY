terraform {
backend "s3" {
bucket = "backend-state-farrukh"
key = "class/us-east-1/virginia/dev/infrastructure.tfstate"
region = "us-east-1"
  }
}
