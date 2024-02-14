module "cloudfront_distribution" {
  source = "../../cloudfront"

  name                        = var.name
  description                 = var.description
  comment                     = var.comment
  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  cdn_alias                   = var.domain_name
  origin_id                   = var.origin_id
  valid_certificate_arn       = var.certificate
}

module "s3" {
  source = "../s3_bucket"

  bucket_name = var.bucket_name
}

module "s3_website_config" {
  source = "../s3_website_configuration"

  sid                         = var.bucket_policy_sid
  bucket_name                 = module.s3.id
  cloudfront_distribution_arn = module.cloudfront_distribution.arn
  resource                    = ["${module.s3.arn}/*"]
}