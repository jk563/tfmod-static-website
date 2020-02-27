resource "aws_s3_bucket" "redirect" {
  bucket = var.domain
  acl    = "public-read"

	website {
		redirect_all_requests_to = "https://${aws_s3_bucket.main.id}"
	}
}

