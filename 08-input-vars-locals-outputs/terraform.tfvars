# The following are in order of lowest to highest precedence
# TF_VAR instance type = "t3.micro"
# terraform.tfvars.    = "t3.micro"
# prod.auto.tfvars     = "t3.micro" (does not exist)
# -var and -var-file cli argument, latest with highest precedence = "t3.micro"

ec2_instance_type = "t3.micro"

ec2_volume_config = {
  size = 10
  type = "gp2"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}
