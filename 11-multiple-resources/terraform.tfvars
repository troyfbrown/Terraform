ec2_instance_count = 0

ec2_instance_config_list = []

ec2_instance_config_map = {
  ubuntu_1 = {
    instance_type = "t3.micro",
    ami           = "ubuntu"
    subnet_index  = 0
  }

  nginx_1 = {
    instance_type = "t3.micro",
    ami           = "nginx"
    subnet_index  = 1
  }
}