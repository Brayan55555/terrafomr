 resource "aws_db_instance" "demo-mysql-db" {
     identifier = "demo-mysql-db"
     storage_type = "gp2"
     allocated_storage = 20
     engine = "mysql"
     engine_version = "8.0"
     instance_class = "db.t2.micro"
     port = 3306
     db_subnet_group_name = "default-vpc-0fb68f82adc884702"
     name = "myDemoDb"
     username = var.username
     password = var.password
     parameter_group_name = "default.mysql8.0" 
     availability_zone = "us-east-1a"
     publicly_accessible = true
     deletion_protection = true 
     skip_final_snapshot = true

     tags = {
         Name = "demo-mysql-rds-isntace"
     }  
 }