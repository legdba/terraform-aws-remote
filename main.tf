provider "aws" {
  version    = "~> 1.30"
  region     = "${var.region}"
}

resource "aws_s3_bucket" "tf_remote" {
  bucket = "${var.stack_id}"
  acl    = "private"
  region = "${var.region}"

  versioning {
    enabled = true
  }

  # lifecycle {
  #   prevent_destroy = true
  # }

  tags = "${merge(
           local.tags,
           map(
             "Name", "${var.stack_id}"
           )
        )}"
}

resource "aws_dynamodb_table" "tf_remote" {
  name           = "${var.stack_id}"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = "${merge(
           local.tags,
           map(
             "Name", "${var.stack_id}"
           )
        )}"
}