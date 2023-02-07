resource "aws_s3_bucket" "dev_bucket" {
  bucket = var.bucket

  tags = {
    Name    = var.bucket-name
  }
  lifecycle {
    prevent_destroy = true
  }
}
resource "aws_s3_bucket_versioning" "enable" {
  bucket = aws_s3_bucket.dev_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}