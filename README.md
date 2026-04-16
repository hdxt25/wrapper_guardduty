# terraform-omnichannel-ise-aws-wrapper-guardduty

Terraform wrapper module for creating and managing AWS GuardDuty with standardized naming conventions and security configurations.

## Overview

This wrapper module simplifies the deployment of AWS GuardDuty by wrapping the upstream module with standardized configurations. It supports all GuardDuty features including threat detection, malware protection, Kubernetes/EKS/ECS runtime monitoring, S3 protection, RDS protection, Lambda protection, and findings publishing to S3.

## Version Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.9 |

## Module Source

| Name | Source | Version |
|------|--------|---------|
| <a name="module_guardduty_wrapper"></a> [guardduty\_wrapper](#module\_guardduty\_wrapper) | centraluhg.jfrog.io/glb-trf-terraform-rem__aws-ia/guardduty/aws | 0.1.0 |

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Resources

| Name | Type |
|------|------|
| [aws_guardduty_detector.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_guardduty_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_filter) | resource |
| [aws_guardduty_ipset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_ipset) | resource |
| [aws_guardduty_threatintelset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_threatintelset) | resource |
| [aws_guardduty_publishing_destination.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_publishing_destination) | resource |
| [aws_kms_key.guardduty_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.replica_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix_region"></a> [prefix\_region](#input\_prefix\_region) | Region prefix (e.g., use1, usw2) | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | Deployment environment: prd, dev, stg | `string` | n/a | yes |
| <a name="input_ask_id"></a> [ask\_id](#input\_ask\_id) | AIDE identifier for the owning CCaaS platform instance | `string` | n/a | yes |
| <a name="input_gl_code"></a> [gl\_code](#input\_gl\_code) | General Ledger code for financial tracking | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Product name (e.g., Amazon Connect, Databridge, CRS) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(any)` | n/a | yes |
| <a name="input_division"></a> [division](#input\_division) | Owning CCaaS division (Platform, Routing, Recording, WFM, Desktop) | `string` | `"Platform"` | no |
| <a name="input_portfolio"></a> [portfolio](#input\_portfolio) | Product portfolio (e.g., Amazon CCaaS, Routing Apps, 3PIntegration) | `string` | `"CCaaS"` | no |
| <a name="input_assignment_group"></a> [assignment\_group](#input\_assignment\_group) | ServiceNow assignment group or Splunk On-Call token | `string` | `"OmniConnect_Platform_Operations_Cloud"` | no |
| <a name="input_service_tier"></a> [service\_tier](#input\_service\_tier) | Priority tier of the service: p1, p2, p3 | `string` | `"p1"` | no |
| <a name="input_terraform_module_version"></a> [terraform\_module\_version](#input\_terraform\_module\_version) | Terraform Public module version | `string` | `"0.1.0"` | no |
| <a name="input_replica_region"></a> [replica\_region](#input\_replica\_region) | Region where S3 bucket data from Amazon GuardDuty will be replicated | `string` | `null` | no |
| <a name="input_detector_name"></a> [detector\_name](#input\_detector\_name) | Name of the GuardDuty detector. If not provided, defaults to gdt-{product}-{prefix_region}-{environment} | `string` | `null` | no |
| <a name="input_enable_guardduty"></a> [enable\_guardduty](#input\_enable\_guardduty) | Enable monitoring and feedback reporting | `bool` | `true` | no |
| <a name="input_enable_s3_protection"></a> [enable\_s3\_protection](#input\_enable\_s3\_protection) | Configure and enable S3 protection | `bool` | `true` | no |
| <a name="input_enable_rds_protection"></a> [enable\_rds\_protection](#input\_enable\_rds\_protection) | Configure and enable RDS protection | `bool` | `true` | no |
| <a name="input_enable_lambda_protection"></a> [enable\_lambda\_protection](#input\_enable\_lambda\_protection) | Configure and enable Lambda protection | `bool` | `true` | no |
| <a name="input_enable_malware_protection"></a> [enable\_malware\_protection](#input\_enable\_malware\_protection) | Configure and enable Malware Protection for EC2 instances | `bool` | `true` | no |
| <a name="input_enable_kubernetes_protection"></a> [enable\_kubernetes\_protection](#input\_enable\_kubernetes\_protection) | Configure and enable Kubernetes audit logs protection | `bool` | `true` | no |
| <a name="input_enable_eks_runtime_monitoring"></a> [enable\_eks\_runtime\_monitoring](#input\_enable\_eks\_runtime\_monitoring) | Enable Amazon EKS Runtime monitoring | `bool` | `true` | no |
| <a name="input_enable_ecs_runtime_monitoring"></a> [enable\_ecs\_runtime\_monitoring](#input\_enable\_ecs\_runtime\_monitoring) | Enable Amazon ECS Fargate Runtime monitoring | `bool` | `true` | no |
| <a name="input_enable_ec2_runtime_monitoring"></a> [enable\_ec2\_runtime\_monitoring](#input\_enable\_ec2\_runtime\_monitoring) | Enable Amazon EC2 Agent Management and Runtime monitoring | `bool` | `true` | no |
| <a name="input_manage_eks_addon"></a> [manage\_eks\_addon](#input\_manage\_eks\_addon) | Enable management of Amazon GuardDuty Agent EKS Addon | `bool` | `false` | no |
| <a name="input_manage_ecs_agent"></a> [manage\_ecs\_agent](#input\_manage\_ecs\_agent) | Enable management of Amazon GuardDuty Agent for ECS | `bool` | `false` | no |
| <a name="input_manage_ec2_agent"></a> [manage\_ec2\_agent](#input\_manage\_ec2\_agent) | Enable management of Amazon GuardDuty Agent for EC2 | `bool` | `false` | no |
| <a name="input_enable_snapshot_retention"></a> [enable\_snapshot\_retention](#input\_enable\_snapshot\_retention) | Enable EBS Snapshot retention for 30 days if Findings exist | `bool` | `false` | no |
| <a name="input_finding_publishing_frequency"></a> [finding\_publishing\_frequency](#input\_finding\_publishing\_frequency) | Frequency of notifications: FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS | `string` | `"FIFTEEN_MINUTES"` | no |
| <a name="input_filter_config"></a> [filter\_config](#input\_filter\_config) | AWS GuardDuty Filter configuration | `list(object)` | `null` | no |
| <a name="input_ipset_config"></a> [ipset\_config](#input\_ipset\_config) | AWS GuardDuty IPSet configuration | `list(object)` | `null` | no |
| <a name="input_threatintelset_config"></a> [threatintelset\_config](#input\_threatintelset\_config) | AWS GuardDuty ThreatIntelSet configuration | `list(object)` | `null` | no |
| <a name="input_publish_to_s3"></a> [publish\_to\_s3](#input\_publish\_to\_s3) | Export Amazon GuardDuty findings to S3 | `bool` | `false` | no |
| <a name="input_publishing_config"></a> [publishing\_config](#input\_publishing\_config) | Findings publishing configuration | `list(object)` | See variables.tf | no |
| <a name="input_guardduty_s3_bucket"></a> [guardduty\_s3\_bucket](#input\_guardduty\_s3\_bucket) | Name of the S3 Bucket for GuardDuty | `string` | `null` | no |
| <a name="input_guardduty_bucket_acl"></a> [guardduty\_bucket\_acl](#input\_guardduty\_bucket\_acl) | Canned ACL to apply to the bucket | `string` | `null` | no |
| <a name="input_malware_resource_protection"></a> [malware\_resource\_protection](#input\_malware\_resource\_protection) | List of resources to be scanned by GuardDuty Malware Protection | `list(string)` | `[]` | no |
| <a name="input_create_malware_protection_role"></a> [create\_malware\_protection\_role](#input\_create\_malware\_protection\_role) | Create Service-linked Role for GuardDuty Malware Protection | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_guardduty_detector"></a> [guardduty\_detector](#output\_guardduty\_detector) | AWS GuardDuty Detector |
| <a name="output_guardduty_filter"></a> [guardduty\_filter](#output\_guardduty\_filter) | AWS GuardDuty Findings Filters definition |
| <a name="output_guardduty_ipset"></a> [guardduty\_ipset](#output\_guardduty\_ipset) | AWS GuardDuty trusted IPSet configuration |
| <a name="output_guardduty_threatintelset"></a> [guardduty\_threatintelset](#output\_guardduty\_threatintelset) | AWS GuardDuty known ThreatIntelSet configuration |
| <a name="output_guardduty_publishing"></a> [guardduty\_publishing](#output\_guardduty\_publishing) | AWS GuardDuty Publishing destination to export findings |
| <a name="output_guardduty_s3_bucket"></a> [guardduty\_s3\_bucket](#output\_guardduty\_s3\_bucket) | Amazon S3 Bucket created for AWS GuardDuty |
| <a name="output_guardduty_replica_bucket"></a> [guardduty\_replica\_bucket](#output\_guardduty\_replica\_bucket) | Amazon S3 Replica Bucket created for AWS GuardDuty |
| <a name="output_guardduty_log_bucket"></a> [guardduty\_log\_bucket](#output\_guardduty\_log\_bucket) | Amazon S3 Log Bucket created for AWS GuardDuty |
| <a name="output_guardduty_kms_key"></a> [guardduty\_kms\_key](#output\_guardduty\_kms\_key) | Amazon KMS Key for AWS GuardDuty's S3 Bucket encryption |
| <a name="output_guardduty_kms_replica_key"></a> [guardduty\_kms\_replica\_key](#output\_guardduty\_kms\_replica\_key) | Amazon KMS Key for AWS GuardDuty's S3 Replica Bucket encryption |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Support

For issues, questions, or contributions, please contact the Omnichannel ISE team.

