variable "region" {
    description = "Region to generate the S3 bucket and DynamoDB table into"
}

variable "environment" {
  description = "Deployment environment; typically production, staging, etc."
}

variable "stack_id" {
  description = "Stack identifier, used as s3 bucket name and DynamoDB table name."
}

variable "tags" {
  description = "Map of tags applied to all resources."
  type        = "map"
}

locals {
  tags = "${merge(
            var.tags,
            map(
              "Region"       , "${var.region}",
              "Env"          , "${var.environment}",
              "Stack"        , "${var.stack_id}",
              "Terraform"    , "true",
              "Workspace"    , "${terraform.workspace}"
            )
        )}"
}
