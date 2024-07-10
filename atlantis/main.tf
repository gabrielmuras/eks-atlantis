resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-unique-name-2321"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}