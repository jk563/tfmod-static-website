resource "aws_acm_certificate" "main" {
  provider = aws.us_east_1

  domain_name               = "www.${var.domain}"
  subject_alternative_names = [var.domain]
  validation_method         = "DNS"
}

resource "aws_route53_record" "cert_validation_main" {
  name    = aws_acm_certificate.main.domain_validation_options.0.resource_record_name
  type    = aws_acm_certificate.main.domain_validation_options.0.resource_record_type
  zone_id = var.route53_zone_id
  records = [aws_acm_certificate.main.domain_validation_options.0.resource_record_value]
  ttl     = 60
}

resource "aws_route53_record" "cert_validation_redirect" {
  name    = aws_acm_certificate.main.domain_validation_options.1.resource_record_name
  type    = aws_acm_certificate.main.domain_validation_options.1.resource_record_type
  zone_id = var.route53_zone_id
  records = [aws_acm_certificate.main.domain_validation_options.1.resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "main" {
  provider = aws.us_east_1

  certificate_arn = aws_acm_certificate.main.arn
  validation_record_fqdns = [
    aws_route53_record.cert_validation_main.fqdn,
    aws_route53_record.cert_validation_redirect.fqdn,
  ]
}
