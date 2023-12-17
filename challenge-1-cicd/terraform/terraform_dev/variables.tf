variable "projectid" {
 description = "Its a project"
 type = string
 default = "no_value"
}
variable "sa" {
 description = "Its a service account for project"
 type = string
 default = "no_value"
}
variable "terraform_bucket" {
 description = "Its terraform state bucket in project"
 type = string
 default = "no_value"
}
variable "source_code_bucket" {
 description = "Its a source code bucket in env"
 type = string
 default = "no_value"
}
variable "source_bucket" {
 description = "Its a source bucket in env"
 type = string
 default = "no_value"
}
variable "target_bucket" {
 description = "Its a target bucket in env"
 type = string
 default = "no_value"
}