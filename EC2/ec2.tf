resource "aws_instance" "example" {
  ami             = "ami-04505e74c0741db8d"
  instance_type   = "t2.micro"
  key_name= "id_rsa"
  security_groups = ["launch-wizard-1"]
  tags = {
    Name = "brayan-ec2"
  }

  provisioner "remote-exec" {
    inline = [
      "touch prueba.txt"
    ]
  }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/brayan/.ssh/id_rsa")
      timeout     = "4m"
   }
  
}

resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbC/Om/DqqyRDPXqnLcAkus4ZCN6YvxAMeunocnN0hRoAjUEZ5WQSu/qaIwCFv7npjdX/lXoDy6tpVWvUi0j7Rya7Gj4LDm6OxHuyeENaYO1+Rig7q6VuV6BN/XU4nQ8hov4ZHT2OgPBd7HlncuLLV8cEbzxe7yoUYkei/wD6BuYGGJUyB0dKa2PPWpWHcvMQzXkovT2k3fClSADwiv0Z0ayGbTMKhnqZ4UTJ53xtRa2z01UuwXxQ5uR2SCu9mf6Ge2ws4Y4/lFcLgMGpKd43LCRZnbFx+R3SM4kzorpgJB8PCPl4SP96nA7aSOPG3ADWIE2/ngBnJhLHSEgn596SPfKNMufl3PivlOdV4RMOvSTD/qbjh19Lxa2opQvErPY/Cb+fjlo/3iqTsUJEX5boyh9JJONwg8LbBSwz2JQ740kXMOqlbTgyqaBO68MjLAnn6d9JLqBfjuBwq+WSDiOJWrM0eTNkvSaT5WCQaZnLgX4/USbPc0wvA6fsyHoaYTLlg8d2PJw5Qf+o0w5P6J7+yxw5CwXNyRztOmRZQl0iT8MotBR/gf14y5iJpjYko5YsSJXfRrEe7/f0qH6Kw15X6oXqNGEK/7BtKkP/PDBovlp0Mt5DHgFsdoM0Qq4F0BQksxCPenUNsUPUVmg9mKtj+/zq0tK6faSYY4/aXOykhtw== bumba@misena.edu.co"
}