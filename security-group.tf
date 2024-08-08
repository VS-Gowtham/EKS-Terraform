resource "aws_security_group" "demo-grp" {
    name_prefix = "demo-security-groups"
    vpc_id = module.vpc.vpc_id 
}

resource "aws_security_group_rule" "demo-rules-ingress" {
    description = "Allows all inbound-traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.demo-grp.id
    type = "ingress"
    cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

resource "aws_security_group_rule" "demo-rules-egress" {
    description = "Allows all outbound-traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.demo-grp.id
    type = "egress"
    cidr_blocks = ["0.0.0.0/0"]
}
