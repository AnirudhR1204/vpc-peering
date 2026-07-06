resource "aws_route_table" "rt_a" {
  vpc_id = aws_vpc.vpc-a.id
  tags = {
    Name = "RouteTable-A"
  }
}

resource "aws_route_table_association" "rta-a" {
  subnet_id      = aws_subnet.subnet-a.id
  route_table_id = aws_route_table.rt_a.id
  }

resource "aws_route_table" "rt_b" {
  vpc_id = aws_vpc.vpc-b.id
  tags = {
    Name = "RouteTable-B"
  }
}
resource "aws_route_table_association" "rta-b" {
  subnet_id      = aws_subnet.subnet-b.id
  route_table_id = aws_route_table.rt_b.id
  }
