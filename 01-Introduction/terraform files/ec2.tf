#resource block
resource "aws_instance" "ubuntu" {
  ami = ami-0574da719dca65348
  instance_type = var.my_instance_type
  user_data = file("${path.module}/ansible-install-ubuntu.sh")
  key_name = var.my_key

  tags = {
    "Name" = "Ansible-Ubuntu"
  }
}

resource "aws_instance" "rhel" {
  ami = ami-08e637cea2f053dfa
  instance_type = var.my_instance_type
  user_data = file("${path.module}/ansible-install-rhel.sh")
  key_name = var.my_key

  tags = {
    "Name" = "Ansible-rhel8"
  }
}

resource "aws_instance" "ubuntu-hosts" {
  ami = ami-0574da719dca65348
  instance_type = var.my_instance_type
  user_data = file("${path.module}/create_ansible_user.sh")
  key_name = var.my_key
  count = 3
  tags = {
    "Name" = "My-Ubuntu-${count.index}"
    "Type" = "My-Ubuntu-${count.index}"
  }
}

resource "aws_instance" "rhel-hosts" {
  ami = ami-08e637cea2f053dfa
  instance_type = var.my_instance_type
  user_data = file("${path.module}/create_ansible_user.sh")
  key_name = var.my_key
  count = 5
  tags = {
    "Name" = "My-rhel-${count.index}"
  }
}
