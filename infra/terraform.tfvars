# ec2 instance params, This id is only valid for US east.
ami_id = "ami-0ff8a91507f77f867"
instance_type = "t2.micro"

#db params
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.6.16"
  instance_class       = "db.t2.micro"
  name                 = "app"
  username             = "postgres"
  password             = "mysupersecretpassword"
  db_port              = 5432