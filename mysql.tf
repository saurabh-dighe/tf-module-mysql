resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}




# resource "aws_docdb_cluster" "docdb" {
#   cluster_identifier      = "roboshop-${var.ENV}-docdb"
#   engine                  = "docdb"
#   master_username         = "admin1"
#   master_password         = "RoboShop1"
#   # backup_retention_period = 5                 Enable in prod
#   # preferred_backup_window = "07:00-09:00"
#   db_subnet_group_name    = aws_docdb_subnet_group.docdb.name 
#   skip_final_snapshot     = true
#   vpc_security_group_ids  = [aws_security_group.allow_docdb.id]
# }

# resource "aws_docdb_subnet_group" "docdb" {
#   name       = "roboshop-${var.ENV}-docdb"
#   subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID      #["subnet-02697ba5b34a70afc", "subnet-0a325caa7edfb6b05"]

#   tags = {
#     Name = "roboshop-${var.ENV}-subent-grp"
#   }
# }

# resource "aws_docdb_cluster_instance" "cluster_instances" {
#   count              = 1
#   identifier         = "docdb-cluster-demo-${count.index}"
#   cluster_identifier = aws_docdb_cluster.docdb.id
#   instance_class     = "db.t3.medium"
#     tags = {
#     Name = "roboshop-${var.ENV}-cluster_instance-${count.index}"
#   }
# }

