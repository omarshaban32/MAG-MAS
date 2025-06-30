# Common variables
compartment_id = "ocid1.compartment.oc1..aaaaaaaadtzks6ry4rg3eahh7jw7qz3kdks2w4wyifwqb7mb6h3uvwueowuq"
region         = "us-phoenix-1"
ads            = ["EAbO:US-ASHBURN-AD-1", "EAbO:US-ASHBURN-AD-2", "EAbO:US-ASHBURN-AD-3"]

# VCN variables
vcn_config = {
  cidr_blocks  = ["10.0.0.0/16"]
  display_name = "MAS_VCN-MAS"
  dns_label    = "vcnMAS"
}

# Internet gateway variables
ig_config = {
  display_name = "MAS_IG"
  enabled      = true
}

# NAT gateway variables
ng_display_name = "MAS_NG"

# Route table variables
rt_public_display_name  = "MAS_RT-PUBLIC"
rt_private_display_name = "MAS_RT-PRIVATE"

# Load balancer subnet config
snt_lb_config = {
  display_name = "MAS_SNT-LB"
  dns_label    = "sntlb"
  cidr_block   = "10.0.1.0/24"
}

# App server subnet config
snt_app_config = {
  display_name = "MAS_SNT-APP"
  dns_label    = "sntapp"
  cidr_block   = "10.0.2.0/24"
}

# Database subnet config
snt_db_config = {
  display_name = "MAS_SNT-DB"
  dns_label    = "sntdb"
  cidr_block   = "10.0.3.0/24"
}

# Network security variables
nsg_lb_display_name  = "MAS_NSG-LB"
nsg_app_display_name = "MAS_NSG-APP"
sl_db_display_name   = "MAS_SL-DB"

# Compute master shape configuration
instance_master_shape = {
  name          = "VM.Standard.A1.Flex"
  ocpus         = "1"
  memory_in_gbs = "6"
}

# Compute worker shape configuration
instance_worker_shape = {
  name          = "VM.Standard.A1.Flex"
  ocpus         = "1"
  memory_in_gbs = "6"
}

# Compute db2 shape configuration
instance_db2_shape = {
  name          = "VM.Standard.A1.Flex"
  ocpus         = "1"
  memory_in_gbs = "6"
}

# Compute image OCID
instance_master_image_id = "ocid1.image.oc1.iad.aaaaaaaa7fzt4xbwnn26eqoxid32ipcqibn6se3em7pqpnyrqifqdbmihx3q"
instance_worker_image_id = "ocid1.image.oc1.iad.aaaaaaaa7fzt4xbwnn26eqoxid32ipcqibn6se3em7pqpnyrqifqdbmihx3q"
instance_db2_image_id  = "ocid1.image.oc1.iad.aaaaaaaa7fzt4xbwnn26eqoxid32ipcqibn6se3em7pqpnyrqifqdbmihx3q"

instance_master_name = "MAS_VM-master"
instance_worker_1_name = "MAS_VM-worker_1"
instance_worker_2_name = "MAS_VM-worker_2"
instance_worker_3_name = "MAS_VM-worker_3"
instance_db2_name  = "MAS_VM-DB2"

# db2 configuration
db2_root_pass  = "RootPassword123%" # Example password
db2_mas_user = "rubyonmas" # Example username
db2_mas_pass = "masPassword123%" # Example password

# Load balancer configuration
lb_config = {
  display_name              = "MAS_LB"
  shape                     = "flexible"
  minimum_bandwidth_in_mbps = 10
  maximum_bandwidth_in_mbps = 10
}

# Load balancer backend
lb_backend_config = {
  display_name = "MAS_LBBS"
  protocol     = "HTTP"
  port         = 8080
  policy       = "LEAST_CONNECTIONS"
  path         = "/"
}

# Load balancer listener
lb_listener_config = {
  display_name = "MAS_LBLS"
  protocol     = "HTTP"
  port         = 80
}