variable "name" {
  description = "Name for Route53 CNAME Record. e.g. blog.example.com"
  type = string
}

variable "type" {
  description = "Type of DNS record"
  default = "A"
  type = string
}

variable "zone_id" {
  description = "Passed value from data.aws_route53_zone.my_domain.zone_id"
  type = string
}

variable "alias_name" {
  description = "Alias for A record"
  type = string
}

variable "alias_zone_id" {
  description = "Zone ID for A record"
}

