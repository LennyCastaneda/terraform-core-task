##################################################################################
# NONPROD VPC
##################################################################################

resource "aws_vpc" "self" {
	# TODO: Need to create CIDR block dynamically
	cidr_block = "10.30.0.0/16" 
	enable_dns_support    = true
	enable_dns_hostnames  = true

	tags = {
		Name = join("-", [var.environment, "US-West-2"])
	}
}

##################################################################################
#  NAT GATEWAY
##################################################################################

# NONPROD-NAT
	resource "aws_nat_gateway" "nat" {
			allocation_id = aws_eip.nat.id}
			subnet_id     = aws_subnet.public_nonprod_2a.id

			tags = {
					Name = join("-", [var.environment, "NAT"])
			}
	}

##################################################################################
#   ELASTIC IP
##################################################################################

    resource "aws_eip" "nat" {
    vpc = true

    associate_with_private_ip = "10.30.60.12"
    depends_on                = [aws_nat_gateway.nonprod_nat]
    }

##################################################################################
#  ROUTE TABLES & ASSOCIATIONS
##################################################################################

# ROUTE TABLE
	resource "aws_route_table" "self" {
		vpc_id = aws_vpc.self.id

	# NAT GATEWAY ROUTE
		route {
			cidr_block = "10.30.0.0/16"
			nat_gateway_id = aws_nat_gateway.nonprod_nat.id 						
		}

		tags = {
			Name = join("-", [var.environment, "RTB"])
		}
  }

# PUBLIC SUBNET ASSOCIATIONS
	resource "aws_route_table_association" "public_nonprod_2a" {
		subnet_id = "${aws_subnet.public_nonprod_2a.id}"
		route_table_id = "${aws_route_table.self.id}"
	}

	resource "aws_route_table_association" "public_nonprod_2b" {
		subnet_id = "${aws_subnet.public_nonprod_2b.id}"
		route_table_id = "${aws_route_table.self.id}"
	}

	resource "aws_route_table_association" "public_nonprod_2c" {
		subnet_id = "${aws_subnet.public_nonprod_2c.id}"
		route_table_id = "${aws_route_table.self.id}"
	}


# PUBLIC SUBNET ASSOCIATIONS
	resource "aws_route_table_association" "private_nonprod_2a" {
		subnet_id = "${aws_subnet.private_nonprod_2a.id}"
		route_table_id = "${aws_route_table.self.id}"
	}

	resource "aws_route_table_association" "private_nonprod_2b" {
		subnet_id = "${aws_subnet.private_nonprod_2b.id}"
		route_table_id = "${aws_route_table.self.id}"
	}

	resource "aws_route_table_association" "private_nonprod_2c" {
		subnet_id = "${aws_subnet.private_nonprod_2c.id}"
		route_table_id = "${aws_route_table.self.id}"
	}

# ROUTE PROPAGRATION
	resource "aws_vpn_gateway_route_propagation" "route_propagation" {
		vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
		route_table_id = aws_route_table.self.id
	}

# VPN GATEWAY
	resource "aws_vpn_gateway" "vpn_gw" {
        vpc_id = aws_vpc.self.id

        tags = {
            Name = join("-", [var.environment, "VPN-Gateway"])
        }
    }