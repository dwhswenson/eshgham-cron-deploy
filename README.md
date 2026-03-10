# eshgham-cron-deploy

This is my personal deployment of the ESHGHAM-based LambdaCron function.

You can see my configuration (and therefore the workflows I try to keep in operation) in `config.yaml`. The `main.tf` contains the basic Terraform configuration for the [eshgham-cron](https://github.com/omsf-eco-infra/eshgham-cron) function.


## Setting up deployment with GitHub Actions

We deploy and update the AWS infrastructure using GitHub Actions, authenticated with OIDC. The `setup-deploy` directory contains TF configuration for the role, with the necessary permissions and trust policy for our workflow to assume the role and deploy the infrastructure. That also stores any needed secrets (like GitHub PAT) in a GitHub Actions secret, so it can be used in the workflow.


