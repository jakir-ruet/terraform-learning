resource "null_resource" "ec2_null_resource" {
  depends_on = [module.ec2_bastion_instance]

  # Connection configuration
  connection {
    type        = "ssh"
    host        = aws_eip.ec2_bastion_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("private-key/private-key.pem")
  }

  # ==============Creation provisioner==============
  # File provisioner >> copy files
  provisioner "file" {
    source      = "private-key/private-key.pem"
    destination = "~/terraform-key.pem"
  }

  # Remote exec provisioner >> give permission
  provisioner "remote-exec" {
    inline = ["sudo chmod 777 /tmp"]
  }

  # Local exec provisioner >> save vpc_id and create time & date
  provisioner "local-exec" {
    command     = "echo 'VPC created on $(date) & VPC Id: ${module.vpc.vpc_id}' >> vpc-id-created-time.txt"
    working_dir = "local-exec-output-files/"
  }

  # Save vpc_id to a file for use during destroy
  provisioner "local-exec" {
    command     = "mkdir -p local-exec-output-files && echo ${module.vpc.vpc_id} > local-exec-output-files/vpc-id.txt"
    working_dir = "local-exec-output-files/"
  }

  # ==============Destroy provisioner==============
  # Local exec provisioner >> destroy time & date
  # provisioner "local-exec" {
  #   command     = "echo VPC destroyed on `date` & VPC Id: $(cat local-exec-output-files/vpc-id.txt) >> vpc-id-destroyed-time.txt"
  #   working_dir = "local-exec-output-files/"
  #   when        = destroy
  # }
}
