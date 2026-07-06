resource "aws_subnet" "subnet-a" {
  vpc_id     = aws_vpc.vpc-a.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-1a"
   tags = {
    Name = "Subnet-a"
  }
}

resource "aws_subnet" "subnet-b" {
  vpc_id     = aws_vpc.vpc-b.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "us-east-1b"
   tags = {
    Name = "Subnet-b"
  }
}
