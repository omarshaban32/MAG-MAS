# compute master instance
resource "oci_core_instance" "instance_mas_master" {
  compartment_id      = var.compartment_id
  availability_domain = var.ads[0]
  display_name        = var.instance_master_name
  shape               = var.instance_master_shape.name
  shape_config {
    ocpus         = var.instance_master_shape.ocpus
    memory_in_gbs = var.instance_master_shape.memory_in_gbs
  }
  source_details {
    source_type = "image"
    source_id   = var.instance_master_image_id
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.mas_snt_app.id
    assign_public_ip = false
    nsg_ids = [
      oci_core_network_security_group.mas_nsg_app.id
    ]
  }
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    #user_data           = data.cloudinit_config.mas_config.rendered
  }
}

# compute worker01 instance
resource "oci_core_instance" "instance_mas_worker_1" {
  compartment_id      = var.compartment_id
  availability_domain = var.ads[0]
  display_name        = var.instance_worker_1_name
  shape               = var.instance_worker_shape.name
  shape_config {
    ocpus         = var.instance_worker_shape.ocpus
    memory_in_gbs = var.instance_worker_shape.memory_in_gbs
  }
  source_details {
    source_type = "image"
    source_id   = var.instance_worker_image_id
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.mas_snt_app.id
    assign_public_ip = false
    nsg_ids = [
      oci_core_network_security_group.mas_nsg_app.id
    ]
  }
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    #user_data           = data.cloudinit_config.mas_config.rendered
  }
}

# compute worker 2 instance
resource "oci_core_instance" "instance_mas_worker_2" {
  compartment_id      = var.compartment_id
  availability_domain = var.ads[0]
  display_name        = var.instance_worker_2_name
  shape               = var.instance_worker_shape.name
  shape_config {
    ocpus         = var.instance_worker_shape.ocpus
    memory_in_gbs = var.instance_worker_shape.memory_in_gbs
  }
  source_details {
    source_type = "image"
    source_id   = var.instance_worker_image_id
  }
  create_vnic_details {
    subnet_id        = oci_core_subnet.mas_snt_app.id
    assign_public_ip = false
    nsg_ids = [
      oci_core_network_security_group.mas_nsg_app.id
    ]
  }
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
    #user_data           = data.cloudinit_config.mas_config.rendered
  }
}

# # compute worker 3 instance
# resource "oci_core_instance" "instance_mas_worker_3" {
#   compartment_id      = var.compartment_id
#   availability_domain = var.ads[0]
#   display_name        = var.instance_worker_3_name
#   shape               = var.instance_worker_shape.name
#   shape_config {
#     ocpus         = var.instance_worker_shape.ocpus
#     memory_in_gbs = var.instance_worker_shape.memory_in_gbs
#   }
#   source_details {
#     source_type = "image"
#     source_id   = var.instance_worker_image_id
#   }
#   create_vnic_details {
#     subnet_id        = oci_core_subnet.mas_snt_app.id
#     assign_public_ip = false
#     nsg_ids = [
#       oci_core_network_security_group.mas_nsg_app.id
#     ]
#   }
#   metadata = {
#     ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
#     #user_data           = data.cloudinit_config.mas_config.rendered
#   }
# }



# data "cloudinit_config" "mas_config" {
#   gzip          = true
#   base64_encode = true
#   part {
#     content_type = "text/cloud-config"
#     content = templatefile("configure_mas.tftpl", {
#       mas_user = var.db2_mas_user,
#       mas_pass = var.db2_mas_pass,
#       db_ip_addr = oci_core_instance.instance_db.private_ip
#     })
#     filename = "configure_mas.yaml"
#   }
# }