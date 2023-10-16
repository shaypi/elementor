#General vars
region      = "eu-west-1"
prefix      = "elementor"
project     = "elementor"
application = "elementor"

#VPC
create_vpc          = true
cidr_block          = "10.0.16.0/23"
azs                 = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
public_subnet_cidr  = ["10.0.16.0/27", "10.0.16.32/27", "10.0.16.64/27"]
private_subnet_cidr = ["10.0.17.0/27", "10.0.17.32/27", "10.0.17.64/27"]
enable_nat_gateway  = true
public_eks_tag      = { "kubernetes.io/role/elb" = 1 }
private_eks_tag     = { "kubernetes.io/role/internal-elb" = 1 }
eks_cluster_name    = "elementor"

#EKS
cluster_name            = "elementor"
k8s_version             = "1.28"
node_instance_type      = "c5d.2xlarge"
aws_iam                 = "eks-cluster-autoscaler"
desired_capacity        = 3
max_size                = 5
min_size                = 0
max_unavailable         = 1
endpoint_private_access = true
endpoint_public_access  = true
eks_cw_logging          = ["api", "audit", "authenticator", "controllerManager", "scheduler"]