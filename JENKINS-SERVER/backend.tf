# terraform {
#   backend "s3" {
#     bucket = "terra-jen-eks"
#     key    = "global/S3/terraform.tfstate"
#     dynamodb_table = "terra-jen-eks-dynamodb"
#     region = "eu-west-2"
#     encrypt = true
#   }
# }

terraform {
  backend "s3" {
    bucket         = "terra-jen-eks"
    key            = "global/S3/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terra-jen-eks-dynamodb"
    encrypt        = true
  }
}