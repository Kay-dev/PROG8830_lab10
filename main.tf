provider "aws" {
    region = "us-east-1"
}

data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "example" {
    ami           = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
    instance_type = "t3.micro"
    count         = var.core_count

    tags = {
        Name = "ExampleInstance"
    }
}