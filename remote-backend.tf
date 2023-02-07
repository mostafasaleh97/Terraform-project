module "terraform_state" {
    source = "./s3"
    bucket = "terraform072736103899"
    bucket-name = "state_bucket072736103899"
}
resource "aws_dynamodb_table" "terraform-locks" {
    name         = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
terraform {
  

  backend "s3" {
    bucket = "terraform072736103899"
    key = "terraform.tfstate"
    region = "us-west-1"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
    access_key = "AKIARB33I3XN63PRTOMW"
    secret_key = "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"
  }
}