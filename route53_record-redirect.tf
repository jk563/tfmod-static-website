resource "aws_route53_record" "redirect" {
  zone_id = var.route53_zone_id
  name    = var.domain
  type    = "A"

	alias {
		name = aws_s3_bucket.redirect.website_domain
		zone_id = aws_s3_bucket.redirect.hosted_zone_id
		evaluate_target_health = true
	}
}
