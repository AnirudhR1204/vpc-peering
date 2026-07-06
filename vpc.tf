#VPC-A (Requester)
resource "aws_vpc" "vpc-a" {
  cidr_block       = "10.1.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-A Requester"
  }
}

#VPC-B (Accepter)
resource "aws_vpc" "vpc-b" {
  cidr_block       = "10.2.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC-B Accepter"
  }
}
