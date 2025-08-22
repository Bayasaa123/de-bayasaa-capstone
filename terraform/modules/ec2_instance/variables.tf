variable instance_type {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable subnet_id {
  description = "The ID of the subnet in which to launch the EC2 instance"
  type        = string
}

variable "project" {
  description = "The name of the project"
  type        = string
}

variable environment {
  description = "The environment for the EC2 instance (e.g., dev, staging, prod)"
  type        = string
}

variable vpc_id {
  description = "The ID of the VPC in which to create the security group"
  type        = string
}

variable airflow_logs_bucket {
  description = "The S3 bucket for Airflow logs"
  type        = string
  default     = ""
}

variable airflow_admin_user {
  description = "The Airflow admin user"
  type        = string
  default     = ""
}

variable airflow_admin_pass {
  description = "The Airflow admin password"
  type        = string
  default     = ""
}

variable security_group_ids {
  description = "List of additional security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable user_data {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable role_name {
  description = "The name of the IAM role to create"
  type        = string
}
