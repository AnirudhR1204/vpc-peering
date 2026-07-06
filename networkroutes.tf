resource "aws_route" "route_a_to_b" {
  route_table_id            = aws_route_table.rt_a.id
  destination_cidr_block    = aws_vpc.vpc-b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "route_b_to_a" {
  route_table_id            = aws_route_table.rt_b.id
  destination_cidr_block    = aws_vpc.vpc-a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}