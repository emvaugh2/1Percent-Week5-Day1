# Creates the S3 bucket

resource "aws_s3_bucket" "s3" {
    bucket = var.bucket_name
}