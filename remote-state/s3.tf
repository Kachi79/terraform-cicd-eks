resource "aws_s3_bucket" "eks-cluster1" {
  bucket        = "eks-cluster1"
  force_destroy = true

  tags = {
    Name        = "eks-cluster-1"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "eks-versioning" {
  bucket = aws_s3_bucket.eks-cluster1.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "eks" {
  bucket = aws_s3_bucket.eks-cluster1.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "eks-dynamodb-table" {
  name         = "eks-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}