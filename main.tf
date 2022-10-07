#Inbound
resource "aws_route53_resolver_endpoint" "inbound_resolver" {
  name      = "inbound-resolver"
  direction = "INBOUND"
  security_group_ids = [
    data.aws_security_groups.selected.ids[0],

  ]
  dynamic "ip_address" {
    for_each = toset(data.aws_subnets.example.ids)
    iterator = subnet_id
    content {
      subnet_id = subnet_id.value
    }
  }


}

#Outbound
resource "aws_route53_resolver_endpoint" "outbound_resolver" {
  name      = "outbound-resolver"
  direction = "OUTBOUND"
  security_group_ids = [
    data.aws_security_groups.selected.ids[0]

  ]
  dynamic "ip_address" {
    for_each = toset(data.aws_subnets.example.ids)
    iterator = subnet_id
    content {
      subnet_id = subnet_id.value
    }
  }


}

resource "aws_route53_resolver_rule" "fwd" {
  count                = length(local.r53rules)
  domain_name          = lookup(element(local.r53rules, count.index), "domain_name", null)
  name                 = lookup(element(local.r53rules, count.index), "rule_name", null)
  rule_type            = var.rule_type
  resolver_endpoint_id = aws_route53_resolver_endpoint.outbound_resolver.id


  dynamic "target_ip" {
    for_each = lookup(element(local.r53rules, count.index), "ips", [])
    content {
      ip   = split(":", target_ip.value)[0]
      port = length(split(":", target_ip.value)) == 1 ? 53 : split(":", target_ip.value)[1]
    }
  }


}

resource "aws_route53_resolver_rule_association" "example" {
  count            = length(local.r53rules)
  resolver_rule_id = aws_route53_resolver_rule.fwd[count.index].id
  vpc_id           = var.vpc_id
}



locals {
  r53rules = [
    for rule in var.rules : {
      rule_name   = lookup(rule, "rule_name", "${lookup(rule, "domain_name")}-rule")
      domain_name = lookup(rule, "domain_name", null)
      ips         = lookup(rule, "ips", null)

    }
  ]
}
