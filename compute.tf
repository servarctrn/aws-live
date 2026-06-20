resource "aws_instance" "jenkins-server1" {
  ami                         = "ami-0453ec754f44f9a4a"
  instance_type               = "t2.medium"
  key_name                    = "testkp2024"
  subnet_id                   = aws_subnet.public-subnet1.id
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${aws_security_group.class-demo-sg.id}"]
  user_data                   = file("jenkins.sh")

  tags = {
    Name        = "jenkins-server1"
    Builder     = "Dennis O"
    Application = "Jenkins-App"
    Date        = "12/3/2024"
  }
}