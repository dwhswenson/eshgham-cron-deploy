provider "aws" {
  region = var.aws_region
}

module "deploy_bootstrap" {
  source = "/Users/dwhs/Dropbox/omsf/eco-infra/src/eshgham-cron/deploy-bootstrap"

  github_repository = var.github_repository
  gh_token          = var.gh_token
  tags              = var.tags

  # role_name                = "eshgham-cron-github-deployer"
  # role_description         = "Role assumed by GitHub Actions to deploy ESHGHAM-cron modules."
  # max_session_duration     = 3600
  # github_oidc_provider_arn = null  # defaults to current account's provider
  # github_ref               = "refs/heads/main"
  # github_workflow_filename = "deploy.yaml"
  # github_audience          = "sts.amazonaws.com"
  # github_actions_secrets   = {}
  # extra_permission_sets    = []
  # additional_policy_arns   = []
}

module "terraform_backend_access" {
  source = "/Users/dwhs/Dropbox/omsf/eco-infra/src/cloud-cron/modules/github-s3-tfstate-access"

  role_name         = module.deploy_bootstrap.role_name
  state_bucket      = var.state_bucket
  locks_table       = var.locks_table
  aws_region        = var.aws_region
  github_repository = var.github_repository
  tags              = var.tags
}
