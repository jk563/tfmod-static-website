resource "aws_s3_bucket" "main" {
  bucket = "www.${var.domain}"
  acl    = "public-read"

  website {
    index_document = var.entrypoint
  }
}

