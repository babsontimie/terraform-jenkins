variable "domain_name" {}
variable "aws_lb_dns_name" {}
variable "aws_lb_zone_id" {}

/*
#resource "aws_route53_zone" "dev_proj_1_lablan_technologies_com" {
#  name = "dev_proj_1_lablan.technologies.com"
#}


data "aws_route53_zone" "dev_proj_1_lablan_technologies_com" {
  name         = "lablan-technologies.com"
  private_zone = false
}

resource "aws_route53_record" "lb_record" {
  zone_id = data.aws_route53_zone.dev_proj_1_lablan_technologies_com.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name
    zone_id                = var.aws_lb_zone_id
    evaluate_target_health = true
  }
}

output "hosted_zone_id" {
  value = data.aws_route53_zone.dev_proj_1_lablan_technologies_com.zone_id
}

*/

provider "aws" {
  region = "us-east-1"  # or your preferred region
}

# Create the public hosted zone (if it doesn't already exist)
resource "aws_route53_zone" "dev_proj_1_lablan_technologies_com" {
  name = "lablan-technologies.com"
}

# Create the Route 53 record to point to the Load Balancer
resource "aws_route53_record" "lb_record" {
  zone_id = aws_route53_zone.dev_proj_1_lablan_technologies_com.zone_id
  name    = var.domain_name  # e.g., app.lablan-technologies.com
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name
    zone_id                = var.aws_lb_zone_id
    evaluate_target_health = true
  }
}

output "hosted_zone_id" {
  value = aws_route53_zone.dev_proj_1_lablan_technologies_com.zone_id
}

