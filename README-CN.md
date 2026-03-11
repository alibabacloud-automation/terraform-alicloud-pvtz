阿里云 Private Zone Terraform 模块

# terraform-alicloud-private-zone

[English](https://github.com/alibabacloud-automation/terraform-alicloud-private-zone/blob/main/README.md) | 简体中文

在阿里云上创建和管理 [Private Zone](https://www.aliyun.com/product/pvtz) 资源的 Terraform 模块。

本模块提供了一种简单灵活的方式来管理阿里云上的私有 DNS 区域和记录。支持创建 Private Zone、关联 VPC，以及通过统一接口管理多种 DNS 记录类型（A、CNAME、MX、TXT、SRV、PTR）。

## 使用方法

创建一个带有 DNS 记录和 VPC 关联的 Private Zone。

```terraform
module "private_zone" {
  source  = "alibabacloud-automation/private-zone/alicloud"

  domain_name = "example.internal"

  vpc_ids = [
    {
      vpc_id = "vpc-xxx"
    }
  ]

  dns_records = {
    web = {
      type  = "A"
      name  = "web"
      value = "10.0.1.10"
    }
  }

  tags = {
    Environment = "production"
  }
}
```

## 示例

* [基础示例](https://github.com/alibabacloud-automation/terraform-alicloud-private-zone/tree/main/examples/basic)
* [高级示例](https://github.com/alibabacloud-automation/terraform-alicloud-private-zone/tree/main/examples/advanced)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.200.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | 1.272.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_pvtz_zone.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/pvtz_zone) | resource |
| [alicloud_pvtz_zone_attachment.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/pvtz_zone_attachment) | resource |
| [alicloud_pvtz_zone_record.this](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/pvtz_zone_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_zone"></a> [create\_zone](#input\_create\_zone) | Whether to create a new Private Zone. | `bool` | `true` | no |
| <a name="input_dns_records"></a> [dns\_records](#input\_dns\_records) | A map of DNS records to create in the Private Zone. The key is a unique identifier for each record. | <pre>map(object({<br/>    type     = string<br/>    name     = string<br/>    value    = string<br/>    ttl      = optional(number, 60)<br/>    priority = optional(number, null)<br/>    status   = optional(string, "ENABLE")<br/>  }))</pre> | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name of the Private Zone. | `string` | n/a | yes |
| <a name="input_existing_zone_id"></a> [existing\_zone\_id](#input\_existing\_zone\_id) | The ID of an existing Private Zone to use when create\_zone is false. | `string` | `null` | no |
| <a name="input_remark"></a> [remark](#input\_remark) | The remark of the Private Zone. | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_ids"></a> [vpc\_ids](#input\_vpc\_ids) | A list of VPC IDs to attach to the Private Zone. | <pre>list(object({<br/>    vpc_id    = string<br/>    region_id = optional(string, null)<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_record_ids"></a> [dns\_record\_ids](#output\_dns\_record\_ids) | A map of DNS record IDs keyed by the record identifier. |
| <a name="output_vpc_attachment_id"></a> [vpc\_attachment\_id](#output\_vpc\_attachment\_id) | The ID of the VPC attachment. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ID of the Private Zone. |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | The domain name of the Private Zone. |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
