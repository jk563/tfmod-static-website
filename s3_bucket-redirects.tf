resource "aws_s3_bucket" "redirects" {
	for_each = toset(var.redirects)

  bucket = "${each.key}${each.key == "" ? "" : "."}${var.domain}"
  acl    = "public-read"

	website {
		redirect_all_requests_to = "https://${aws_s3_bucket.main.id}"
	}
}

