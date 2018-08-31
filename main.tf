data "aws_iam_policy_document" "datasource_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = [
        "appsync.amazonaws.com",
      ]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "dynamodb_datasource_role" {
  assume_role_policy = "${data.aws_iam_policy_document.datasource_assume_role.json}"
  name               = "${var.role_name_prefix}appsync-${local.name}-datasource"
}

data "aws_iam_policy_document" "dynamodb_access" {
  statement {
    actions   = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]
    resources = [
      "${var.dynamodb_table_arn}",
      "${var.dynamodb_table_arn}/*"
    ]
    sid       = "AllowTableAccess"
  }
}

resource "aws_iam_role_policy" "dynamo_access" {
  name    = "${var.dynamodb_table_name}-access"
  policy  = "${data.aws_iam_policy_document.dynamodb_access.json}"
  role    = "${aws_iam_role.dynamodb_datasource_role.id}"
}

resource "aws_appsync_datasource" "dynamodb_datasource" {
  api_id            = "${var.api_id}"
  dynamodb_config {
    region      = "${local.region}"
    table_name  = "${var.dynamodb_table_name}"
  }
  name              = "${local.name}"
  service_role_arn  = "${aws_iam_role.dynamodb_datasource_role.arn}"
  type              = "AMAZON_DYNAMODB"
}
