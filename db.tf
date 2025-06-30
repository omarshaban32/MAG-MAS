# Database (db2) compute instance
resource "oci_core_instance" "instance_db" {
  compartment_id      = var.compartment_id
  availability_domain = var.ads[0]
  display_name        = var.instance_db2_name
  shape               = var.instance_db2_shape.name
  shape_config {
    ocpus         = var.instance_db2_shape.ocpus
    memory_in_gbs = var.instance_db2_shape.memory_in_gbs
  }
  source_details {
    source_type = "image"
    source_id   = var.instance_db2_image_id
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.mas_snt_db.id
    assign_public_ip = false
  }
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    #user_data           = data.cloudinit_config.db2_config.rendered
  }
}

# data "cloudinit_config" "db2_config" {
#   gzip          = true
#   base64_encode = true
#   part {
#     content_type = "text/cloud-config"
#     content = templatefile("configure_db2.tftpl", {
#       root_pass  = var.db2_root_pass,
#       mas_user = var.db2_mas_user,
#       mas_pass = var.db2_mas_pass
#     })
#     filename = "configure_db2.yaml"
#   }
# }