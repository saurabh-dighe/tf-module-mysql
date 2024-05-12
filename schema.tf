resource "null_resource" "schema" {

    # This make sures that this null_resource will only be executed post the creation of the RDS only    
    depends_on = [aws_db_instance.mysql]

      provisioner "local-exec" {
        command = <<EOF
            cd /tmp
            curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
            unzip -o mysql.zip
            cd mysql-main
            mysql -h ${aws_db_instance.mysql.address}  -uadmin1 -pRoboShop1 < shipping.sql
        EOF
    }
}

resource "aws_route53_zone" "hosted-zone" {
  name = "roboshop-${var.ENV}-internal"

  vpc {
    vpc_id = data.terraform_remote_state.vpc.outputs.VPC_ID 
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = aws_route53_zone.hosted-zone.zone_id
  name    = "mysql-${var.ENV}-roboshop-internal"
  type    = "CNAME"
  ttl     = 10
  records = [aws_db_instance.mysql.address]
}