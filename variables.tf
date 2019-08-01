variable "gcp_credentials_file_path" {
  description = "Locate the GCP credentials .json file."
  type        = string
}

variable "gcp_project_id" {
  description = "GCP Project ID."
  type        = string
}

variable "gcp_region" {
  description = "Default to N.Virginia region."
  default     = "us-east4"
}

variable "gcp_subnet1_cidr" {
  default = "10.240.0.0/24"
}
