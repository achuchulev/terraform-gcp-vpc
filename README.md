# Sample terraform configuration to create VPC on Google Cloud Platform (GCP)

# Prerequisites

- git
- terraform (>= 0.12)
- GCP subscription

## How to use

- Create `terraform.tfvars` file

```
gcp_credentials_file_path = "/path/to/your/gcloud/credentials.json"
gcp_project_id = "your-gcp-project-id"
```

#### Create `variables.tf` file

```
variable "gcp_credentials_file_path" {}
variable "gcp_project_id" {}
variable "gcp_region" {}
variable "gcp_subnet1_cidr" {}
```

#### Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| gcp_credentials_file_path | Locate the GCP credentials .json file. | string  | - | yes
| gcp_project_id | GCP Project ID. | string  | - | yes
| gcp_region | Requester AWS secret key | string  | us-east4 | yes
| gcp_subnet1_cidr | VPC subnet CIDR block | string  | 10.24.0.0/24 | yes


#### Create `main.tf` file

```
module "new_gcp_vpc" {
  source = "git@github.com:achuchulev/terraform-gcp-vpc.git"
  
  gcp_credentials_file_path = var.gcp_credentials_file_path
  gcp_project_id            = var.gcp_project_id
  gcp_region                = var.gcp_region
  gcp_subnet1_cidr          = var.gcp_subnet1_cidr
}

```

#### Create `outputs.tf` file

```
output "gcp_vpc_network_id" {
  value = module.new_gcp_vpc.gcp_vpc_network_id
}

output "gcp_vpc_network_subnet_id" {
  value = module.new_gcp_vpc.gcp_vpc_network_subnet_id
}
```

- Initialize terraform and plan/apply

```
terraform init
terraform plan
terraform apply
```

- `Terraform apply` will:
  - create new VPC on specified GCP region
  - create subnet for VPC
  - create firewall rules to allow ICMP, SSH and Internet traffic 
  - create default routes for the VPC and for Internet
 
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| gcp_vpc_network_id | VPC Network id
| gcp_vpc_network_subnet_id  | VPC subnet id
