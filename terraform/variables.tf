# variable instance_type {
#   description = "The type of EC2 instance to create"
#   type        = string
#   default     = "t2.micro"
# }

# variable subnet_id {
#   description = "The ID of the subnet in which to launch the EC2 instance"
#   type        = string
# }

# variable "project" {
#   description = "The name of the project"
#   type        = string
# }

# variable environment {
#   description = "The environment for the EC2 instance (e.g., dev, staging, prod)"
#   type        = string
# }

# variable vpc_id {
#   description = "The ID of the VPC in which to create the security group"
#   type        = string
# }

# # variable "aws_region" {
# #   description = "The AWS region in which to deploy the resources"
# #   type        = string
# #   default     = "ap-southeast-2"
  
# # }


variable project {
  description = "The project name for tagging"
  type        = string
  default     = "bootcamp-bayasaa"
}

variable environment {
  description = "The environment for tagging (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable instance_type {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "Bucket name"
  type        = string
  
}

variable "aws_region" {
  description = "The AWS region where the resources will be created"
  type        = string
  default     = "ap-southeast-2"  # Default region can be changed as needed
  
}

variable airflow_admin_user {
  description = "The Airflow admin user"
  type        = string
}

variable airflow_admin_pass {
  description = "The Airflow admin password"
  type        = string
}

variable dbt_container_image {
  description = "The Docker image for the dbt container"
  type        = string
}

variable dbt_vcpu {
  description = "The number of vCPUs for the dbt container"
  type        = number
  default     = 2
}

variable dbt_memory {
  description = "The amount of memory (in MiB) for the dbt container"
  type        = number
  default     = 4096
}

variable db_name {
  description = "The name of the database to create"
  type        = string
}

variable db_user {
  description = "The username for the database"
  type        = string
}

variable db_password {
  description = "The password for the database user"
  type        = string
}

variable csv_objects {
  description = "A map of CSV objects to upload to S3"
  type        = map(string)
}

variable python_objects {
  description = "A map of CSV objects to upload to S3"
  type        = map(string)
}

variable "databases" {
  description = "List of DBs to create with owners/passwords"
  type = list(object({
    name     : string
    user     : string
    password : string
  }))
  default = []
}

variable create_database {
  description = "Flag to create databases"
  type        = bool
}

# variable create_airflow {
#   description = "Flag to create Airflow resources"
#   type        = bool
# }