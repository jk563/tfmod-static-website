resource "aws_cloudfront_distribution" "s3_distribution" {
  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["HEAD", "GET"]
    forwarded_values {
      cookies {
        forward = "none"
      }
      query_string = true
    }
    target_origin_id       = "main_bucket"
    viewer_protocol_policy = "redirect-to-https"
  }

  enabled = true

  origin {
    domain_name = aws_s3_bucket.main.bucket_domain_name
    origin_id   = "main_bucket"
  }
  default_root_object = "index.html"

  aliases = [
    "${var.subdomain}.${var.domain}",
    var.domain
  ]
  price_class = "PriceClass_100"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate_validation.main.certificate_arn
    ssl_support_method  = "sni-only"
  }
}
