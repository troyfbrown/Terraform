variable "ec2_instance_type" {
  type        = string
  description = "The type of the managed EC2 instances."

  validation {
    condition     = startswith(var.ec2_instance_type, "t3")
    error_message = "Only supports t3 family"
  }
}

variable "ec2_volume_config" {
  type = object({
    size = number
    type = string
  })
  description = "The size and type of the root block volume for ec2 instances."

  default = {
    size = 10
    type = "gp3"
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_value" {
  type      = string
  sensitive = true
}