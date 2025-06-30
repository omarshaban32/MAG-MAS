# NSG for the load balancer
resource "oci_core_network_security_group" "mas_nsg_lb" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.mas_vcn.id
  display_name   = var.nsg_lb_display_name
}
# Allow HTTP (TCP port 80)
resource "oci_core_network_security_group_security_rule" "mas_nsg_lb_http" {
  network_security_group_id = oci_core_network_security_group.mas_nsg_lb.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 80
      min = 80
    }
  }
}
# Allow HTTPS (TCP port 443)
resource "oci_core_network_security_group_security_rule" "mas_nsg_lb_https" {
  network_security_group_id = oci_core_network_security_group.mas_nsg_lb.id
  direction                 = "INGRESS"
  protocol                  = "6"
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  tcp_options {
    destination_port_range {
      max = 443
      min = 443
    }
  }
}

# NSG for the app servers
resource "oci_core_network_security_group" "mas_nsg_app" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.mas_vcn.id
  display_name   = var.nsg_app_display_name
}
# Allow Rails (TCP port 6443/tcp (API), 22623/tcp (Machine Config), 10250/tcp (Kubelet))
resource "oci_core_network_security_group_security_rule" "mas_nsg_app_api" {
  network_security_group_id = oci_core_network_security_group.mas_nsg_app.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  
  tcp_options {
    destination_port_range {
      max = 6443
      min = 6443
    }
  }
}

resource "oci_core_network_security_group_security_rule" "mas_nsg_app_machine_config" {
  network_security_group_id = oci_core_network_security_group.mas_nsg_app.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  
  tcp_options {
    destination_port_range {
      max = 22623
      min = 22623
    }
  }
}

resource "oci_core_network_security_group_security_rule" "mas_nsg_app_kubelet" {
  network_security_group_id = oci_core_network_security_group.mas_nsg_app.id
  direction                 = "INGRESS"
  protocol                  = "6"  # TCP
  source                    = "0.0.0.0/0"
  source_type               = "CIDR_BLOCK"
  
  tcp_options {
    destination_port_range {
      max = 10250
      min = 10250
    }
  }
}

# Security list for the database servers
resource "oci_core_security_list" "mas_sl_db" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.mas_vcn.id
  display_name   = var.sl_db_display_name

  # Allow TCP port 25000 for DB2
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
      max = 25000
      min = 25000
    }
  }

  # Allow TCP port 25000 for DB2
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    tcp_options {
      max = 25000
      min = 25000
    }
  }
}