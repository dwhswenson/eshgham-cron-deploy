terraform {
  backend "s3" {
    key = "eshgham-cron/terraform.tfstate"
  }
}

variable "gh_token" {
  description = "GitHub PAT"
  type        = string
  sensitive   = true
}

module "eshgham_cron" {
  source = "git::https://github.com/omsf-eco-infra/eshgham-cron.git?ref=refactor-result-types"
  #source = "/Users/dwhs/Dropbox/omsf/eco-infra/src/eshgham-cron"
  aws_region = "us-east-2"
  schedule_expression = "cron(0 12 * * ? *)"
  #schedule_expression = "cron(0 * * * ? *)"  # hourly for testing
  eshgham_config_file = "./config.yaml"
  github_token = var.gh_token
  email_sender = "dwhs@hyperblazer.net"
  email_recipients = [
    "dwhs@hyperblazer.net"
  ]
  #create_test_url = true
  create_test_url = false
  lambda_public_tag = "0.4.0"
}

output "scheduled_lambda_test_url" {
  value = module.eshgham_cron.scheduled_lambda_test_url
}
