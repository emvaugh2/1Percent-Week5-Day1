# Grabs the name of the bucket

output "bucket_name" {
    value = aws_s3_bucket.s3.bucket
}