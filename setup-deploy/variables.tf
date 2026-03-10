variable "aws_region" {
  description = "AWS region where deployer resources are created."
  type        = string
}

variable "github_repository" {
  description = "GitHub repository in owner/repo form used for OIDC claims and Actions secret management."
  type        = string

  validation {
    condition     = can(regex("^[^/]+/[^/]+$", var.github_repository))
    error_message = "github_repository must be in owner/repo format."
  }
}

variable "gh_token" {
  description = "GitHub token for ESHGHAM runs. Stored as TF_VAR_gh_token in GitHub Actions secrets."
  type        = string
  sensitive   = true
}

variable "state_bucket" {
  description = "S3 bucket name for Terraform/OpenTofu state. Stored as TF_STATE_BUCKET in GitHub Actions secrets."
  type        = string
  sensitive   = true
}

variable "locks_table" {
  description = "DynamoDB table name for Terraform/OpenTofu state locks. Stored as TF_STATE_TABLE in GitHub Actions secrets."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Map of tags to apply to all created resources."
  type        = map(string)
  default     = {}
}
