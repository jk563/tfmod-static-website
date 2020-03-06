variable "subdomain" {
  description = "The subdomain of the bucket"
  type        = string
  default     = "www"
}

variable "domain" {
  description = "The root domain of the bucket"
  type        = string
}

variable "entrypoint" {
  description = "The homepage of the website"
  type        = string
  default     = "index.html"
}

variable "route53_zone_id" {
  description = "The Route53 Zone ID to set a record in"
  type        = string
}
