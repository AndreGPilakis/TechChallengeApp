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
  #This password is being stored in plaintext. You should never, ever do this in a production environment. In a real world scenario I would use a key vault or other KMS to store this password and then retrieve it via AWS/Azure. Howver because I didn't want to add any more dependencies or require the user to have a specific AWS account to access passwords, I've left it in plaintext.
  password             = "mysupersecretpassword"
  db_port              = 5432