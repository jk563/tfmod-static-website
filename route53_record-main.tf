resource "aws_route53_record" "main" {
  zone_id = var.route53_zone_id
  name    = "${var.subdomain}.${var.domain}"
  type    = "A"

	alias {
		name = aws_s3_bucket.main.website_domain
		zone_id = aws_s3_bucket.main.hosted_zone_id
		evaluate_target_health = true
	}
}
