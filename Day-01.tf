variable "instance_type" {
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
}

output "public_ip" {
  value = aws_instance.example.public_ip
}


"""
When & Where Can You Set the Variable Name?
1. Using a Terraform CLI Argument (-var)
terraform apply -var "instance_type=t3.micro"

2. Using a .tfvars File
Create a file terraform.tfvars:
instance_type = "t3.micro"

3. Using Environment Variables (TF_VAR_)
Set the variable in your terminal:

export TF_VAR_instance_type="t3.micro"
terraform apply

"""
