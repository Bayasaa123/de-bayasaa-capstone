
resource "aws_security_group" "batch" {
    name = "${local.name}-sg"
    description = "Batch security group"
    vpc_id = var.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1" # Allow all traffic
        cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
    }

    tags = {
        name = "${local.name}-sg"
    }
}