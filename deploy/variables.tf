variable "region" {
  default = "us-west-2"
}

variable "prefix" {
  default = "todolist"
}

variable "tf_state_bucket" {
  type        = string
  default     = "terraform-state-lw72"
  description = "Name of bucket used to store Terraform state."
}

variable "tf_state_lock_table" {
  type    = string
  default = "terraform-state-lock"
}
