# resource "aws_route53_zone" "hosted-zone" {
#   name = "roboshop-${var.ENV}-internal"

#   vpc {
#     vpc_id = data.terraform_remote_state.vpc.outputs.VPC_ID 
#   }
# }

resource "aws_route53_record" "mysql" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTEDZONE_ID
  name    = "mysql-${var.ENV}"
  type    = "CNAME"
  ttl     = 10
  records = [aws_db_instance.mysql.address]
}