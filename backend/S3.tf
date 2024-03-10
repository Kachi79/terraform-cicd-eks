resource "aws_s3_bucket" "terra-jen-eks" {
  bucket        = "terra-jen-eks"
  force_destroy = true

  tags = {
    Name        = "terra-jen-eks"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terra-jen-eks.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.terra-jen-eks.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "terra-jen-eks-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
} 