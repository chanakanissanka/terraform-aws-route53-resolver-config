## This repo creates R53 resolver inbound/outbound/rules for setting up private dns resollution from/to your VPC
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                    | Version |
| ------------------------------------------------------- | ------- |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0  |

## Providers

| Name                                              | Version |
| ------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                           | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_route53_resolver_endpoint.bar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint)                     | resource    |
| [aws_route53_resolver_endpoint.foo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint)                     | resource    |
| [aws_route53_resolver_rule.fwd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_rule)                             | resource    |
| [aws_route53_resolver_rule_association.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_rule_association) | resource    |
| [aws_security_group.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group)                                   | data source |
| [aws_subnets.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets)                                                  | data source |

## Inputs

| Name                                                                                      | Description | Type        | Default | Required |
| ----------------------------------------------------------------------------------------- | ----------- | ----------- | ------- | :------: |
| <a name="input_rules"></a> [rules](#input\_rules)                                         | n/a         | `list(any)` | `[]`    |    no    |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a         | `any`       | n/a     |   yes    |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)                                    | n/a         | `any`       | n/a     |   yes    |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

### Limitations 
RAM principal and VPN association is not available with this code. It will be something can easily retrofit to this approach and will rease that capability soon. 