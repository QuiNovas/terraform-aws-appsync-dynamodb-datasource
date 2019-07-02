variable "api_id" {
  description = "The API ID for the GraphQL API for the DataSource."
  type        = string
}

variable "description" {
  default     = ""
  description = "A description of the DataSource."
  type        = string
}

variable "dynamodb_table_arn" {
  description = "The DynamoDB Table ARN."
  type        = string
}

variable "dynamodb_table_name" {
  description = "The DynamoDB Table name."
  type        = string
}

variable "dynamodb_table_region" {
  default     = ""
  description = "The AWS region of the DynamoDB Table. Defaults to the current region."
  type        = string
}

variable "name" {
  default     = ""
  description = "TA user-supplied name for the DataSource. Defaults to the table name."
  type        = string
}

variable "role_name_prefix" {
  default     = ""
  description = "Prefix to attach to the role name."
  type        = string
}

