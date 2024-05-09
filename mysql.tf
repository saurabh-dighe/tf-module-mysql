#Provisions RDS instance
resource "aws_db_instance" "mysql" {
  allocated_storage       = 10
  db_name                 = "roboshop-${var.ENV}-mysql"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t3.micro"
  username                = "admin1"
  password                = "RoboShop1"
  parameter_group_name    = "mysql.mysql5.7"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.mysql.name
  vpc_security_group_ids  = [aws_security_group.allow_mysql.id]
}

#Provisions parameter group for RDS
resource "aws_db_parameter_group" "mysql" {
  name   = "rds-pg"
  family = "mysql5.7"
}

#Provisions security group
resource "aws_db_subnet_group" "mysql" {
  name       = "roboshop-${var.ENV}-mysql"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID 

  tags = {
    Name = "roboshop-${var.ENV}-subent-grp"
  }
}
