# Terraform AWS Remote 

Terraform module which creates a [remote state storage](https://www.terraform.io/docs/state/remote.html) backed with S3 and DynamoDB.

## Usage

### Inputs

| Variable    | Description                                                       | Type   | Default | Required |
|-------------|-------------------------------------------------------------------|--------|---------|----------|
| region      | Region to generate the S3 bucket and DynamoDB table into          | string | -       | yes      |
| environment | Deployment environment; typically production, staging, etc.       | string | -       | yes      |
| stack_id    | Stack identifier, used as s3 bucket name and DynamoDB table name. | string | -       | yes      |
| tags        | Map of tags applied to all resources.                             | map    | -       | yes      |

### Outputs

| Name            | Description        |
|-----------------|--------------------|
| s3_bucket_id    | S3 bucket ID       |
| dynamo_table_id | Dynamo DB table ID |

### Tagging

All created resources are tagged with:

* Name = stack_id
* Region = aws region
* Stack = stack_id
* Terraform = "true"
* Workspace = Terraform's workspace

## License

Apache 2 Licensed. See LICENSE for full details.
