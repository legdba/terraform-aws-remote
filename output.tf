output "s3_bucket_id" {
  value = "${aws_s3_bucket.tf_remote.id}"
}

output "dynamo_table_id" {
  value = "${aws_dynamodb_table.tf_remote.id}"
}
