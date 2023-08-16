# Debian

packer {
  required_plugins {
    amazon = {
      version = "= 1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name                    = "scenario-2-justneedspace"
  instance_type               = "t2.micro"
  region                      = "${var.region}"
  vpc_id                      = "${var.vpc_id}"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  source_ami                  = "${var.source_ami}"
  ssh_username                = "admin"
}

build {
  name = "ubuntu-build"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  # OS & scenario packages
  provisioner "shell" {
    inline = [
      "echo Update packages...",
      "sudo apt-get update",
      "touch /tmp/success.file"
    ]
  }

  # badlog.py
  provisioner "file" {
    source      = "../files/ineedspace.py"
    destination = "/tmp/ineedspace.py"
  }

#  provisioner "shell" {
#    inline = [
#      "mv /tmp/badlog.py /home/admin/badlog.py",
#      "chmod +x /home/admin/badlog.py",
#      "sudo touch /var/log/bad.log",
#      "sudo chown admin: /var/log/bad.log",
#      "echo '@reboot /home/admin/badlog.py &' | crontab -",
#    ]
#  }

#  # check.sh
#  provisioner "file" {
#    source      = "../files/check.sh"
#    destination = "/tmp/check.sh"
#  }

#  provisioner "shell" {
#    inline = [
#      "sudo mv /tmp/check.sh /home/admin/agent/check.sh",
#      "sudo chmod +x /home/admin/agent/check.sh",
#    ]
#  }

}
