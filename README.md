# Terraform DNS Cloudflare Module

Terraform for managing DNS zones hosted by Cloudflare

## Terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 5.3 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.13 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bryandady-com"></a> [bryandady-com](#module\_bryandady-com) | ./modules/zone | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | Cloudflare API token. | `string` | n/a | yes |
<!-- END_TF_DOCS -->
