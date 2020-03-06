resource "aws_s3_bucket" "main" {
  bucket = "${var.subdomain}.${var.domain}"
  acl    = "public-read"

  website {
    index_document = var.entrypoint
  }
}

