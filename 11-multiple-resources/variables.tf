variable "subnet_count" {
  type    = number
  default = 2
}

variable "ec2_instance_count" {
  type    = number
  default = 1
}

variable "ec2_instance_config_list" {
  type = list(object({
    instance_type = string
    ami           = string
  }))

  # Ensure that only t3-micro is used
  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list : contains(["t3.micro"], config.instance_type)
    ])
    error_message = "Only t3.micro instances are allowed."
  }

  # Ensure that only ubuntu and nginx images are used
  validation {
    condition = alltrue([
      for config in var.ec2_instance_config_list : contains(["nginx", "ubuntu"], config.ami)
    ])
    error_message = "At least one of the provided \"ami\" values is not supported. \nSupported \"ami\" values: \"ubuntu\", \"nginx\"."
  }
}

variable "ec2_instance_config_map" {
  type = map(object({
    instance_type = string
    ami           = string
    subnet_index  = optional(number)
  }))
}