module "database" {
  source = "./modules/rds"

  project_name       = "proj04-rds-module"
  security_group_ids = []
  subnet_ids         = [
    aws_subnet.allowed.id,
    aws_subnet.not_allowed.id
  ]
  credentials = {
    username = "db-admin"
    password = "abc1+?_"
  }
}