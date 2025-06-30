# Common variables
variable "compartment_id" {
  type      = string
  sensitive = true
}
variable "region" {
  type = string
}
variable "ads" {
  type = list(string)
}

# VCN variables
variable "vcn_config" {
  type = object({
    cidr_blocks  = list(string)
    display_name = string
    dns_label    = string
  })
}

# Internet gateway variables
variable "ig_config" {
  type = object({
    display_name = string
    enabled      = bool
  })
}

# NAT gateway variables
variable "ng_display_name" {
  type = string
}

# Route table variables
variable "rt_public_display_name" {
  type = string
}
variable "rt_private_display_name" {
  type = string
}

# Load balancer subnet config
variable "snt_lb_config" {
  type = object({
    display_name = string
    dns_label    = string
    cidr_block   = string
  })
}

# App server subnet config
variable "snt_app_config" {
  type = object({
    display_name = string
    dns_label    = string
    cidr_block   = string
  })
}

# Database subnet config
variable "snt_db_config" {
  type = object({
    display_name = string
    dns_label    = string
    cidr_block   = string
  })
}

# Network security variables
variable "nsg_lb_display_name" {
  type = string
}
variable "nsg_app_display_name" {
  type = string
}
variable "sl_db_display_name" {
  type = string
}

# Compute instance master shape configuration
variable "instance_master_shape" {
  type = object({
    name          = string
    ocpus         = string
    memory_in_gbs = string
  })
}

# Compute instance worker  shape configuration
variable "instance_worker_shape" {
  type = object({
    name          = string
    ocpus         = string
    memory_in_gbs = string
  })
}


# Compute instance DB2 shape configuration
variable "instance_db2_shape" {
  type = object({
    name          = string
    ocpus         = string
    memory_in_gbs = string
  })
}

# Compute master instance image OCID master
variable "instance_master_image_id" {
  type = string
}

# Compute worker instance image OCID worker
variable "instance_worker_image_id" {
  type = string
}

# Compute instance image OCID DB2
variable "instance_db2_image_id" {
  type = string
}

# Display name for the master server
variable "instance_master_name" {
  type = string
}

# Display name for the worker 1 server
variable "instance_worker_1_name" {
  type = string
}

# Display name for the worker 2 server
variable "instance_worker_2_name" {
  type = string
}

# Display name for the worker 3 server
variable "instance_worker_3_name" {
  type = string
}


# Display name for the database server
variable "instance_db2_name" {
  type = string
}

# db2 configuration
variable "db2_root_pass" {
  type      = string
  sensitive = true
}
variable "db2_mas_user" {
  type      = string
  sensitive = true
}
variable "db2_mas_pass" {
  type      = string
  sensitive = true
}

# Load Balancer configuration
variable "lb_config" {
  type = object({
    display_name              = string
    shape                     = string
    maximum_bandwidth_in_mbps = number
    minimum_bandwidth_in_mbps = number
  })
}

# Load balancer backend
variable "lb_backend_config" {
  type = object({
    display_name = string
    protocol     = string
    port         = number
    policy       = string
    path         = string
  })
}

# Load balancer listener
variable "lb_listener_config" {
  type = object({
    display_name = string
    port         = number
    protocol     = string
  })
}