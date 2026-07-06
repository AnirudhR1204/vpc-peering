resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.vpc-a.id
  peer_vpc_id   = aws_vpc.vpc-b.id
  auto_accept = true

}