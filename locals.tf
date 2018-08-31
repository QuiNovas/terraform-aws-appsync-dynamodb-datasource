data "aws_region" "current" {}

locals {
  name    = "${length(var.name) != 0 ? var.name : var.dynamodb_table_name}"
  region  = "${length(var.dynamodb_table_region) != 0 ? var.dynamodb_table_region : data.aws_region.current.name}"
}