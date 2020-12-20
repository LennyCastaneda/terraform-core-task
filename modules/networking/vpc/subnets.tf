##################################################################################
# NONPROD SUBNETS
##################################################################################

# Public 
    resource "aws_subnet" "public_nonprod_2a" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.31.0/24"
        availability_zone   = "us-west-2a"

        tags = {
            Name = "PUBLIC-NON-PROD-2a"
        }
    }

    resource "aws_subnet" "public_nonprod_2b" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.32.0/24" 
        availability_zone   = "us-west-2b"

        tags = {
            Name = "PUBLIC-NON-PROD-2b"
        }
    }

    resource "aws_subnet" "public_nonprod_2c" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.33.0/24"
        availability_zone   = "us-west-2c"

        tags = {
            Name = "PUBLIC-NON-PROD-2c"
        }
    }

# PRIVATE 
    resource "aws_subnet" "private_nonprod_2a" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.60.0/24"
        availability_zone   = "us-west-2a"

        tags = {
            Name = "PRIVATE-NON-PROD-2a"
        }
    }

    resource "aws_subnet" "private_nonprod_2b" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.61.0/24" 
        availability_zone   = "us-west-2b"

        tags = {
            Name = "PRIVATE-NON-PROD-2b"
        }
    }

    resource "aws_subnet" "private_nonprod_2c" {
        vpc_id              = aws_vpc.nonoprod.id
        cidr_block          = "10.30.62.0/24"
        availability_zone   = "us-west-2c"

        tags = {
            Name = "PRIVATE-NON-PROD-2c"
        }
    }