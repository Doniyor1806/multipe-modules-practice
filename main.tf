resource "aws_iam_user" "users" {
  for_each = toset(var.users)
  name     = each.key
  path     = "/"
}
variable "users" {
  type    = list(string)
  default = ["value"]
}

output "user_name" {
  value = [for user in aws_iam_user.users : user.name]
}
