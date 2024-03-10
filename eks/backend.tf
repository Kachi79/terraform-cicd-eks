terraform {
  backend "s3" {
    bucket         = "eks-cluster1"
    key            = "eks/S3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "eks-dynamodb"
    encrypt        = true
  }
}
