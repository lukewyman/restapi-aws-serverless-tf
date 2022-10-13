variable "region" {
    type = string 
    description = "The AWS Region to which the function will be deployed"
}

variable "function_name" {
    type = string 
    description = "function_name will be applied to the Lambda function, the ECR Repository and ECR Image"
}

variable "timeout" {
  type = number
  default = 300
}

variable "function_dir" {
    type = string 
    description = "The directory location of the Lambda code."
}

variable "docker_dir" {
    type = string 
    description = "The directory location of the Dockerfile for the Lambda function."
}

variable "image_tag" {
    type = number 
    description = "Tag number for the ECR image."
}

variable "environment_variables" {
  type = map 
  default = {}
}