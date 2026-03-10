# setup-deploy

Deployment bootstrap for this repository.

This provides all the GitHub and AWS resources to make it so that this repository can be used as to manage the ESHGHAM deployment.

You'll need to provide the values for the following variables:


* `github_repository`: The repository where you'll manage your deployment. This should be an already-existing repostory, in the format `owner/repository`.
* `aws_region`: The AWS region where your deployment will be hosted.
* `state_bucket`: The name of the S3 bucket where Terraform state for the deployment will be stored. This is state for the eshgham deployment itself; it is not the state for this bootstrap.
* `locks_table`: The name of the DynamoDB table where Terraform state locks for the deployment will be stored. This is for the eshgham deployment itself; it is not for this bootstrap.
