##################################################################################
#  EC2
##################################################################################

resource "aws_instance" "ec2" {
    count                   = var.count
    ami                     = var.ami_id
    instance_type           = var.instance_type
    subnet_id               = var.subnet_id
    availability_zone       = var.availability_zone
    vpc_security_group_ids  = var.vpc_security_group_ids
    disable_api_termination = true

    tags = "${merge(
        local.common_tags,
        map(
            "Name", var.name,
            "Owner", var.owner,
            "Environment", var.environment
        )
    )}"
}