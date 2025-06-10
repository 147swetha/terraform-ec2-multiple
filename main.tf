provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2
  instance_type = var.instance_type
  key_name      = "Devops-key"

  tags = {
    Name = "AutoEC2-${count.index + 1}"
  }
}
