
# terraform public subnet tags for kubernetes https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
module "eks" {     

        # import module templet
         source  = "terraform-aws-modules/eks/aws"
         version = "20.37.0"


# This is EKS control plane(cluster info)

        cluster_name   = local.cluster_name
        cluster_version = "1.31"
        cluster_endpoint_public_access = true

        vpc_id     = module.vpc.vpc_id
        subnet_ids = module.vpc.private_subnets
 
        cluster_addons ={
            vpc-cni = {
                most-recent = true
            }
            kube-proxy = {
                most-recent = true
            }
            core-dns = {
                most-recent = true
            }
        }

        # Control plane network
        control_plane_subnet_ids = module.vpc.intra_subnets
        # EKS Managed Node Group(s) in the cluster

        eks_managed_node_group_defaults = {
        instance_types = ["t2.medium"]
        attach_cluster_primary_security_group = true

        }
            
        eks_managed_node_groups = {
        hrx-cluster-ng= {
          instance_types = ["t2.medium"]

          min_size     = 2
          max_size     = 3
          desired_size = 2

          capactity_type="SPOT"
       }
     }
# cni =cluster networking interface
        tags = {
        Environment = local.env
        Terraform   = "true"
  }
  
}
