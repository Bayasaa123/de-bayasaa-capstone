variable "project" {
  description = "The name of the project"
  type        = string
}

variable environment {
  description = "The environment for the EC2 instance (e.g., dev, staging, prod)"
  type        = string
}

variable bucket_name {
  description = "Bucket name"
  type        = string
}