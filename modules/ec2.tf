resource "aws_instance" "frontend" {
  ami           = var.ami
  instance_type = var.instance_type
  count = var.length
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.frontend-sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.pem.key_name
    root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = var.encrypted
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = "${var.env}-${var.project}"
  }


}
