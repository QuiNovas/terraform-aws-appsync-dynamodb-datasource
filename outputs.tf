output "arn" {
  description = "The ARN of the created datasource."
  value       = aws_appsync_datasource.dynamodb_datasource.arn
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the datasource's role. "
  value       = aws_iam_role.dynamodb_datasource_role.arn
}

output "role_id" {
  description = "The id of the datasource's role."
  value       = aws_iam_role.dynamodb_datasource_role.id
}

output "role_name" {
  description = "The name of the datasource's role."
  value       = aws_iam_role.dynamodb_datasource_role.name
}

output "role_unique_id" {
  description = "The stable and unique string identifying the datasource's role."
  value       = aws_iam_role.dynamodb_datasource_role.unique_id
}

