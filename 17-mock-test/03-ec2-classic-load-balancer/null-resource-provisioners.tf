# Define a null resource & provisioners
resource "null_resource" "null-resouce-eip" {
  depends_on = [module.ec2_public]
  connection {
    type        = "ssh"
    host        = aws_eip.ec2_bastion_eip # comes from elastic-ip.tf
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/private-key.pem")
  }
  # File Provisioner >> Copies the terraform-key.pem file to /tmp/terraform-key.pem
  # https://developer.hashicorp.com/terraform/language/resources/provisioners/file
  provisioner "file" {
    source      = "private-key/private-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
  # Remote Exec Provisioner >> Using remote-exec provisioner fix the private key permissions on Bastion public host
  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/terraform-key.pem"]
  }
  # Local Exec Provisioner >>  local-exec provisioner (Creation-Time Provisioner >> Triggered during Create Resource)
  provisioner "local-exec" {
    command     = "echo 'VPC created on $(date) and VPC ID: ${module.vpc.vpc_id}' >> creation-time-vpc-ip.txt"
    working_dir = "local-exec-output-files"
    #  on_failure  = continue
  }
  # Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner >> Triggered during deletion of Resource)
  #   provisioner "local-exec" {
  #     command     = "echo 'Destroy time provisioner $(date)' >> destroy-time-prov.txt"
  #     working_dir = "local-exec-output-files/"
  #     when        = destroy
  #     # on_failure  = "continue"
  #   }
}
