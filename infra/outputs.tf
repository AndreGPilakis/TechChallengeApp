output "instance_public_ip" {
  value = module.create_ec2.instance_public_ip
}

output "lb_endpoint" {
  value = module.create_lb.lb_endpoint
}

output "db_endpoint" {
  value = module.create_db.db_endpoint
}

output "db_user" {
  value = module.create_db.db_user
}

output "db_pass" {
  sensitive = true
  value     = module.create_db.db_pass
}