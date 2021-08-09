
data "template_file" "update-instance" {
  template = file("${path.module}/scripts/script.sh")
                         

  vars = {
  }
}


data "template_cloudinit_config" "cloudinit_portal" {

  gzip = false
  base64_encode = false

  part {
    content      = data.template_file.update-instance.rendered
  }
}

