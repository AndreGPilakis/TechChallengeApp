resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  #Change your public key here if it is named differently.
  public_key = file("~/.ssh/id_rsa.pub")
}

output "key_pair_name" {
  value = aws_key_pair.deployer.key_name
}
