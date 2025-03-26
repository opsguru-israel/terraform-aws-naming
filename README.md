# terraform-aws-naming

This Terraform module is designed to generate consistent and unique names for AWS resources, helping maintain a standardized and uniform naming convention across your infrastructure. By using a combination of customizable parameters and automation, it ensures that all resource names follow predefined patterns, reducing the risk of naming conflicts and improving organizational clarity.

## Compatibility

This module has been tested with Terraform 1.9.5.

## Development

This module has a generation of output for any of the resources the AWS provider supports. Therefore, this is merely the iteration of the same pattern. The [Cookiecutter](https://cookiecutter.readthedocs.io/en/stable/README.html) templating tool has been used to make the development and support more manageable.

> [!IMPORTANT]
> Make sure the Cookiecutter is [installed](https://cookiecutter.readthedocs.io/en/stable/README.html#installation) before going further.

If one needs to update the module, the list of the files corresponding to the module part follows:
- [main.tf](./{{cookiecutter.__folder_name}}/{{cookiecutter.__main_name}}.tf)
- [outputs.tf](./{{cookiecutter.__folder_name}}/{{cookiecutter.__outputs_name}}.tf)
- [provider.tf](./{{cookiecutter.__folder_name}}/{{cookiecutter.__provider_name}}.tf)
- [variables.tf](./variables.tf)

After making changes one should run the generation of resulting module files from source templates with following command:
```bash
pipx run cookiecutter . --no-input -f -s
```

## Testing

An implicit tftest script is defined in `tests/test_readme_example.py`. This test uses the usage example to plan and apply the module when running the assertion.
The test framework is [tftest](https://pypi.org/project/tftest/)/[pytest](https://docs.pytest.org/en/7.4.x/) and is being run by the CI pipeline in [opsguru-israel/terraform-aws-naming](https://github.com/opsguru-israel/terraform-aws-naming).

## Usage

Choose the elements you want to have in the name of the resource from the following list, and set them as a parameters to the module:
- prefix
- environment
- resource
- location
- description
- suffix<sup>*</sup>

> <sup>*</sup> Suffix is the list of parameters, hence one could provide needed number of inputs to add additional information.

Example with the `prefix`, `environment`, `location`, and `description` parameters:

```hcl
module "naming" {
  source      = "git@github.com:opsguru-israel/terraform-aws-naming?ref=main"
  prefix      = "clientname"
  environment = "dev"
  location    = "eu-west-1"
  description = "webassets"
}
```

That will generate the outputs:

```terraform
name = "clientname-dev-use2-webassets"
name_unique = "clientname-dev-use2-webassets-7b4z"
tags = {
  "Description" = "webassets"
  "Environment" = "dev"
  "Location" = "eu-west-1"
  "ManagedBy" = "terraform"
}
```
This you can use with the resource you're managing, for example:

```terraform
resource "aws_s3_bucket" "portal" {
  bucket = module.naming.name
  tags   = module.naming.tags
}
```
For the resources that require unique names and it's already occupied, you can use `name_unique` output, for example:

```terraform
resource "aws_s3_bucket" "portal" {
  bucket = module.naming.name_unique
  tags   = module.naming.tags
}
```

You can add resource type into the name and resource type and resource category into the tags for any of the resources the AWS provider supports. For that just remove the `aws_` prefix of the resource you're managing, put it to `resource_types` property list of the module and use this name for the `name` and `tags` property of module output.
Here is the example for `aws_s3_bucket` resource:

```terraform
data "aws_region" "current" {}

module "naming" {
  source         = "git@github.com:opsguru-israel/terraform-aws-naming//terraform-aws-naming?ref=main"
  prefix         = "clientname"
  environment    = "dev"
  location       = data.aws_region.current.name
  suffix         = ["portal", "web"]
  resource_types = ["s3_bucket"]
}

resource "aws_s3_bucket" "portal" {
  bucket = module.naming.s3_bucket.name
  tags   = module.naming.s3_bucket.tags
}
```
That will generate the outputs:

```terraform
name = "clientname-dev-s3bucket-use2-portal-web"
tags = {
  "Category" = "s3 (simple storage)"
  "Environment" = "dev"
  "Location" = "eu-west-1"
  "ManagedBy" = "terraform"
  "Name" = "clientname-dev-s3bucket-use2-portal-web"
  "ResourceType" = "s3_bucket"
}
```

Other advanced usages will be explained in the [Advanced usage](#advanced-usage) part of this docs.

## Features

1. Customizable Naming Patterns and Tags
    - Allows users to define prefixes, suffixes, and separators to align with organizational standards.
    - Supports region-specific and environment-specific customizations with predictable outputs.

2. Uniqueness Across Resources
    - Generates unique names using random strings, based on user-defined or generated seed. Prevents duplication of resource names across deployments.

3. Shortened Region Codes
    - Automatically converts full AWS region names (e.g., us-east-1) into short codes (e.g., use1) for concise naming, saving limited name length.

4. Environment and Application Awareness
    - Includes options to append environment identifiers (e.g., dev, prod) or application names to the generated resource names.

5. Support for Dynamic Inputs
    - Dynamically generates names based on input variables, making the module reusable across multiple projects or environments.

6. Compliance with AWS Resource Name Limits (TBD)
    - Ensures that generated names adhere to AWS resource name length and character restrictions. (Currently, this functionality is limited to the name length defined for the module instance)

7. Easy to Use
    - Simple input-output structure for seamless integration with existing Terraform configurations.
    - Provides clear documentation and examples for quick adoption.

This module use following naming scheme by default:
`<prefix>-<environment>-<resource>-<location>-<description>-<suffix>`

## Advanced usage

1. Using your own order and parameters:
    - Set the element order to `location`, `environment` and using only those elements for the name generation
    - Set custom location value
    - Set custom delimiter
    - Set additional tags

    ```terraform
    module "naming" {
      source         = "git@github.com:opsguru-israel/terraform-aws-naming?ref=main"
      environment    = "dev"
      location       = "us-west-1d"
      resource_types = ["s3_bucket"]
      suffix         = ["portal", "web"]
      delimiter      = "."
      name_element_order = [
        "location",
        "environment"
      ]
      additional_tags = { ResourceOwner = "Advertising" }
    }

    output "debug" {
      value = module.naming.s3_bucket
    }
    ```

    Outputs:

    ```terraform
    debug = {
      "name" = "us-west-1d.dev.portal.web"
      "name_unique" = "us-west-1d.dev.portal.web.7b4z"
      "tags" = {
        "Category" = "s3 (simple storage)"
        "Environment" = "dev"
        "Location" = "us-west-1d"
        "ManagedBy" = "terraform"
        "Name" = "us-west-1d.dev.portal.web"
        "ResourceOwner" = "advertising"
        "ResourceType" = "s3_bucket"
      }
    }
    ```

2. Put the dynamic part into statically generated outputs:
    - Prepend name value with the string `webassets`:

    ```terraform
    output "debug" {
      value = format("webassets${module.naming.delimiter}%s", module.naming.s3_bucket.name)
    }
    ```
    - Do the same for the `Name` tag:

    ```terraform
    output "debug" {
      value = merge(
        module.naming.s3_bucket.tags,
        {Name = format("webassets${module.naming.delimiter}%s", module.naming.s3_bucket.tags["Name"])}
      )
    }
    ```
    - Add the string `webassets` into the name ordered as second element:

    ```terraform
    output "debug" {
      value = join(module.naming.delimiter, [
        element(split(module.naming.delimiter, module.naming.s3_bucket.name), 0), "webassets", join(module.naming.delimiter, slice(split(module.naming.delimiter, module.naming.s3_bucket.name), 2, length(split(module.naming.delimiter, module.naming.s3_bucket.name))))
      ])
    }
    ```
    - Do the same for the `Name` tag:

    ```terraform
    output "debug" {
      value = merge(
        module.naming.s3_bucket.tags,
        {Name = join(module.naming.delimiter, [
          element(split(module.naming.delimiter, module.naming.s3_bucket.tags["Name"]), 0), "webassets", join(module.naming.delimiter, slice(split(module.naming.delimiter, module.naming.s3_bucket.tags["Name"]), 2, length(split(module.naming.delimiter, module.naming.s3_bucket.tags["Name"]))))
        ])}
      )
    }
    ```

## TODO

1. Implement a pre-validation mechanism to verify AWS resource naming restrictions for each resource type. This should ensure that names conform to length, character set, and pattern rules, preventing resource creation failures.

    - Provide clear error messages or warnings to guide users on how to correct non-compliant names.

    - Integrate unit tests to ensure that the validation logic works correctly for each resource type.

2. Develop a standardized mapping of resource types to their abbreviated names. This list should account for naming length limitations and support consistent naming conventions across the module.

    - Ensure that the abbreviations are both meaningful and unique to avoid ambiguity.

    - Allow for customization or overrides in the mapping, accommodating special cases or evolving naming standards.

    - Document the abbreviation rules clearly so that team members or users understand how names are constructed.

3. Tag management enhancements.

    - Validate that tags comply with AWS tagging policies.

    - Support tagging hierarchies or inheritance if required by infrastructure setup.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.7.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/3.7.1/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags (e.g. `{'ResourceOwner': 'XYZ'}`). | `map(string)` | `{}` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between name elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `"-"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description name element + tag(label). Additional description. | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name element + tag(label). | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Location name element + tag(label).<br>If provided in conventional form e. g. 'us-west-1' the name will contain short form, tag will contain full one (check `short_location` variable).<br>If provided in custom form e. g. 'us-west-1d' or 'uw1d' will be used as is.<br>If provided in custom form and a `delimiter` value is present in, it will be stripped in the name generation to save parsing ability. | `string` | `""` | no |
| <a name="input_max_length"></a> [max\_length](#input\_max\_length) | Maximum length allowed for the name generation. | `number` | `63` | no |
| <a name="input_name_element_order"></a> [name\_element\_order](#input\_name\_element\_order) | The order in which the elements appear in the name.<br>The `prefix` and `suffix` elements are always putted to respectfull places if provided.<br>You can omit any of the elements. Empty values won't be rendered. | `list(string)` | <pre>[<br>  "environment",<br>  "resource",<br>  "location",<br>  "description"<br>]</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to be used in name generation. | `string` | `""` | no |
| <a name="input_resource_types"></a> [resource\_types](#input\_resource\_types) | Set of resource types to generate names and tags in output.<br>If resource type provided (any resource from `terraform_aws` provider without the `aws_` prefix), specific output for this resource will be generated with resource type in the name and category in tags.<br>Default is `[]` to generate only general output. | `set(string)` | `[]` | no |
| <a name="input_short_location"></a> [short\_location](#input\_short\_location) | Use short version of the region as the name element e.g. 'usw2' for 'us-west-1'. | `bool` | `true` | no |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | Suffix to be used in name generation. | `list(string)` | `[]` | no |
| <a name="input_tag_key_case"></a> [tag\_key\_case](#input\_tag\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `"title"` | no |
| <a name="input_tag_value_case"></a> [tag\_value\_case](#input\_tag\_value\_case) | Controls the letter case of elements (labels) as included in `name`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `"lower"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Set of tags (labels) to include in the `tags` output.<br>Default is to include all tags.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags. | `set(string)` | <pre>[<br>  "Name",<br>  "Environment",<br>  "ResourceType",<br>  "Category",<br>  "Location",<br>  "Description",<br>  "ManagedBy"<br>]</pre> | no |
| <a name="input_unique_include_numbers"></a> [unique\_include\_numbers](#input\_unique\_include\_numbers) | To include numbers in the unique generation. | `bool` | `true` | no |
| <a name="input_unique_length"></a> [unique\_length](#input\_unique\_length) | Max length of the uniqueness suffix to be added. | `number` | `4` | no |
| <a name="input_unique_seed"></a> [unique\_seed](#input\_unique\_seed) | Custom value for the random characters to be used. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accessanalyzer_analyzer"></a> [accessanalyzer\_analyzer](#output\_accessanalyzer\_analyzer) | IAM Access Analyzer |
| <a name="output_accessanalyzer_archive_rule"></a> [accessanalyzer\_archive\_rule](#output\_accessanalyzer\_archive\_rule) | IAM Access Analyzer |
| <a name="output_account_alternate_contact"></a> [account\_alternate\_contact](#output\_account\_alternate\_contact) | Account Management |
| <a name="output_account_primary_contact"></a> [account\_primary\_contact](#output\_account\_primary\_contact) | Account Management |
| <a name="output_account_region"></a> [account\_region](#output\_account\_region) | Account Management |
| <a name="output_acm_certificate"></a> [acm\_certificate](#output\_acm\_certificate) | Certificate Manager |
| <a name="output_acm_certificate_validation"></a> [acm\_certificate\_validation](#output\_acm\_certificate\_validation) | Certificate Manager |
| <a name="output_acmpca_certificate"></a> [acmpca\_certificate](#output\_acmpca\_certificate) | Certificate Manager Private Certificate Authority |
| <a name="output_acmpca_certificate_authority"></a> [acmpca\_certificate\_authority](#output\_acmpca\_certificate\_authority) | Certificate Manager Private Certificate Authority |
| <a name="output_acmpca_certificate_authority_certificate"></a> [acmpca\_certificate\_authority\_certificate](#output\_acmpca\_certificate\_authority\_certificate) | Certificate Manager Private Certificate Authority |
| <a name="output_acmpca_permission"></a> [acmpca\_permission](#output\_acmpca\_permission) | Certificate Manager Private Certificate Authority |
| <a name="output_acmpca_policy"></a> [acmpca\_policy](#output\_acmpca\_policy) | Certificate Manager Private Certificate Authority |
| <a name="output_ami"></a> [ami](#output\_ami) | Elastic Compute Cloud |
| <a name="output_ami_copy"></a> [ami\_copy](#output\_ami\_copy) | Elastic Compute Cloud |
| <a name="output_ami_from_instance"></a> [ami\_from\_instance](#output\_ami\_from\_instance) | Elastic Compute Cloud |
| <a name="output_ami_launch_permission"></a> [ami\_launch\_permission](#output\_ami\_launch\_permission) | Elastic Compute Cloud |
| <a name="output_amplify_app"></a> [amplify\_app](#output\_amplify\_app) | Amplify |
| <a name="output_amplify_backend_environment"></a> [amplify\_backend\_environment](#output\_amplify\_backend\_environment) | Amplify |
| <a name="output_amplify_branch"></a> [amplify\_branch](#output\_amplify\_branch) | Amplify |
| <a name="output_amplify_domain_association"></a> [amplify\_domain\_association](#output\_amplify\_domain\_association) | Amplify |
| <a name="output_amplify_webhook"></a> [amplify\_webhook](#output\_amplify\_webhook) | Amplify |
| <a name="output_api_gateway_account"></a> [api\_gateway\_account](#output\_api\_gateway\_account) | API Gateway |
| <a name="output_api_gateway_api_key"></a> [api\_gateway\_api\_key](#output\_api\_gateway\_api\_key) | API Gateway |
| <a name="output_api_gateway_authorizer"></a> [api\_gateway\_authorizer](#output\_api\_gateway\_authorizer) | API Gateway |
| <a name="output_api_gateway_base_path_mapping"></a> [api\_gateway\_base\_path\_mapping](#output\_api\_gateway\_base\_path\_mapping) | API Gateway |
| <a name="output_api_gateway_client_certificate"></a> [api\_gateway\_client\_certificate](#output\_api\_gateway\_client\_certificate) | API Gateway |
| <a name="output_api_gateway_deployment"></a> [api\_gateway\_deployment](#output\_api\_gateway\_deployment) | API Gateway |
| <a name="output_api_gateway_documentation_part"></a> [api\_gateway\_documentation\_part](#output\_api\_gateway\_documentation\_part) | API Gateway |
| <a name="output_api_gateway_documentation_version"></a> [api\_gateway\_documentation\_version](#output\_api\_gateway\_documentation\_version) | API Gateway |
| <a name="output_api_gateway_domain_name"></a> [api\_gateway\_domain\_name](#output\_api\_gateway\_domain\_name) | API Gateway |
| <a name="output_api_gateway_domain_name_access_association"></a> [api\_gateway\_domain\_name\_access\_association](#output\_api\_gateway\_domain\_name\_access\_association) | API Gateway |
| <a name="output_api_gateway_gateway_response"></a> [api\_gateway\_gateway\_response](#output\_api\_gateway\_gateway\_response) | API Gateway |
| <a name="output_api_gateway_integration"></a> [api\_gateway\_integration](#output\_api\_gateway\_integration) | API Gateway |
| <a name="output_api_gateway_integration_response"></a> [api\_gateway\_integration\_response](#output\_api\_gateway\_integration\_response) | API Gateway |
| <a name="output_api_gateway_method"></a> [api\_gateway\_method](#output\_api\_gateway\_method) | API Gateway |
| <a name="output_api_gateway_method_response"></a> [api\_gateway\_method\_response](#output\_api\_gateway\_method\_response) | API Gateway |
| <a name="output_api_gateway_method_settings"></a> [api\_gateway\_method\_settings](#output\_api\_gateway\_method\_settings) | API Gateway |
| <a name="output_api_gateway_model"></a> [api\_gateway\_model](#output\_api\_gateway\_model) | API Gateway |
| <a name="output_api_gateway_request_validator"></a> [api\_gateway\_request\_validator](#output\_api\_gateway\_request\_validator) | API Gateway |
| <a name="output_api_gateway_resource"></a> [api\_gateway\_resource](#output\_api\_gateway\_resource) | API Gateway |
| <a name="output_api_gateway_rest_api"></a> [api\_gateway\_rest\_api](#output\_api\_gateway\_rest\_api) | API Gateway |
| <a name="output_api_gateway_rest_api_policy"></a> [api\_gateway\_rest\_api\_policy](#output\_api\_gateway\_rest\_api\_policy) | API Gateway |
| <a name="output_api_gateway_stage"></a> [api\_gateway\_stage](#output\_api\_gateway\_stage) | API Gateway |
| <a name="output_api_gateway_usage_plan"></a> [api\_gateway\_usage\_plan](#output\_api\_gateway\_usage\_plan) | API Gateway |
| <a name="output_api_gateway_usage_plan_key"></a> [api\_gateway\_usage\_plan\_key](#output\_api\_gateway\_usage\_plan\_key) | API Gateway |
| <a name="output_api_gateway_vpc_link"></a> [api\_gateway\_vpc\_link](#output\_api\_gateway\_vpc\_link) | API Gateway |
| <a name="output_apigatewayv2_api"></a> [apigatewayv2\_api](#output\_apigatewayv2\_api) | API Gateway V2 |
| <a name="output_apigatewayv2_api_mapping"></a> [apigatewayv2\_api\_mapping](#output\_apigatewayv2\_api\_mapping) | API Gateway V2 |
| <a name="output_apigatewayv2_authorizer"></a> [apigatewayv2\_authorizer](#output\_apigatewayv2\_authorizer) | API Gateway V2 |
| <a name="output_apigatewayv2_deployment"></a> [apigatewayv2\_deployment](#output\_apigatewayv2\_deployment) | API Gateway V2 |
| <a name="output_apigatewayv2_domain_name"></a> [apigatewayv2\_domain\_name](#output\_apigatewayv2\_domain\_name) | API Gateway V2 |
| <a name="output_apigatewayv2_integration"></a> [apigatewayv2\_integration](#output\_apigatewayv2\_integration) | API Gateway V2 |
| <a name="output_apigatewayv2_integration_response"></a> [apigatewayv2\_integration\_response](#output\_apigatewayv2\_integration\_response) | API Gateway V2 |
| <a name="output_apigatewayv2_model"></a> [apigatewayv2\_model](#output\_apigatewayv2\_model) | API Gateway V2 |
| <a name="output_apigatewayv2_route"></a> [apigatewayv2\_route](#output\_apigatewayv2\_route) | API Gateway V2 |
| <a name="output_apigatewayv2_route_response"></a> [apigatewayv2\_route\_response](#output\_apigatewayv2\_route\_response) | API Gateway V2 |
| <a name="output_apigatewayv2_stage"></a> [apigatewayv2\_stage](#output\_apigatewayv2\_stage) | API Gateway V2 |
| <a name="output_apigatewayv2_vpc_link"></a> [apigatewayv2\_vpc\_link](#output\_apigatewayv2\_vpc\_link) | API Gateway V2 |
| <a name="output_app_cookie_stickiness_policy"></a> [app\_cookie\_stickiness\_policy](#output\_app\_cookie\_stickiness\_policy) | ELB Classic |
| <a name="output_appautoscaling_policy"></a> [appautoscaling\_policy](#output\_appautoscaling\_policy) | Application Auto Scaling |
| <a name="output_appautoscaling_scheduled_action"></a> [appautoscaling\_scheduled\_action](#output\_appautoscaling\_scheduled\_action) | Application Auto Scaling |
| <a name="output_appautoscaling_target"></a> [appautoscaling\_target](#output\_appautoscaling\_target) | Application Auto Scaling |
| <a name="output_appconfig_application"></a> [appconfig\_application](#output\_appconfig\_application) | AppConfig |
| <a name="output_appconfig_configuration_profile"></a> [appconfig\_configuration\_profile](#output\_appconfig\_configuration\_profile) | AppConfig |
| <a name="output_appconfig_deployment"></a> [appconfig\_deployment](#output\_appconfig\_deployment) | AppConfig |
| <a name="output_appconfig_deployment_strategy"></a> [appconfig\_deployment\_strategy](#output\_appconfig\_deployment\_strategy) | AppConfig |
| <a name="output_appconfig_environment"></a> [appconfig\_environment](#output\_appconfig\_environment) | AppConfig |
| <a name="output_appconfig_extension"></a> [appconfig\_extension](#output\_appconfig\_extension) | AppConfig |
| <a name="output_appconfig_extension_association"></a> [appconfig\_extension\_association](#output\_appconfig\_extension\_association) | AppConfig |
| <a name="output_appconfig_hosted_configuration_version"></a> [appconfig\_hosted\_configuration\_version](#output\_appconfig\_hosted\_configuration\_version) | AppConfig |
| <a name="output_appfabric_app_authorization"></a> [appfabric\_app\_authorization](#output\_appfabric\_app\_authorization) | AppFabric |
| <a name="output_appfabric_app_authorization_connection"></a> [appfabric\_app\_authorization\_connection](#output\_appfabric\_app\_authorization\_connection) | AppFabric |
| <a name="output_appfabric_app_bundle"></a> [appfabric\_app\_bundle](#output\_appfabric\_app\_bundle) | AppFabric |
| <a name="output_appfabric_ingestion"></a> [appfabric\_ingestion](#output\_appfabric\_ingestion) | AppFabric |
| <a name="output_appfabric_ingestion_destination"></a> [appfabric\_ingestion\_destination](#output\_appfabric\_ingestion\_destination) | AppFabric |
| <a name="output_appflow_connector_profile"></a> [appflow\_connector\_profile](#output\_appflow\_connector\_profile) | AppFlow |
| <a name="output_appflow_flow"></a> [appflow\_flow](#output\_appflow\_flow) | AppFlow |
| <a name="output_appintegrations_data_integration"></a> [appintegrations\_data\_integration](#output\_appintegrations\_data\_integration) | AppIntegrations |
| <a name="output_appintegrations_event_integration"></a> [appintegrations\_event\_integration](#output\_appintegrations\_event\_integration) | AppIntegrations |
| <a name="output_applicationinsights_application"></a> [applicationinsights\_application](#output\_applicationinsights\_application) | CloudWatch Application Insights |
| <a name="output_appmesh_gateway_route"></a> [appmesh\_gateway\_route](#output\_appmesh\_gateway\_route) | App Mesh |
| <a name="output_appmesh_mesh"></a> [appmesh\_mesh](#output\_appmesh\_mesh) | App Mesh |
| <a name="output_appmesh_route"></a> [appmesh\_route](#output\_appmesh\_route) | App Mesh |
| <a name="output_appmesh_virtual_gateway"></a> [appmesh\_virtual\_gateway](#output\_appmesh\_virtual\_gateway) | App Mesh |
| <a name="output_appmesh_virtual_node"></a> [appmesh\_virtual\_node](#output\_appmesh\_virtual\_node) | App Mesh |
| <a name="output_appmesh_virtual_router"></a> [appmesh\_virtual\_router](#output\_appmesh\_virtual\_router) | App Mesh |
| <a name="output_appmesh_virtual_service"></a> [appmesh\_virtual\_service](#output\_appmesh\_virtual\_service) | App Mesh |
| <a name="output_apprunner_auto_scaling_configuration_version"></a> [apprunner\_auto\_scaling\_configuration\_version](#output\_apprunner\_auto\_scaling\_configuration\_version) | App Runner |
| <a name="output_apprunner_connection"></a> [apprunner\_connection](#output\_apprunner\_connection) | App Runner |
| <a name="output_apprunner_custom_domain_association"></a> [apprunner\_custom\_domain\_association](#output\_apprunner\_custom\_domain\_association) | App Runner |
| <a name="output_apprunner_default_auto_scaling_configuration_version"></a> [apprunner\_default\_auto\_scaling\_configuration\_version](#output\_apprunner\_default\_auto\_scaling\_configuration\_version) | App Runner |
| <a name="output_apprunner_deployment"></a> [apprunner\_deployment](#output\_apprunner\_deployment) | App Runner |
| <a name="output_apprunner_observability_configuration"></a> [apprunner\_observability\_configuration](#output\_apprunner\_observability\_configuration) | App Runner |
| <a name="output_apprunner_service"></a> [apprunner\_service](#output\_apprunner\_service) | App Runner |
| <a name="output_apprunner_vpc_connector"></a> [apprunner\_vpc\_connector](#output\_apprunner\_vpc\_connector) | App Runner |
| <a name="output_apprunner_vpc_ingress_connection"></a> [apprunner\_vpc\_ingress\_connection](#output\_apprunner\_vpc\_ingress\_connection) | App Runner |
| <a name="output_appstream_directory_config"></a> [appstream\_directory\_config](#output\_appstream\_directory\_config) | AppStream 2.0 |
| <a name="output_appstream_fleet"></a> [appstream\_fleet](#output\_appstream\_fleet) | AppStream 2.0 |
| <a name="output_appstream_fleet_stack_association"></a> [appstream\_fleet\_stack\_association](#output\_appstream\_fleet\_stack\_association) | AppStream 2.0 |
| <a name="output_appstream_image_builder"></a> [appstream\_image\_builder](#output\_appstream\_image\_builder) | AppStream 2.0 |
| <a name="output_appstream_stack"></a> [appstream\_stack](#output\_appstream\_stack) | AppStream 2.0 |
| <a name="output_appstream_user"></a> [appstream\_user](#output\_appstream\_user) | AppStream 2.0 |
| <a name="output_appstream_user_stack_association"></a> [appstream\_user\_stack\_association](#output\_appstream\_user\_stack\_association) | AppStream 2.0 |
| <a name="output_appsync_api_cache"></a> [appsync\_api\_cache](#output\_appsync\_api\_cache) | AppSync |
| <a name="output_appsync_api_key"></a> [appsync\_api\_key](#output\_appsync\_api\_key) | AppSync |
| <a name="output_appsync_datasource"></a> [appsync\_datasource](#output\_appsync\_datasource) | AppSync |
| <a name="output_appsync_domain_name"></a> [appsync\_domain\_name](#output\_appsync\_domain\_name) | AppSync |
| <a name="output_appsync_domain_name_api_association"></a> [appsync\_domain\_name\_api\_association](#output\_appsync\_domain\_name\_api\_association) | AppSync |
| <a name="output_appsync_function"></a> [appsync\_function](#output\_appsync\_function) | AppSync |
| <a name="output_appsync_graphql_api"></a> [appsync\_graphql\_api](#output\_appsync\_graphql\_api) | AppSync |
| <a name="output_appsync_resolver"></a> [appsync\_resolver](#output\_appsync\_resolver) | AppSync |
| <a name="output_appsync_source_api_association"></a> [appsync\_source\_api\_association](#output\_appsync\_source\_api\_association) | AppSync |
| <a name="output_appsync_type"></a> [appsync\_type](#output\_appsync\_type) | AppSync |
| <a name="output_athena_data_catalog"></a> [athena\_data\_catalog](#output\_athena\_data\_catalog) | Athena |
| <a name="output_athena_database"></a> [athena\_database](#output\_athena\_database) | Athena |
| <a name="output_athena_named_query"></a> [athena\_named\_query](#output\_athena\_named\_query) | Athena |
| <a name="output_athena_prepared_statement"></a> [athena\_prepared\_statement](#output\_athena\_prepared\_statement) | Athena |
| <a name="output_athena_workgroup"></a> [athena\_workgroup](#output\_athena\_workgroup) | Athena |
| <a name="output_auditmanager_account_registration"></a> [auditmanager\_account\_registration](#output\_auditmanager\_account\_registration) | Audit Manager |
| <a name="output_auditmanager_assessment"></a> [auditmanager\_assessment](#output\_auditmanager\_assessment) | Audit Manager |
| <a name="output_auditmanager_assessment_delegation"></a> [auditmanager\_assessment\_delegation](#output\_auditmanager\_assessment\_delegation) | Audit Manager |
| <a name="output_auditmanager_assessment_report"></a> [auditmanager\_assessment\_report](#output\_auditmanager\_assessment\_report) | Audit Manager |
| <a name="output_auditmanager_control"></a> [auditmanager\_control](#output\_auditmanager\_control) | Audit Manager |
| <a name="output_auditmanager_framework"></a> [auditmanager\_framework](#output\_auditmanager\_framework) | Audit Manager |
| <a name="output_auditmanager_framework_share"></a> [auditmanager\_framework\_share](#output\_auditmanager\_framework\_share) | Audit Manager |
| <a name="output_auditmanager_organization_admin_account_registration"></a> [auditmanager\_organization\_admin\_account\_registration](#output\_auditmanager\_organization\_admin\_account\_registration) | Audit Manager |
| <a name="output_autoscaling_attachment"></a> [autoscaling\_attachment](#output\_autoscaling\_attachment) | Auto Scaling |
| <a name="output_autoscaling_group"></a> [autoscaling\_group](#output\_autoscaling\_group) | Auto Scaling |
| <a name="output_autoscaling_group_tag"></a> [autoscaling\_group\_tag](#output\_autoscaling\_group\_tag) | Auto Scaling |
| <a name="output_autoscaling_lifecycle_hook"></a> [autoscaling\_lifecycle\_hook](#output\_autoscaling\_lifecycle\_hook) | Auto Scaling |
| <a name="output_autoscaling_notification"></a> [autoscaling\_notification](#output\_autoscaling\_notification) | Auto Scaling |
| <a name="output_autoscaling_policy"></a> [autoscaling\_policy](#output\_autoscaling\_policy) | Auto Scaling |
| <a name="output_autoscaling_schedule"></a> [autoscaling\_schedule](#output\_autoscaling\_schedule) | Auto Scaling |
| <a name="output_autoscaling_traffic_source_attachment"></a> [autoscaling\_traffic\_source\_attachment](#output\_autoscaling\_traffic\_source\_attachment) | Auto Scaling |
| <a name="output_autoscalingplans_scaling_plan"></a> [autoscalingplans\_scaling\_plan](#output\_autoscalingplans\_scaling\_plan) | Auto Scaling Plans |
| <a name="output_backup_framework"></a> [backup\_framework](#output\_backup\_framework) | Backup |
| <a name="output_backup_global_settings"></a> [backup\_global\_settings](#output\_backup\_global\_settings) | Backup |
| <a name="output_backup_logically_air_gapped_vault"></a> [backup\_logically\_air\_gapped\_vault](#output\_backup\_logically\_air\_gapped\_vault) | Backup |
| <a name="output_backup_plan"></a> [backup\_plan](#output\_backup\_plan) | Backup |
| <a name="output_backup_region_settings"></a> [backup\_region\_settings](#output\_backup\_region\_settings) | Backup |
| <a name="output_backup_report_plan"></a> [backup\_report\_plan](#output\_backup\_report\_plan) | Backup |
| <a name="output_backup_restore_testing_plan"></a> [backup\_restore\_testing\_plan](#output\_backup\_restore\_testing\_plan) | Backup |
| <a name="output_backup_restore_testing_selection"></a> [backup\_restore\_testing\_selection](#output\_backup\_restore\_testing\_selection) | Backup |
| <a name="output_backup_selection"></a> [backup\_selection](#output\_backup\_selection) | Backup |
| <a name="output_backup_vault"></a> [backup\_vault](#output\_backup\_vault) | Backup |
| <a name="output_backup_vault_lock_configuration"></a> [backup\_vault\_lock\_configuration](#output\_backup\_vault\_lock\_configuration) | Backup |
| <a name="output_backup_vault_notifications"></a> [backup\_vault\_notifications](#output\_backup\_vault\_notifications) | Backup |
| <a name="output_backup_vault_policy"></a> [backup\_vault\_policy](#output\_backup\_vault\_policy) | Backup |
| <a name="output_batch_compute_environment"></a> [batch\_compute\_environment](#output\_batch\_compute\_environment) | Batch |
| <a name="output_batch_job_definition"></a> [batch\_job\_definition](#output\_batch\_job\_definition) | Batch |
| <a name="output_batch_job_queue"></a> [batch\_job\_queue](#output\_batch\_job\_queue) | Batch |
| <a name="output_batch_scheduling_policy"></a> [batch\_scheduling\_policy](#output\_batch\_scheduling\_policy) | Batch |
| <a name="output_bcmdataexports_export"></a> [bcmdataexports\_export](#output\_bcmdataexports\_export) | BCM Data Exports |
| <a name="output_bedrock_custom_model"></a> [bedrock\_custom\_model](#output\_bedrock\_custom\_model) | Bedrock |
| <a name="output_bedrock_guardrail"></a> [bedrock\_guardrail](#output\_bedrock\_guardrail) | Bedrock |
| <a name="output_bedrock_guardrail_version"></a> [bedrock\_guardrail\_version](#output\_bedrock\_guardrail\_version) | Bedrock |
| <a name="output_bedrock_inference_profile"></a> [bedrock\_inference\_profile](#output\_bedrock\_inference\_profile) | Bedrock |
| <a name="output_bedrock_model_invocation_logging_configuration"></a> [bedrock\_model\_invocation\_logging\_configuration](#output\_bedrock\_model\_invocation\_logging\_configuration) | Bedrock |
| <a name="output_bedrock_provisioned_model_throughput"></a> [bedrock\_provisioned\_model\_throughput](#output\_bedrock\_provisioned\_model\_throughput) | Bedrock |
| <a name="output_bedrockagent_agent"></a> [bedrockagent\_agent](#output\_bedrockagent\_agent) | Bedrock Agents |
| <a name="output_bedrockagent_agent_action_group"></a> [bedrockagent\_agent\_action\_group](#output\_bedrockagent\_agent\_action\_group) | Bedrock Agents |
| <a name="output_bedrockagent_agent_alias"></a> [bedrockagent\_agent\_alias](#output\_bedrockagent\_agent\_alias) | Bedrock Agents |
| <a name="output_bedrockagent_agent_collaborator"></a> [bedrockagent\_agent\_collaborator](#output\_bedrockagent\_agent\_collaborator) | Bedrock Agents |
| <a name="output_bedrockagent_agent_knowledge_base_association"></a> [bedrockagent\_agent\_knowledge\_base\_association](#output\_bedrockagent\_agent\_knowledge\_base\_association) | Bedrock Agents |
| <a name="output_bedrockagent_data_source"></a> [bedrockagent\_data\_source](#output\_bedrockagent\_data\_source) | Bedrock Agents |
| <a name="output_bedrockagent_knowledge_base"></a> [bedrockagent\_knowledge\_base](#output\_bedrockagent\_knowledge\_base) | Bedrock Agents |
| <a name="output_budgets_budget"></a> [budgets\_budget](#output\_budgets\_budget) | Web Services Budgets |
| <a name="output_budgets_budget_action"></a> [budgets\_budget\_action](#output\_budgets\_budget\_action) | Web Services Budgets |
| <a name="output_ce_anomaly_monitor"></a> [ce\_anomaly\_monitor](#output\_ce\_anomaly\_monitor) | Cost Explorer |
| <a name="output_ce_anomaly_subscription"></a> [ce\_anomaly\_subscription](#output\_ce\_anomaly\_subscription) | Cost Explorer |
| <a name="output_ce_cost_allocation_tag"></a> [ce\_cost\_allocation\_tag](#output\_ce\_cost\_allocation\_tag) | Cost Explorer |
| <a name="output_ce_cost_category"></a> [ce\_cost\_category](#output\_ce\_cost\_category) | Cost Explorer |
| <a name="output_chatbot_slack_channel_configuration"></a> [chatbot\_slack\_channel\_configuration](#output\_chatbot\_slack\_channel\_configuration) | Chatbot |
| <a name="output_chatbot_teams_channel_configuration"></a> [chatbot\_teams\_channel\_configuration](#output\_chatbot\_teams\_channel\_configuration) | Chatbot |
| <a name="output_chime_voice_connector"></a> [chime\_voice\_connector](#output\_chime\_voice\_connector) | Chime |
| <a name="output_chime_voice_connector_group"></a> [chime\_voice\_connector\_group](#output\_chime\_voice\_connector\_group) | Chime |
| <a name="output_chime_voice_connector_logging"></a> [chime\_voice\_connector\_logging](#output\_chime\_voice\_connector\_logging) | Chime |
| <a name="output_chime_voice_connector_origination"></a> [chime\_voice\_connector\_origination](#output\_chime\_voice\_connector\_origination) | Chime |
| <a name="output_chime_voice_connector_streaming"></a> [chime\_voice\_connector\_streaming](#output\_chime\_voice\_connector\_streaming) | Chime |
| <a name="output_chime_voice_connector_termination"></a> [chime\_voice\_connector\_termination](#output\_chime\_voice\_connector\_termination) | Chime |
| <a name="output_chime_voice_connector_termination_credentials"></a> [chime\_voice\_connector\_termination\_credentials](#output\_chime\_voice\_connector\_termination\_credentials) | Chime |
| <a name="output_chimesdkmediapipelines_media_insights_pipeline_configuration"></a> [chimesdkmediapipelines\_media\_insights\_pipeline\_configuration](#output\_chimesdkmediapipelines\_media\_insights\_pipeline\_configuration) | Chime SDK Media Pipelines |
| <a name="output_chimesdkvoice_global_settings"></a> [chimesdkvoice\_global\_settings](#output\_chimesdkvoice\_global\_settings) | Chime SDK Voice |
| <a name="output_chimesdkvoice_sip_media_application"></a> [chimesdkvoice\_sip\_media\_application](#output\_chimesdkvoice\_sip\_media\_application) | Chime SDK Voice |
| <a name="output_chimesdkvoice_sip_rule"></a> [chimesdkvoice\_sip\_rule](#output\_chimesdkvoice\_sip\_rule) | Chime SDK Voice |
| <a name="output_chimesdkvoice_voice_profile_domain"></a> [chimesdkvoice\_voice\_profile\_domain](#output\_chimesdkvoice\_voice\_profile\_domain) | Chime SDK Voice |
| <a name="output_cleanrooms_collaboration"></a> [cleanrooms\_collaboration](#output\_cleanrooms\_collaboration) | Clean Rooms |
| <a name="output_cleanrooms_configured_table"></a> [cleanrooms\_configured\_table](#output\_cleanrooms\_configured\_table) | Clean Rooms |
| <a name="output_cleanrooms_membership"></a> [cleanrooms\_membership](#output\_cleanrooms\_membership) | Clean Rooms |
| <a name="output_cloud9_environment_ec2"></a> [cloud9\_environment\_ec2](#output\_cloud9\_environment\_ec2) | Cloud9 |
| <a name="output_cloud9_environment_membership"></a> [cloud9\_environment\_membership](#output\_cloud9\_environment\_membership) | Cloud9 |
| <a name="output_cloudcontrolapi_resource"></a> [cloudcontrolapi\_resource](#output\_cloudcontrolapi\_resource) | Cloud Control API |
| <a name="output_cloudformation_stack"></a> [cloudformation\_stack](#output\_cloudformation\_stack) | CloudFormation |
| <a name="output_cloudformation_stack_instances"></a> [cloudformation\_stack\_instances](#output\_cloudformation\_stack\_instances) | CloudFormation |
| <a name="output_cloudformation_stack_set"></a> [cloudformation\_stack\_set](#output\_cloudformation\_stack\_set) | CloudFormation |
| <a name="output_cloudformation_stack_set_instance"></a> [cloudformation\_stack\_set\_instance](#output\_cloudformation\_stack\_set\_instance) | CloudFormation |
| <a name="output_cloudformation_type"></a> [cloudformation\_type](#output\_cloudformation\_type) | CloudFormation |
| <a name="output_cloudfront_cache_policy"></a> [cloudfront\_cache\_policy](#output\_cloudfront\_cache\_policy) | CloudFront |
| <a name="output_cloudfront_continuous_deployment_policy"></a> [cloudfront\_continuous\_deployment\_policy](#output\_cloudfront\_continuous\_deployment\_policy) | CloudFront |
| <a name="output_cloudfront_distribution"></a> [cloudfront\_distribution](#output\_cloudfront\_distribution) | CloudFront |
| <a name="output_cloudfront_field_level_encryption_config"></a> [cloudfront\_field\_level\_encryption\_config](#output\_cloudfront\_field\_level\_encryption\_config) | CloudFront |
| <a name="output_cloudfront_field_level_encryption_profile"></a> [cloudfront\_field\_level\_encryption\_profile](#output\_cloudfront\_field\_level\_encryption\_profile) | CloudFront |
| <a name="output_cloudfront_function"></a> [cloudfront\_function](#output\_cloudfront\_function) | CloudFront |
| <a name="output_cloudfront_key_group"></a> [cloudfront\_key\_group](#output\_cloudfront\_key\_group) | CloudFront |
| <a name="output_cloudfront_key_value_store"></a> [cloudfront\_key\_value\_store](#output\_cloudfront\_key\_value\_store) | CloudFront |
| <a name="output_cloudfront_monitoring_subscription"></a> [cloudfront\_monitoring\_subscription](#output\_cloudfront\_monitoring\_subscription) | CloudFront |
| <a name="output_cloudfront_origin_access_control"></a> [cloudfront\_origin\_access\_control](#output\_cloudfront\_origin\_access\_control) | CloudFront |
| <a name="output_cloudfront_origin_access_identity"></a> [cloudfront\_origin\_access\_identity](#output\_cloudfront\_origin\_access\_identity) | CloudFront |
| <a name="output_cloudfront_origin_request_policy"></a> [cloudfront\_origin\_request\_policy](#output\_cloudfront\_origin\_request\_policy) | CloudFront |
| <a name="output_cloudfront_public_key"></a> [cloudfront\_public\_key](#output\_cloudfront\_public\_key) | CloudFront |
| <a name="output_cloudfront_realtime_log_config"></a> [cloudfront\_realtime\_log\_config](#output\_cloudfront\_realtime\_log\_config) | CloudFront |
| <a name="output_cloudfront_response_headers_policy"></a> [cloudfront\_response\_headers\_policy](#output\_cloudfront\_response\_headers\_policy) | CloudFront |
| <a name="output_cloudfront_vpc_origin"></a> [cloudfront\_vpc\_origin](#output\_cloudfront\_vpc\_origin) | CloudFront |
| <a name="output_cloudfrontkeyvaluestore_key"></a> [cloudfrontkeyvaluestore\_key](#output\_cloudfrontkeyvaluestore\_key) | CloudFront KeyValueStore |
| <a name="output_cloudhsm_v2_cluster"></a> [cloudhsm\_v2\_cluster](#output\_cloudhsm\_v2\_cluster) | CloudHSM |
| <a name="output_cloudhsm_v2_hsm"></a> [cloudhsm\_v2\_hsm](#output\_cloudhsm\_v2\_hsm) | CloudHSM |
| <a name="output_cloudsearch_domain"></a> [cloudsearch\_domain](#output\_cloudsearch\_domain) | CloudSearch |
| <a name="output_cloudsearch_domain_service_access_policy"></a> [cloudsearch\_domain\_service\_access\_policy](#output\_cloudsearch\_domain\_service\_access\_policy) | CloudSearch |
| <a name="output_cloudtrail"></a> [cloudtrail](#output\_cloudtrail) | CloudTrail |
| <a name="output_cloudtrail_event_data_store"></a> [cloudtrail\_event\_data\_store](#output\_cloudtrail\_event\_data\_store) | CloudTrail |
| <a name="output_cloudtrail_organization_delegated_admin_account"></a> [cloudtrail\_organization\_delegated\_admin\_account](#output\_cloudtrail\_organization\_delegated\_admin\_account) | CloudTrail |
| <a name="output_cloudwatch_composite_alarm"></a> [cloudwatch\_composite\_alarm](#output\_cloudwatch\_composite\_alarm) | CloudWatch |
| <a name="output_cloudwatch_contributor_insight_rule"></a> [cloudwatch\_contributor\_insight\_rule](#output\_cloudwatch\_contributor\_insight\_rule) | CloudWatch |
| <a name="output_cloudwatch_contributor_managed_insight_rule"></a> [cloudwatch\_contributor\_managed\_insight\_rule](#output\_cloudwatch\_contributor\_managed\_insight\_rule) | CloudWatch |
| <a name="output_cloudwatch_dashboard"></a> [cloudwatch\_dashboard](#output\_cloudwatch\_dashboard) | CloudWatch |
| <a name="output_cloudwatch_event_api_destination"></a> [cloudwatch\_event\_api\_destination](#output\_cloudwatch\_event\_api\_destination) | EventBridge |
| <a name="output_cloudwatch_event_archive"></a> [cloudwatch\_event\_archive](#output\_cloudwatch\_event\_archive) | EventBridge |
| <a name="output_cloudwatch_event_bus"></a> [cloudwatch\_event\_bus](#output\_cloudwatch\_event\_bus) | EventBridge |
| <a name="output_cloudwatch_event_bus_policy"></a> [cloudwatch\_event\_bus\_policy](#output\_cloudwatch\_event\_bus\_policy) | EventBridge |
| <a name="output_cloudwatch_event_connection"></a> [cloudwatch\_event\_connection](#output\_cloudwatch\_event\_connection) | EventBridge |
| <a name="output_cloudwatch_event_endpoint"></a> [cloudwatch\_event\_endpoint](#output\_cloudwatch\_event\_endpoint) | EventBridge |
| <a name="output_cloudwatch_event_permission"></a> [cloudwatch\_event\_permission](#output\_cloudwatch\_event\_permission) | EventBridge |
| <a name="output_cloudwatch_event_rule"></a> [cloudwatch\_event\_rule](#output\_cloudwatch\_event\_rule) | EventBridge |
| <a name="output_cloudwatch_event_target"></a> [cloudwatch\_event\_target](#output\_cloudwatch\_event\_target) | EventBridge |
| <a name="output_cloudwatch_log_account_policy"></a> [cloudwatch\_log\_account\_policy](#output\_cloudwatch\_log\_account\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_anomaly_detector"></a> [cloudwatch\_log\_anomaly\_detector](#output\_cloudwatch\_log\_anomaly\_detector) | CloudWatch Logs |
| <a name="output_cloudwatch_log_data_protection_policy"></a> [cloudwatch\_log\_data\_protection\_policy](#output\_cloudwatch\_log\_data\_protection\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_delivery"></a> [cloudwatch\_log\_delivery](#output\_cloudwatch\_log\_delivery) | CloudWatch Logs |
| <a name="output_cloudwatch_log_delivery_destination"></a> [cloudwatch\_log\_delivery\_destination](#output\_cloudwatch\_log\_delivery\_destination) | CloudWatch Logs |
| <a name="output_cloudwatch_log_delivery_destination_policy"></a> [cloudwatch\_log\_delivery\_destination\_policy](#output\_cloudwatch\_log\_delivery\_destination\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_delivery_source"></a> [cloudwatch\_log\_delivery\_source](#output\_cloudwatch\_log\_delivery\_source) | CloudWatch Logs |
| <a name="output_cloudwatch_log_destination"></a> [cloudwatch\_log\_destination](#output\_cloudwatch\_log\_destination) | CloudWatch Logs |
| <a name="output_cloudwatch_log_destination_policy"></a> [cloudwatch\_log\_destination\_policy](#output\_cloudwatch\_log\_destination\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_group"></a> [cloudwatch\_log\_group](#output\_cloudwatch\_log\_group) | CloudWatch Logs |
| <a name="output_cloudwatch_log_index_policy"></a> [cloudwatch\_log\_index\_policy](#output\_cloudwatch\_log\_index\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_metric_filter"></a> [cloudwatch\_log\_metric\_filter](#output\_cloudwatch\_log\_metric\_filter) | CloudWatch Logs |
| <a name="output_cloudwatch_log_resource_policy"></a> [cloudwatch\_log\_resource\_policy](#output\_cloudwatch\_log\_resource\_policy) | CloudWatch Logs |
| <a name="output_cloudwatch_log_stream"></a> [cloudwatch\_log\_stream](#output\_cloudwatch\_log\_stream) | CloudWatch Logs |
| <a name="output_cloudwatch_log_subscription_filter"></a> [cloudwatch\_log\_subscription\_filter](#output\_cloudwatch\_log\_subscription\_filter) | CloudWatch Logs |
| <a name="output_cloudwatch_metric_alarm"></a> [cloudwatch\_metric\_alarm](#output\_cloudwatch\_metric\_alarm) | CloudWatch |
| <a name="output_cloudwatch_metric_stream"></a> [cloudwatch\_metric\_stream](#output\_cloudwatch\_metric\_stream) | CloudWatch |
| <a name="output_cloudwatch_query_definition"></a> [cloudwatch\_query\_definition](#output\_cloudwatch\_query\_definition) | CloudWatch Logs |
| <a name="output_codeartifact_domain"></a> [codeartifact\_domain](#output\_codeartifact\_domain) | CodeArtifact |
| <a name="output_codeartifact_domain_permissions_policy"></a> [codeartifact\_domain\_permissions\_policy](#output\_codeartifact\_domain\_permissions\_policy) | CodeArtifact |
| <a name="output_codeartifact_repository"></a> [codeartifact\_repository](#output\_codeartifact\_repository) | CodeArtifact |
| <a name="output_codeartifact_repository_permissions_policy"></a> [codeartifact\_repository\_permissions\_policy](#output\_codeartifact\_repository\_permissions\_policy) | CodeArtifact |
| <a name="output_codebuild_fleet"></a> [codebuild\_fleet](#output\_codebuild\_fleet) | CodeBuild |
| <a name="output_codebuild_project"></a> [codebuild\_project](#output\_codebuild\_project) | CodeBuild |
| <a name="output_codebuild_report_group"></a> [codebuild\_report\_group](#output\_codebuild\_report\_group) | CodeBuild |
| <a name="output_codebuild_resource_policy"></a> [codebuild\_resource\_policy](#output\_codebuild\_resource\_policy) | CodeBuild |
| <a name="output_codebuild_source_credential"></a> [codebuild\_source\_credential](#output\_codebuild\_source\_credential) | CodeBuild |
| <a name="output_codebuild_webhook"></a> [codebuild\_webhook](#output\_codebuild\_webhook) | CodeBuild |
| <a name="output_codecatalyst_dev_environment"></a> [codecatalyst\_dev\_environment](#output\_codecatalyst\_dev\_environment) | CodeCatalyst |
| <a name="output_codecatalyst_project"></a> [codecatalyst\_project](#output\_codecatalyst\_project) | CodeCatalyst |
| <a name="output_codecatalyst_source_repository"></a> [codecatalyst\_source\_repository](#output\_codecatalyst\_source\_repository) | CodeCatalyst |
| <a name="output_codecommit_approval_rule_template"></a> [codecommit\_approval\_rule\_template](#output\_codecommit\_approval\_rule\_template) | CodeCommit |
| <a name="output_codecommit_approval_rule_template_association"></a> [codecommit\_approval\_rule\_template\_association](#output\_codecommit\_approval\_rule\_template\_association) | CodeCommit |
| <a name="output_codecommit_repository"></a> [codecommit\_repository](#output\_codecommit\_repository) | CodeCommit |
| <a name="output_codecommit_trigger"></a> [codecommit\_trigger](#output\_codecommit\_trigger) | CodeCommit |
| <a name="output_codeconnections_connection"></a> [codeconnections\_connection](#output\_codeconnections\_connection) | CodeConnections |
| <a name="output_codeconnections_host"></a> [codeconnections\_host](#output\_codeconnections\_host) | CodeConnections |
| <a name="output_codedeploy_app"></a> [codedeploy\_app](#output\_codedeploy\_app) | CodeDeploy |
| <a name="output_codedeploy_deployment_config"></a> [codedeploy\_deployment\_config](#output\_codedeploy\_deployment\_config) | CodeDeploy |
| <a name="output_codedeploy_deployment_group"></a> [codedeploy\_deployment\_group](#output\_codedeploy\_deployment\_group) | CodeDeploy |
| <a name="output_codeguruprofiler_profiling_group"></a> [codeguruprofiler\_profiling\_group](#output\_codeguruprofiler\_profiling\_group) | CodeGuru Profiler |
| <a name="output_codegurureviewer_repository_association"></a> [codegurureviewer\_repository\_association](#output\_codegurureviewer\_repository\_association) | CodeGuru Reviewer |
| <a name="output_codepipeline"></a> [codepipeline](#output\_codepipeline) | CodePipeline |
| <a name="output_codepipeline_custom_action_type"></a> [codepipeline\_custom\_action\_type](#output\_codepipeline\_custom\_action\_type) | CodePipeline |
| <a name="output_codepipeline_webhook"></a> [codepipeline\_webhook](#output\_codepipeline\_webhook) | CodePipeline |
| <a name="output_codestarconnections_connection"></a> [codestarconnections\_connection](#output\_codestarconnections\_connection) | CodeStar Connections |
| <a name="output_codestarconnections_host"></a> [codestarconnections\_host](#output\_codestarconnections\_host) | CodeStar Connections |
| <a name="output_codestarnotifications_notification_rule"></a> [codestarnotifications\_notification\_rule](#output\_codestarnotifications\_notification\_rule) | CodeStar Notifications |
| <a name="output_cognito_identity_pool"></a> [cognito\_identity\_pool](#output\_cognito\_identity\_pool) | Cognito Identity |
| <a name="output_cognito_identity_pool_provider_principal_tag"></a> [cognito\_identity\_pool\_provider\_principal\_tag](#output\_cognito\_identity\_pool\_provider\_principal\_tag) | Cognito Identity |
| <a name="output_cognito_identity_pool_roles_attachment"></a> [cognito\_identity\_pool\_roles\_attachment](#output\_cognito\_identity\_pool\_roles\_attachment) | Cognito Identity |
| <a name="output_cognito_identity_provider"></a> [cognito\_identity\_provider](#output\_cognito\_identity\_provider) | Identity Provider |
| <a name="output_cognito_managed_user_pool_client"></a> [cognito\_managed\_user\_pool\_client](#output\_cognito\_managed\_user\_pool\_client) | Identity Provider |
| <a name="output_cognito_resource_server"></a> [cognito\_resource\_server](#output\_cognito\_resource\_server) | Identity Provider |
| <a name="output_cognito_risk_configuration"></a> [cognito\_risk\_configuration](#output\_cognito\_risk\_configuration) | Identity Provider |
| <a name="output_cognito_user"></a> [cognito\_user](#output\_cognito\_user) | Identity Provider |
| <a name="output_cognito_user_group"></a> [cognito\_user\_group](#output\_cognito\_user\_group) | Identity Provider |
| <a name="output_cognito_user_in_group"></a> [cognito\_user\_in\_group](#output\_cognito\_user\_in\_group) | Identity Provider |
| <a name="output_cognito_user_pool"></a> [cognito\_user\_pool](#output\_cognito\_user\_pool) | Identity Provider |
| <a name="output_cognito_user_pool_client"></a> [cognito\_user\_pool\_client](#output\_cognito\_user\_pool\_client) | Identity Provider |
| <a name="output_cognito_user_pool_domain"></a> [cognito\_user\_pool\_domain](#output\_cognito\_user\_pool\_domain) | Identity Provider |
| <a name="output_cognito_user_pool_ui_customization"></a> [cognito\_user\_pool\_ui\_customization](#output\_cognito\_user\_pool\_ui\_customization) | Identity Provider |
| <a name="output_comprehend_document_classifier"></a> [comprehend\_document\_classifier](#output\_comprehend\_document\_classifier) | Comprehend |
| <a name="output_comprehend_entity_recognizer"></a> [comprehend\_entity\_recognizer](#output\_comprehend\_entity\_recognizer) | Comprehend |
| <a name="output_computeoptimizer_enrollment_status"></a> [computeoptimizer\_enrollment\_status](#output\_computeoptimizer\_enrollment\_status) | Compute Optimizer |
| <a name="output_computeoptimizer_recommendation_preferences"></a> [computeoptimizer\_recommendation\_preferences](#output\_computeoptimizer\_recommendation\_preferences) | Compute Optimizer |
| <a name="output_config_aggregate_authorization"></a> [config\_aggregate\_authorization](#output\_config\_aggregate\_authorization) | Config |
| <a name="output_config_config_rule"></a> [config\_config\_rule](#output\_config\_config\_rule) | Config |
| <a name="output_config_configuration_aggregator"></a> [config\_configuration\_aggregator](#output\_config\_configuration\_aggregator) | Config |
| <a name="output_config_configuration_recorder"></a> [config\_configuration\_recorder](#output\_config\_configuration\_recorder) | Config |
| <a name="output_config_configuration_recorder_status"></a> [config\_configuration\_recorder\_status](#output\_config\_configuration\_recorder\_status) | Config |
| <a name="output_config_conformance_pack"></a> [config\_conformance\_pack](#output\_config\_conformance\_pack) | Config |
| <a name="output_config_delivery_channel"></a> [config\_delivery\_channel](#output\_config\_delivery\_channel) | Config |
| <a name="output_config_organization_conformance_pack"></a> [config\_organization\_conformance\_pack](#output\_config\_organization\_conformance\_pack) | Config |
| <a name="output_config_organization_custom_policy_rule"></a> [config\_organization\_custom\_policy\_rule](#output\_config\_organization\_custom\_policy\_rule) | Config |
| <a name="output_config_organization_custom_rule"></a> [config\_organization\_custom\_rule](#output\_config\_organization\_custom\_rule) | Config |
| <a name="output_config_organization_managed_rule"></a> [config\_organization\_managed\_rule](#output\_config\_organization\_managed\_rule) | Config |
| <a name="output_config_remediation_configuration"></a> [config\_remediation\_configuration](#output\_config\_remediation\_configuration) | Config |
| <a name="output_config_retention_configuration"></a> [config\_retention\_configuration](#output\_config\_retention\_configuration) | Config |
| <a name="output_connect_bot_association"></a> [connect\_bot\_association](#output\_connect\_bot\_association) | Connect |
| <a name="output_connect_contact_flow"></a> [connect\_contact\_flow](#output\_connect\_contact\_flow) | Connect |
| <a name="output_connect_contact_flow_module"></a> [connect\_contact\_flow\_module](#output\_connect\_contact\_flow\_module) | Connect |
| <a name="output_connect_hours_of_operation"></a> [connect\_hours\_of\_operation](#output\_connect\_hours\_of\_operation) | Connect |
| <a name="output_connect_instance"></a> [connect\_instance](#output\_connect\_instance) | Connect |
| <a name="output_connect_instance_storage_config"></a> [connect\_instance\_storage\_config](#output\_connect\_instance\_storage\_config) | Connect |
| <a name="output_connect_lambda_function_association"></a> [connect\_lambda\_function\_association](#output\_connect\_lambda\_function\_association) | Connect |
| <a name="output_connect_phone_number"></a> [connect\_phone\_number](#output\_connect\_phone\_number) | Connect |
| <a name="output_connect_queue"></a> [connect\_queue](#output\_connect\_queue) | Connect |
| <a name="output_connect_quick_connect"></a> [connect\_quick\_connect](#output\_connect\_quick\_connect) | Connect |
| <a name="output_connect_routing_profile"></a> [connect\_routing\_profile](#output\_connect\_routing\_profile) | Connect |
| <a name="output_connect_security_profile"></a> [connect\_security\_profile](#output\_connect\_security\_profile) | Connect |
| <a name="output_connect_user"></a> [connect\_user](#output\_connect\_user) | Connect |
| <a name="output_connect_user_hierarchy_group"></a> [connect\_user\_hierarchy\_group](#output\_connect\_user\_hierarchy\_group) | Connect |
| <a name="output_connect_user_hierarchy_structure"></a> [connect\_user\_hierarchy\_structure](#output\_connect\_user\_hierarchy\_structure) | Connect |
| <a name="output_connect_vocabulary"></a> [connect\_vocabulary](#output\_connect\_vocabulary) | Connect |
| <a name="output_controltower_control"></a> [controltower\_control](#output\_controltower\_control) | Control Tower |
| <a name="output_controltower_landing_zone"></a> [controltower\_landing\_zone](#output\_controltower\_landing\_zone) | Control Tower |
| <a name="output_costoptimizationhub_enrollment_status"></a> [costoptimizationhub\_enrollment\_status](#output\_costoptimizationhub\_enrollment\_status) | Cost Optimization Hub |
| <a name="output_costoptimizationhub_preferences"></a> [costoptimizationhub\_preferences](#output\_costoptimizationhub\_preferences) | Cost Optimization Hub |
| <a name="output_cur_report_definition"></a> [cur\_report\_definition](#output\_cur\_report\_definition) | Cost and Usage Report |
| <a name="output_customer_gateway"></a> [customer\_gateway](#output\_customer\_gateway) | Site-to-Site |
| <a name="output_customerprofiles_domain"></a> [customerprofiles\_domain](#output\_customerprofiles\_domain) | Connect Customer Profiles |
| <a name="output_customerprofiles_profile"></a> [customerprofiles\_profile](#output\_customerprofiles\_profile) | Connect Customer Profiles |
| <a name="output_dataexchange_data_set"></a> [dataexchange\_data\_set](#output\_dataexchange\_data\_set) | Data Exchange |
| <a name="output_dataexchange_event_action"></a> [dataexchange\_event\_action](#output\_dataexchange\_event\_action) | Data Exchange |
| <a name="output_dataexchange_revision"></a> [dataexchange\_revision](#output\_dataexchange\_revision) | Data Exchange |
| <a name="output_datapipeline_pipeline"></a> [datapipeline\_pipeline](#output\_datapipeline\_pipeline) | Data Pipeline |
| <a name="output_datapipeline_pipeline_definition"></a> [datapipeline\_pipeline\_definition](#output\_datapipeline\_pipeline\_definition) | Data Pipeline |
| <a name="output_datasync_agent"></a> [datasync\_agent](#output\_datasync\_agent) | DataSync |
| <a name="output_datasync_location_azure_blob"></a> [datasync\_location\_azure\_blob](#output\_datasync\_location\_azure\_blob) | DataSync |
| <a name="output_datasync_location_efs"></a> [datasync\_location\_efs](#output\_datasync\_location\_efs) | DataSync |
| <a name="output_datasync_location_fsx_lustre_file_system"></a> [datasync\_location\_fsx\_lustre\_file\_system](#output\_datasync\_location\_fsx\_lustre\_file\_system) | DataSync |
| <a name="output_datasync_location_fsx_ontap_file_system"></a> [datasync\_location\_fsx\_ontap\_file\_system](#output\_datasync\_location\_fsx\_ontap\_file\_system) | DataSync |
| <a name="output_datasync_location_fsx_openzfs_file_system"></a> [datasync\_location\_fsx\_openzfs\_file\_system](#output\_datasync\_location\_fsx\_openzfs\_file\_system) | DataSync |
| <a name="output_datasync_location_fsx_windows_file_system"></a> [datasync\_location\_fsx\_windows\_file\_system](#output\_datasync\_location\_fsx\_windows\_file\_system) | DataSync |
| <a name="output_datasync_location_hdfs"></a> [datasync\_location\_hdfs](#output\_datasync\_location\_hdfs) | DataSync |
| <a name="output_datasync_location_nfs"></a> [datasync\_location\_nfs](#output\_datasync\_location\_nfs) | DataSync |
| <a name="output_datasync_location_object_storage"></a> [datasync\_location\_object\_storage](#output\_datasync\_location\_object\_storage) | DataSync |
| <a name="output_datasync_location_s3"></a> [datasync\_location\_s3](#output\_datasync\_location\_s3) | DataSync |
| <a name="output_datasync_location_smb"></a> [datasync\_location\_smb](#output\_datasync\_location\_smb) | DataSync |
| <a name="output_datasync_task"></a> [datasync\_task](#output\_datasync\_task) | DataSync |
| <a name="output_datazone_asset_type"></a> [datazone\_asset\_type](#output\_datazone\_asset\_type) | DataZone |
| <a name="output_datazone_domain"></a> [datazone\_domain](#output\_datazone\_domain) | DataZone |
| <a name="output_datazone_environment"></a> [datazone\_environment](#output\_datazone\_environment) | DataZone |
| <a name="output_datazone_environment_blueprint_configuration"></a> [datazone\_environment\_blueprint\_configuration](#output\_datazone\_environment\_blueprint\_configuration) | DataZone |
| <a name="output_datazone_environment_profile"></a> [datazone\_environment\_profile](#output\_datazone\_environment\_profile) | DataZone |
| <a name="output_datazone_form_type"></a> [datazone\_form\_type](#output\_datazone\_form\_type) | DataZone |
| <a name="output_datazone_glossary"></a> [datazone\_glossary](#output\_datazone\_glossary) | DataZone |
| <a name="output_datazone_glossary_term"></a> [datazone\_glossary\_term](#output\_datazone\_glossary\_term) | DataZone |
| <a name="output_datazone_project"></a> [datazone\_project](#output\_datazone\_project) | DataZone |
| <a name="output_datazone_user_profile"></a> [datazone\_user\_profile](#output\_datazone\_user\_profile) | DataZone |
| <a name="output_dax_cluster"></a> [dax\_cluster](#output\_dax\_cluster) | DAX |
| <a name="output_dax_parameter_group"></a> [dax\_parameter\_group](#output\_dax\_parameter\_group) | DAX |
| <a name="output_dax_subnet_group"></a> [dax\_subnet\_group](#output\_dax\_subnet\_group) | DAX |
| <a name="output_db_cluster_snapshot"></a> [db\_cluster\_snapshot](#output\_db\_cluster\_snapshot) | Relational Database |
| <a name="output_db_event_subscription"></a> [db\_event\_subscription](#output\_db\_event\_subscription) | Relational Database |
| <a name="output_db_instance"></a> [db\_instance](#output\_db\_instance) | Relational Database |
| <a name="output_db_instance_automated_backups_replication"></a> [db\_instance\_automated\_backups\_replication](#output\_db\_instance\_automated\_backups\_replication) | Relational Database |
| <a name="output_db_instance_role_association"></a> [db\_instance\_role\_association](#output\_db\_instance\_role\_association) | Relational Database |
| <a name="output_db_option_group"></a> [db\_option\_group](#output\_db\_option\_group) | Relational Database |
| <a name="output_db_parameter_group"></a> [db\_parameter\_group](#output\_db\_parameter\_group) | Relational Database |
| <a name="output_db_proxy"></a> [db\_proxy](#output\_db\_proxy) | Relational Database |
| <a name="output_db_proxy_default_target_group"></a> [db\_proxy\_default\_target\_group](#output\_db\_proxy\_default\_target\_group) | Relational Database |
| <a name="output_db_proxy_endpoint"></a> [db\_proxy\_endpoint](#output\_db\_proxy\_endpoint) | Relational Database |
| <a name="output_db_proxy_target"></a> [db\_proxy\_target](#output\_db\_proxy\_target) | Relational Database |
| <a name="output_db_snapshot"></a> [db\_snapshot](#output\_db\_snapshot) | Relational Database |
| <a name="output_db_snapshot_copy"></a> [db\_snapshot\_copy](#output\_db\_snapshot\_copy) | Relational Database |
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | Relational Database |
| <a name="output_default_network_acl"></a> [default\_network\_acl](#output\_default\_network\_acl) | Virtual Private Cloud |
| <a name="output_default_route_table"></a> [default\_route\_table](#output\_default\_route\_table) | Virtual Private Cloud |
| <a name="output_default_security_group"></a> [default\_security\_group](#output\_default\_security\_group) | Virtual Private Cloud |
| <a name="output_default_subnet"></a> [default\_subnet](#output\_default\_subnet) | Virtual Private Cloud |
| <a name="output_default_vpc"></a> [default\_vpc](#output\_default\_vpc) | Virtual Private Cloud |
| <a name="output_default_vpc_dhcp_options"></a> [default\_vpc\_dhcp\_options](#output\_default\_vpc\_dhcp\_options) | Virtual Private Cloud |
| <a name="output_delimiter"></a> [delimiter](#output\_delimiter) | Delimiter |
| <a name="output_detective_graph"></a> [detective\_graph](#output\_detective\_graph) | Detective |
| <a name="output_detective_invitation_accepter"></a> [detective\_invitation\_accepter](#output\_detective\_invitation\_accepter) | Detective |
| <a name="output_detective_member"></a> [detective\_member](#output\_detective\_member) | Detective |
| <a name="output_detective_organization_admin_account"></a> [detective\_organization\_admin\_account](#output\_detective\_organization\_admin\_account) | Detective |
| <a name="output_detective_organization_configuration"></a> [detective\_organization\_configuration](#output\_detective\_organization\_configuration) | Detective |
| <a name="output_devicefarm_device_pool"></a> [devicefarm\_device\_pool](#output\_devicefarm\_device\_pool) | Device Farm |
| <a name="output_devicefarm_instance_profile"></a> [devicefarm\_instance\_profile](#output\_devicefarm\_instance\_profile) | Device Farm |
| <a name="output_devicefarm_network_profile"></a> [devicefarm\_network\_profile](#output\_devicefarm\_network\_profile) | Device Farm |
| <a name="output_devicefarm_project"></a> [devicefarm\_project](#output\_devicefarm\_project) | Device Farm |
| <a name="output_devicefarm_test_grid_project"></a> [devicefarm\_test\_grid\_project](#output\_devicefarm\_test\_grid\_project) | Device Farm |
| <a name="output_devicefarm_upload"></a> [devicefarm\_upload](#output\_devicefarm\_upload) | Device Farm |
| <a name="output_devopsguru_event_sources_config"></a> [devopsguru\_event\_sources\_config](#output\_devopsguru\_event\_sources\_config) | DevOps Guru |
| <a name="output_devopsguru_notification_channel"></a> [devopsguru\_notification\_channel](#output\_devopsguru\_notification\_channel) | DevOps Guru |
| <a name="output_devopsguru_resource_collection"></a> [devopsguru\_resource\_collection](#output\_devopsguru\_resource\_collection) | DevOps Guru |
| <a name="output_devopsguru_service_integration"></a> [devopsguru\_service\_integration](#output\_devopsguru\_service\_integration) | DevOps Guru |
| <a name="output_directory_service_conditional_forwarder"></a> [directory\_service\_conditional\_forwarder](#output\_directory\_service\_conditional\_forwarder) | Directory Service |
| <a name="output_directory_service_directory"></a> [directory\_service\_directory](#output\_directory\_service\_directory) | Directory Service |
| <a name="output_directory_service_log_subscription"></a> [directory\_service\_log\_subscription](#output\_directory\_service\_log\_subscription) | Directory Service |
| <a name="output_directory_service_radius_settings"></a> [directory\_service\_radius\_settings](#output\_directory\_service\_radius\_settings) | Directory Service |
| <a name="output_directory_service_region"></a> [directory\_service\_region](#output\_directory\_service\_region) | Directory Service |
| <a name="output_directory_service_shared_directory"></a> [directory\_service\_shared\_directory](#output\_directory\_service\_shared\_directory) | Directory Service |
| <a name="output_directory_service_shared_directory_accepter"></a> [directory\_service\_shared\_directory\_accepter](#output\_directory\_service\_shared\_directory\_accepter) | Directory Service |
| <a name="output_directory_service_trust"></a> [directory\_service\_trust](#output\_directory\_service\_trust) | Directory Service |
| <a name="output_dlm_lifecycle_policy"></a> [dlm\_lifecycle\_policy](#output\_dlm\_lifecycle\_policy) | Data Lifecycle Manager |
| <a name="output_dms_certificate"></a> [dms\_certificate](#output\_dms\_certificate) | Database Migration |
| <a name="output_dms_endpoint"></a> [dms\_endpoint](#output\_dms\_endpoint) | Database Migration |
| <a name="output_dms_event_subscription"></a> [dms\_event\_subscription](#output\_dms\_event\_subscription) | Database Migration |
| <a name="output_dms_replication_config"></a> [dms\_replication\_config](#output\_dms\_replication\_config) | Database Migration |
| <a name="output_dms_replication_instance"></a> [dms\_replication\_instance](#output\_dms\_replication\_instance) | Database Migration |
| <a name="output_dms_replication_subnet_group"></a> [dms\_replication\_subnet\_group](#output\_dms\_replication\_subnet\_group) | Database Migration |
| <a name="output_dms_replication_task"></a> [dms\_replication\_task](#output\_dms\_replication\_task) | Database Migration |
| <a name="output_dms_s3_endpoint"></a> [dms\_s3\_endpoint](#output\_dms\_s3\_endpoint) | Database Migration |
| <a name="output_docdb_cluster"></a> [docdb\_cluster](#output\_docdb\_cluster) | DocumentDB |
| <a name="output_docdb_cluster_instance"></a> [docdb\_cluster\_instance](#output\_docdb\_cluster\_instance) | DocumentDB |
| <a name="output_docdb_cluster_parameter_group"></a> [docdb\_cluster\_parameter\_group](#output\_docdb\_cluster\_parameter\_group) | DocumentDB |
| <a name="output_docdb_cluster_snapshot"></a> [docdb\_cluster\_snapshot](#output\_docdb\_cluster\_snapshot) | DocumentDB |
| <a name="output_docdb_event_subscription"></a> [docdb\_event\_subscription](#output\_docdb\_event\_subscription) | DocumentDB |
| <a name="output_docdb_global_cluster"></a> [docdb\_global\_cluster](#output\_docdb\_global\_cluster) | DocumentDB |
| <a name="output_docdb_subnet_group"></a> [docdb\_subnet\_group](#output\_docdb\_subnet\_group) | DocumentDB |
| <a name="output_docdbelastic_cluster"></a> [docdbelastic\_cluster](#output\_docdbelastic\_cluster) | DocumentDB Elastic |
| <a name="output_drs_replication_configuration_template"></a> [drs\_replication\_configuration\_template](#output\_drs\_replication\_configuration\_template) | Elastic Disaster Recovery |
| <a name="output_dx_bgp_peer"></a> [dx\_bgp\_peer](#output\_dx\_bgp\_peer) | Direct Connect |
| <a name="output_dx_connection"></a> [dx\_connection](#output\_dx\_connection) | Direct Connect |
| <a name="output_dx_connection_association"></a> [dx\_connection\_association](#output\_dx\_connection\_association) | Direct Connect |
| <a name="output_dx_connection_confirmation"></a> [dx\_connection\_confirmation](#output\_dx\_connection\_confirmation) | Direct Connect |
| <a name="output_dx_gateway"></a> [dx\_gateway](#output\_dx\_gateway) | Direct Connect |
| <a name="output_dx_gateway_association"></a> [dx\_gateway\_association](#output\_dx\_gateway\_association) | Direct Connect |
| <a name="output_dx_gateway_association_proposal"></a> [dx\_gateway\_association\_proposal](#output\_dx\_gateway\_association\_proposal) | Direct Connect |
| <a name="output_dx_hosted_connection"></a> [dx\_hosted\_connection](#output\_dx\_hosted\_connection) | Direct Connect |
| <a name="output_dx_hosted_private_virtual_interface"></a> [dx\_hosted\_private\_virtual\_interface](#output\_dx\_hosted\_private\_virtual\_interface) | Direct Connect |
| <a name="output_dx_hosted_private_virtual_interface_accepter"></a> [dx\_hosted\_private\_virtual\_interface\_accepter](#output\_dx\_hosted\_private\_virtual\_interface\_accepter) | Direct Connect |
| <a name="output_dx_hosted_public_virtual_interface"></a> [dx\_hosted\_public\_virtual\_interface](#output\_dx\_hosted\_public\_virtual\_interface) | Direct Connect |
| <a name="output_dx_hosted_public_virtual_interface_accepter"></a> [dx\_hosted\_public\_virtual\_interface\_accepter](#output\_dx\_hosted\_public\_virtual\_interface\_accepter) | Direct Connect |
| <a name="output_dx_hosted_transit_virtual_interface"></a> [dx\_hosted\_transit\_virtual\_interface](#output\_dx\_hosted\_transit\_virtual\_interface) | Direct Connect |
| <a name="output_dx_hosted_transit_virtual_interface_accepter"></a> [dx\_hosted\_transit\_virtual\_interface\_accepter](#output\_dx\_hosted\_transit\_virtual\_interface\_accepter) | Direct Connect |
| <a name="output_dx_lag"></a> [dx\_lag](#output\_dx\_lag) | Direct Connect |
| <a name="output_dx_macsec_key_association"></a> [dx\_macsec\_key\_association](#output\_dx\_macsec\_key\_association) | Direct Connect |
| <a name="output_dx_private_virtual_interface"></a> [dx\_private\_virtual\_interface](#output\_dx\_private\_virtual\_interface) | Direct Connect |
| <a name="output_dx_public_virtual_interface"></a> [dx\_public\_virtual\_interface](#output\_dx\_public\_virtual\_interface) | Direct Connect |
| <a name="output_dx_transit_virtual_interface"></a> [dx\_transit\_virtual\_interface](#output\_dx\_transit\_virtual\_interface) | Direct Connect |
| <a name="output_dynamodb_contributor_insights"></a> [dynamodb\_contributor\_insights](#output\_dynamodb\_contributor\_insights) | DynamoDB |
| <a name="output_dynamodb_global_table"></a> [dynamodb\_global\_table](#output\_dynamodb\_global\_table) | DynamoDB |
| <a name="output_dynamodb_kinesis_streaming_destination"></a> [dynamodb\_kinesis\_streaming\_destination](#output\_dynamodb\_kinesis\_streaming\_destination) | DynamoDB |
| <a name="output_dynamodb_resource_policy"></a> [dynamodb\_resource\_policy](#output\_dynamodb\_resource\_policy) | DynamoDB |
| <a name="output_dynamodb_table"></a> [dynamodb\_table](#output\_dynamodb\_table) | DynamoDB |
| <a name="output_dynamodb_table_export"></a> [dynamodb\_table\_export](#output\_dynamodb\_table\_export) | DynamoDB |
| <a name="output_dynamodb_table_item"></a> [dynamodb\_table\_item](#output\_dynamodb\_table\_item) | DynamoDB |
| <a name="output_dynamodb_table_replica"></a> [dynamodb\_table\_replica](#output\_dynamodb\_table\_replica) | DynamoDB |
| <a name="output_dynamodb_tag"></a> [dynamodb\_tag](#output\_dynamodb\_tag) | DynamoDB |
| <a name="output_ebs_default_kms_key"></a> [ebs\_default\_kms\_key](#output\_ebs\_default\_kms\_key) | EC2 |
| <a name="output_ebs_encryption_by_default"></a> [ebs\_encryption\_by\_default](#output\_ebs\_encryption\_by\_default) | EC2 |
| <a name="output_ebs_fast_snapshot_restore"></a> [ebs\_fast\_snapshot\_restore](#output\_ebs\_fast\_snapshot\_restore) | EC2 |
| <a name="output_ebs_snapshot"></a> [ebs\_snapshot](#output\_ebs\_snapshot) | EC2 |
| <a name="output_ebs_snapshot_block_public_access"></a> [ebs\_snapshot\_block\_public\_access](#output\_ebs\_snapshot\_block\_public\_access) | EC2 |
| <a name="output_ebs_snapshot_copy"></a> [ebs\_snapshot\_copy](#output\_ebs\_snapshot\_copy) | EC2 |
| <a name="output_ebs_snapshot_import"></a> [ebs\_snapshot\_import](#output\_ebs\_snapshot\_import) | EC2 |
| <a name="output_ebs_volume"></a> [ebs\_volume](#output\_ebs\_volume) | EC2 |
| <a name="output_ec2_availability_zone_group"></a> [ec2\_availability\_zone\_group](#output\_ec2\_availability\_zone\_group) | Elastic Compute Cloud |
| <a name="output_ec2_capacity_block_reservation"></a> [ec2\_capacity\_block\_reservation](#output\_ec2\_capacity\_block\_reservation) | Elastic Compute Cloud |
| <a name="output_ec2_capacity_reservation"></a> [ec2\_capacity\_reservation](#output\_ec2\_capacity\_reservation) | Elastic Compute Cloud |
| <a name="output_ec2_carrier_gateway"></a> [ec2\_carrier\_gateway](#output\_ec2\_carrier\_gateway) | Wavelength |
| <a name="output_ec2_client_vpn_authorization_rule"></a> [ec2\_client\_vpn\_authorization\_rule](#output\_ec2\_client\_vpn\_authorization\_rule) | Client |
| <a name="output_ec2_client_vpn_endpoint"></a> [ec2\_client\_vpn\_endpoint](#output\_ec2\_client\_vpn\_endpoint) | Client |
| <a name="output_ec2_client_vpn_network_association"></a> [ec2\_client\_vpn\_network\_association](#output\_ec2\_client\_vpn\_network\_association) | Client |
| <a name="output_ec2_client_vpn_route"></a> [ec2\_client\_vpn\_route](#output\_ec2\_client\_vpn\_route) | Client |
| <a name="output_ec2_fleet"></a> [ec2\_fleet](#output\_ec2\_fleet) | Elastic Compute Cloud |
| <a name="output_ec2_host"></a> [ec2\_host](#output\_ec2\_host) | Elastic Compute Cloud |
| <a name="output_ec2_image_block_public_access"></a> [ec2\_image\_block\_public\_access](#output\_ec2\_image\_block\_public\_access) | Elastic Compute Cloud |
| <a name="output_ec2_instance_connect_endpoint"></a> [ec2\_instance\_connect\_endpoint](#output\_ec2\_instance\_connect\_endpoint) | Elastic Compute Cloud |
| <a name="output_ec2_instance_metadata_defaults"></a> [ec2\_instance\_metadata\_defaults](#output\_ec2\_instance\_metadata\_defaults) | Elastic Compute Cloud |
| <a name="output_ec2_instance_state"></a> [ec2\_instance\_state](#output\_ec2\_instance\_state) | Elastic Compute Cloud |
| <a name="output_ec2_local_gateway_route"></a> [ec2\_local\_gateway\_route](#output\_ec2\_local\_gateway\_route) | EC2 |
| <a name="output_ec2_local_gateway_route_table_vpc_association"></a> [ec2\_local\_gateway\_route\_table\_vpc\_association](#output\_ec2\_local\_gateway\_route\_table\_vpc\_association) | EC2 |
| <a name="output_ec2_managed_prefix_list"></a> [ec2\_managed\_prefix\_list](#output\_ec2\_managed\_prefix\_list) | Virtual Private Cloud |
| <a name="output_ec2_managed_prefix_list_entry"></a> [ec2\_managed\_prefix\_list\_entry](#output\_ec2\_managed\_prefix\_list\_entry) | Virtual Private Cloud |
| <a name="output_ec2_network_insights_analysis"></a> [ec2\_network\_insights\_analysis](#output\_ec2\_network\_insights\_analysis) | Virtual Private Cloud |
| <a name="output_ec2_network_insights_path"></a> [ec2\_network\_insights\_path](#output\_ec2\_network\_insights\_path) | Virtual Private Cloud |
| <a name="output_ec2_serial_console_access"></a> [ec2\_serial\_console\_access](#output\_ec2\_serial\_console\_access) | Elastic Compute Cloud |
| <a name="output_ec2_subnet_cidr_reservation"></a> [ec2\_subnet\_cidr\_reservation](#output\_ec2\_subnet\_cidr\_reservation) | Virtual Private Cloud |
| <a name="output_ec2_tag"></a> [ec2\_tag](#output\_ec2\_tag) | Elastic Compute Cloud |
| <a name="output_ec2_traffic_mirror_filter"></a> [ec2\_traffic\_mirror\_filter](#output\_ec2\_traffic\_mirror\_filter) | Virtual Private Cloud |
| <a name="output_ec2_traffic_mirror_filter_rule"></a> [ec2\_traffic\_mirror\_filter\_rule](#output\_ec2\_traffic\_mirror\_filter\_rule) | Virtual Private Cloud |
| <a name="output_ec2_traffic_mirror_session"></a> [ec2\_traffic\_mirror\_session](#output\_ec2\_traffic\_mirror\_session) | Virtual Private Cloud |
| <a name="output_ec2_traffic_mirror_target"></a> [ec2\_traffic\_mirror\_target](#output\_ec2\_traffic\_mirror\_target) | Virtual Private Cloud |
| <a name="output_ec2_transit_gateway"></a> [ec2\_transit\_gateway](#output\_ec2\_transit\_gateway) | Transit Gateway |
| <a name="output_ec2_transit_gateway_connect"></a> [ec2\_transit\_gateway\_connect](#output\_ec2\_transit\_gateway\_connect) | Transit Gateway |
| <a name="output_ec2_transit_gateway_connect_peer"></a> [ec2\_transit\_gateway\_connect\_peer](#output\_ec2\_transit\_gateway\_connect\_peer) | Transit Gateway |
| <a name="output_ec2_transit_gateway_default_route_table_association"></a> [ec2\_transit\_gateway\_default\_route\_table\_association](#output\_ec2\_transit\_gateway\_default\_route\_table\_association) | Transit Gateway |
| <a name="output_ec2_transit_gateway_default_route_table_propagation"></a> [ec2\_transit\_gateway\_default\_route\_table\_propagation](#output\_ec2\_transit\_gateway\_default\_route\_table\_propagation) | Transit Gateway |
| <a name="output_ec2_transit_gateway_multicast_domain"></a> [ec2\_transit\_gateway\_multicast\_domain](#output\_ec2\_transit\_gateway\_multicast\_domain) | Transit Gateway |
| <a name="output_ec2_transit_gateway_multicast_domain_association"></a> [ec2\_transit\_gateway\_multicast\_domain\_association](#output\_ec2\_transit\_gateway\_multicast\_domain\_association) | Transit Gateway |
| <a name="output_ec2_transit_gateway_multicast_group_member"></a> [ec2\_transit\_gateway\_multicast\_group\_member](#output\_ec2\_transit\_gateway\_multicast\_group\_member) | Transit Gateway |
| <a name="output_ec2_transit_gateway_multicast_group_source"></a> [ec2\_transit\_gateway\_multicast\_group\_source](#output\_ec2\_transit\_gateway\_multicast\_group\_source) | Transit Gateway |
| <a name="output_ec2_transit_gateway_peering_attachment"></a> [ec2\_transit\_gateway\_peering\_attachment](#output\_ec2\_transit\_gateway\_peering\_attachment) | Transit Gateway |
| <a name="output_ec2_transit_gateway_peering_attachment_accepter"></a> [ec2\_transit\_gateway\_peering\_attachment\_accepter](#output\_ec2\_transit\_gateway\_peering\_attachment\_accepter) | Transit Gateway |
| <a name="output_ec2_transit_gateway_policy_table"></a> [ec2\_transit\_gateway\_policy\_table](#output\_ec2\_transit\_gateway\_policy\_table) | Transit Gateway |
| <a name="output_ec2_transit_gateway_policy_table_association"></a> [ec2\_transit\_gateway\_policy\_table\_association](#output\_ec2\_transit\_gateway\_policy\_table\_association) | Transit Gateway |
| <a name="output_ec2_transit_gateway_prefix_list_reference"></a> [ec2\_transit\_gateway\_prefix\_list\_reference](#output\_ec2\_transit\_gateway\_prefix\_list\_reference) | Transit Gateway |
| <a name="output_ec2_transit_gateway_route"></a> [ec2\_transit\_gateway\_route](#output\_ec2\_transit\_gateway\_route) | Transit Gateway |
| <a name="output_ec2_transit_gateway_route_table"></a> [ec2\_transit\_gateway\_route\_table](#output\_ec2\_transit\_gateway\_route\_table) | Transit Gateway |
| <a name="output_ec2_transit_gateway_route_table_association"></a> [ec2\_transit\_gateway\_route\_table\_association](#output\_ec2\_transit\_gateway\_route\_table\_association) | Transit Gateway |
| <a name="output_ec2_transit_gateway_route_table_propagation"></a> [ec2\_transit\_gateway\_route\_table\_propagation](#output\_ec2\_transit\_gateway\_route\_table\_propagation) | Transit Gateway |
| <a name="output_ec2_transit_gateway_vpc_attachment"></a> [ec2\_transit\_gateway\_vpc\_attachment](#output\_ec2\_transit\_gateway\_vpc\_attachment) | Transit Gateway |
| <a name="output_ec2_transit_gateway_vpc_attachment_accepter"></a> [ec2\_transit\_gateway\_vpc\_attachment\_accepter](#output\_ec2\_transit\_gateway\_vpc\_attachment\_accepter) | Transit Gateway |
| <a name="output_ecr_account_setting"></a> [ecr\_account\_setting](#output\_ecr\_account\_setting) | Elastic Container Registry |
| <a name="output_ecr_lifecycle_policy"></a> [ecr\_lifecycle\_policy](#output\_ecr\_lifecycle\_policy) | Elastic Container Registry |
| <a name="output_ecr_pull_through_cache_rule"></a> [ecr\_pull\_through\_cache\_rule](#output\_ecr\_pull\_through\_cache\_rule) | Elastic Container Registry |
| <a name="output_ecr_registry_policy"></a> [ecr\_registry\_policy](#output\_ecr\_registry\_policy) | Elastic Container Registry |
| <a name="output_ecr_registry_scanning_configuration"></a> [ecr\_registry\_scanning\_configuration](#output\_ecr\_registry\_scanning\_configuration) | Elastic Container Registry |
| <a name="output_ecr_replication_configuration"></a> [ecr\_replication\_configuration](#output\_ecr\_replication\_configuration) | Elastic Container Registry |
| <a name="output_ecr_repository"></a> [ecr\_repository](#output\_ecr\_repository) | Elastic Container Registry |
| <a name="output_ecr_repository_creation_template"></a> [ecr\_repository\_creation\_template](#output\_ecr\_repository\_creation\_template) | Elastic Container Registry |
| <a name="output_ecr_repository_policy"></a> [ecr\_repository\_policy](#output\_ecr\_repository\_policy) | Elastic Container Registry |
| <a name="output_ecrpublic_repository"></a> [ecrpublic\_repository](#output\_ecrpublic\_repository) | ECR Public |
| <a name="output_ecrpublic_repository_policy"></a> [ecrpublic\_repository\_policy](#output\_ecrpublic\_repository\_policy) | ECR Public |
| <a name="output_ecs_account_setting_default"></a> [ecs\_account\_setting\_default](#output\_ecs\_account\_setting\_default) | Elastic Container |
| <a name="output_ecs_capacity_provider"></a> [ecs\_capacity\_provider](#output\_ecs\_capacity\_provider) | Elastic Container |
| <a name="output_ecs_cluster"></a> [ecs\_cluster](#output\_ecs\_cluster) | Elastic Container |
| <a name="output_ecs_cluster_capacity_providers"></a> [ecs\_cluster\_capacity\_providers](#output\_ecs\_cluster\_capacity\_providers) | Elastic Container |
| <a name="output_ecs_service"></a> [ecs\_service](#output\_ecs\_service) | Elastic Container |
| <a name="output_ecs_tag"></a> [ecs\_tag](#output\_ecs\_tag) | Elastic Container |
| <a name="output_ecs_task_definition"></a> [ecs\_task\_definition](#output\_ecs\_task\_definition) | Elastic Container |
| <a name="output_ecs_task_set"></a> [ecs\_task\_set](#output\_ecs\_task\_set) | Elastic Container |
| <a name="output_efs_access_point"></a> [efs\_access\_point](#output\_efs\_access\_point) | Elastic File System |
| <a name="output_efs_backup_policy"></a> [efs\_backup\_policy](#output\_efs\_backup\_policy) | Elastic File System |
| <a name="output_efs_file_system"></a> [efs\_file\_system](#output\_efs\_file\_system) | Elastic File System |
| <a name="output_efs_file_system_policy"></a> [efs\_file\_system\_policy](#output\_efs\_file\_system\_policy) | Elastic File System |
| <a name="output_efs_mount_target"></a> [efs\_mount\_target](#output\_efs\_mount\_target) | Elastic File System |
| <a name="output_efs_replication_configuration"></a> [efs\_replication\_configuration](#output\_efs\_replication\_configuration) | Elastic File System |
| <a name="output_egress_only_internet_gateway"></a> [egress\_only\_internet\_gateway](#output\_egress\_only\_internet\_gateway) | Virtual Private Cloud |
| <a name="output_eip"></a> [eip](#output\_eip) | Elastic Compute Cloud |
| <a name="output_eip_association"></a> [eip\_association](#output\_eip\_association) | Elastic Compute Cloud |
| <a name="output_eip_domain_name"></a> [eip\_domain\_name](#output\_eip\_domain\_name) | Elastic Compute Cloud |
| <a name="output_eks_access_entry"></a> [eks\_access\_entry](#output\_eks\_access\_entry) | Elastic Kubernetes |
| <a name="output_eks_access_policy_association"></a> [eks\_access\_policy\_association](#output\_eks\_access\_policy\_association) | Elastic Kubernetes |
| <a name="output_eks_addon"></a> [eks\_addon](#output\_eks\_addon) | Elastic Kubernetes |
| <a name="output_eks_cluster"></a> [eks\_cluster](#output\_eks\_cluster) | Elastic Kubernetes |
| <a name="output_eks_fargate_profile"></a> [eks\_fargate\_profile](#output\_eks\_fargate\_profile) | Elastic Kubernetes |
| <a name="output_eks_identity_provider_config"></a> [eks\_identity\_provider\_config](#output\_eks\_identity\_provider\_config) | Elastic Kubernetes |
| <a name="output_eks_node_group"></a> [eks\_node\_group](#output\_eks\_node\_group) | Elastic Kubernetes |
| <a name="output_eks_pod_identity_association"></a> [eks\_pod\_identity\_association](#output\_eks\_pod\_identity\_association) | Elastic Kubernetes |
| <a name="output_elastic_beanstalk_application"></a> [elastic\_beanstalk\_application](#output\_elastic\_beanstalk\_application) | Elastic Beanstalk |
| <a name="output_elastic_beanstalk_application_version"></a> [elastic\_beanstalk\_application\_version](#output\_elastic\_beanstalk\_application\_version) | Elastic Beanstalk |
| <a name="output_elastic_beanstalk_configuration_template"></a> [elastic\_beanstalk\_configuration\_template](#output\_elastic\_beanstalk\_configuration\_template) | Elastic Beanstalk |
| <a name="output_elastic_beanstalk_environment"></a> [elastic\_beanstalk\_environment](#output\_elastic\_beanstalk\_environment) | Elastic Beanstalk |
| <a name="output_elasticache_cluster"></a> [elasticache\_cluster](#output\_elasticache\_cluster) | ElastiCache |
| <a name="output_elasticache_global_replication_group"></a> [elasticache\_global\_replication\_group](#output\_elasticache\_global\_replication\_group) | ElastiCache |
| <a name="output_elasticache_parameter_group"></a> [elasticache\_parameter\_group](#output\_elasticache\_parameter\_group) | ElastiCache |
| <a name="output_elasticache_replication_group"></a> [elasticache\_replication\_group](#output\_elasticache\_replication\_group) | ElastiCache |
| <a name="output_elasticache_reserved_cache_node"></a> [elasticache\_reserved\_cache\_node](#output\_elasticache\_reserved\_cache\_node) | ElastiCache |
| <a name="output_elasticache_serverless_cache"></a> [elasticache\_serverless\_cache](#output\_elasticache\_serverless\_cache) | ElastiCache |
| <a name="output_elasticache_subnet_group"></a> [elasticache\_subnet\_group](#output\_elasticache\_subnet\_group) | ElastiCache |
| <a name="output_elasticache_user"></a> [elasticache\_user](#output\_elasticache\_user) | ElastiCache |
| <a name="output_elasticache_user_group"></a> [elasticache\_user\_group](#output\_elasticache\_user\_group) | ElastiCache |
| <a name="output_elasticache_user_group_association"></a> [elasticache\_user\_group\_association](#output\_elasticache\_user\_group\_association) | ElastiCache |
| <a name="output_elasticsearch_domain"></a> [elasticsearch\_domain](#output\_elasticsearch\_domain) | Elasticsearch |
| <a name="output_elasticsearch_domain_policy"></a> [elasticsearch\_domain\_policy](#output\_elasticsearch\_domain\_policy) | Elasticsearch |
| <a name="output_elasticsearch_domain_saml_options"></a> [elasticsearch\_domain\_saml\_options](#output\_elasticsearch\_domain\_saml\_options) | Elasticsearch |
| <a name="output_elasticsearch_vpc_endpoint"></a> [elasticsearch\_vpc\_endpoint](#output\_elasticsearch\_vpc\_endpoint) | Elasticsearch |
| <a name="output_elastictranscoder_pipeline"></a> [elastictranscoder\_pipeline](#output\_elastictranscoder\_pipeline) | Elastic Transcoder |
| <a name="output_elastictranscoder_preset"></a> [elastictranscoder\_preset](#output\_elastictranscoder\_preset) | Elastic Transcoder |
| <a name="output_elb"></a> [elb](#output\_elb) | ELB Classic |
| <a name="output_elb_attachment"></a> [elb\_attachment](#output\_elb\_attachment) | ELB Classic |
| <a name="output_emr_block_public_access_configuration"></a> [emr\_block\_public\_access\_configuration](#output\_emr\_block\_public\_access\_configuration) | EMR |
| <a name="output_emr_cluster"></a> [emr\_cluster](#output\_emr\_cluster) | EMR |
| <a name="output_emr_instance_fleet"></a> [emr\_instance\_fleet](#output\_emr\_instance\_fleet) | EMR |
| <a name="output_emr_instance_group"></a> [emr\_instance\_group](#output\_emr\_instance\_group) | EMR |
| <a name="output_emr_managed_scaling_policy"></a> [emr\_managed\_scaling\_policy](#output\_emr\_managed\_scaling\_policy) | EMR |
| <a name="output_emr_security_configuration"></a> [emr\_security\_configuration](#output\_emr\_security\_configuration) | EMR |
| <a name="output_emr_studio"></a> [emr\_studio](#output\_emr\_studio) | EMR |
| <a name="output_emr_studio_session_mapping"></a> [emr\_studio\_session\_mapping](#output\_emr\_studio\_session\_mapping) | EMR |
| <a name="output_emrcontainers_job_template"></a> [emrcontainers\_job\_template](#output\_emrcontainers\_job\_template) | EMR Containers |
| <a name="output_emrcontainers_virtual_cluster"></a> [emrcontainers\_virtual\_cluster](#output\_emrcontainers\_virtual\_cluster) | EMR Containers |
| <a name="output_emrserverless_application"></a> [emrserverless\_application](#output\_emrserverless\_application) | EMR Serverless |
| <a name="output_evidently_feature"></a> [evidently\_feature](#output\_evidently\_feature) | CloudWatch Evidently |
| <a name="output_evidently_launch"></a> [evidently\_launch](#output\_evidently\_launch) | CloudWatch Evidently |
| <a name="output_evidently_project"></a> [evidently\_project](#output\_evidently\_project) | CloudWatch Evidently |
| <a name="output_evidently_segment"></a> [evidently\_segment](#output\_evidently\_segment) | CloudWatch Evidently |
| <a name="output_finspace_kx_cluster"></a> [finspace\_kx\_cluster](#output\_finspace\_kx\_cluster) | FinSpace |
| <a name="output_finspace_kx_database"></a> [finspace\_kx\_database](#output\_finspace\_kx\_database) | FinSpace |
| <a name="output_finspace_kx_dataview"></a> [finspace\_kx\_dataview](#output\_finspace\_kx\_dataview) | FinSpace |
| <a name="output_finspace_kx_environment"></a> [finspace\_kx\_environment](#output\_finspace\_kx\_environment) | FinSpace |
| <a name="output_finspace_kx_scaling_group"></a> [finspace\_kx\_scaling\_group](#output\_finspace\_kx\_scaling\_group) | FinSpace |
| <a name="output_finspace_kx_user"></a> [finspace\_kx\_user](#output\_finspace\_kx\_user) | FinSpace |
| <a name="output_finspace_kx_volume"></a> [finspace\_kx\_volume](#output\_finspace\_kx\_volume) | FinSpace |
| <a name="output_fis_experiment_template"></a> [fis\_experiment\_template](#output\_fis\_experiment\_template) | Fault Injection Simulator |
| <a name="output_flow_log"></a> [flow\_log](#output\_flow\_log) | Virtual Private Cloud |
| <a name="output_fms_admin_account"></a> [fms\_admin\_account](#output\_fms\_admin\_account) | Firewall Manager |
| <a name="output_fms_policy"></a> [fms\_policy](#output\_fms\_policy) | Firewall Manager |
| <a name="output_fms_resource_set"></a> [fms\_resource\_set](#output\_fms\_resource\_set) | Firewall Manager |
| <a name="output_fsx_backup"></a> [fsx\_backup](#output\_fsx\_backup) | FSx |
| <a name="output_fsx_data_repository_association"></a> [fsx\_data\_repository\_association](#output\_fsx\_data\_repository\_association) | FSx |
| <a name="output_fsx_file_cache"></a> [fsx\_file\_cache](#output\_fsx\_file\_cache) | FSx |
| <a name="output_fsx_lustre_file_system"></a> [fsx\_lustre\_file\_system](#output\_fsx\_lustre\_file\_system) | FSx |
| <a name="output_fsx_ontap_file_system"></a> [fsx\_ontap\_file\_system](#output\_fsx\_ontap\_file\_system) | FSx |
| <a name="output_fsx_ontap_storage_virtual_machine"></a> [fsx\_ontap\_storage\_virtual\_machine](#output\_fsx\_ontap\_storage\_virtual\_machine) | FSx |
| <a name="output_fsx_ontap_volume"></a> [fsx\_ontap\_volume](#output\_fsx\_ontap\_volume) | FSx |
| <a name="output_fsx_openzfs_file_system"></a> [fsx\_openzfs\_file\_system](#output\_fsx\_openzfs\_file\_system) | FSx |
| <a name="output_fsx_openzfs_snapshot"></a> [fsx\_openzfs\_snapshot](#output\_fsx\_openzfs\_snapshot) | FSx |
| <a name="output_fsx_openzfs_volume"></a> [fsx\_openzfs\_volume](#output\_fsx\_openzfs\_volume) | FSx |
| <a name="output_fsx_windows_file_system"></a> [fsx\_windows\_file\_system](#output\_fsx\_windows\_file\_system) | FSx |
| <a name="output_gamelift_alias"></a> [gamelift\_alias](#output\_gamelift\_alias) | GameLift |
| <a name="output_gamelift_build"></a> [gamelift\_build](#output\_gamelift\_build) | GameLift |
| <a name="output_gamelift_fleet"></a> [gamelift\_fleet](#output\_gamelift\_fleet) | GameLift |
| <a name="output_gamelift_game_server_group"></a> [gamelift\_game\_server\_group](#output\_gamelift\_game\_server\_group) | GameLift |
| <a name="output_gamelift_game_session_queue"></a> [gamelift\_game\_session\_queue](#output\_gamelift\_game\_session\_queue) | GameLift |
| <a name="output_gamelift_script"></a> [gamelift\_script](#output\_gamelift\_script) | GameLift |
| <a name="output_glacier_vault"></a> [glacier\_vault](#output\_glacier\_vault) | S3 Glacier |
| <a name="output_glacier_vault_lock"></a> [glacier\_vault\_lock](#output\_glacier\_vault\_lock) | S3 Glacier |
| <a name="output_globalaccelerator_accelerator"></a> [globalaccelerator\_accelerator](#output\_globalaccelerator\_accelerator) | Global Accelerator |
| <a name="output_globalaccelerator_cross_account_attachment"></a> [globalaccelerator\_cross\_account\_attachment](#output\_globalaccelerator\_cross\_account\_attachment) | Global Accelerator |
| <a name="output_globalaccelerator_custom_routing_accelerator"></a> [globalaccelerator\_custom\_routing\_accelerator](#output\_globalaccelerator\_custom\_routing\_accelerator) | Global Accelerator |
| <a name="output_globalaccelerator_custom_routing_endpoint_group"></a> [globalaccelerator\_custom\_routing\_endpoint\_group](#output\_globalaccelerator\_custom\_routing\_endpoint\_group) | Global Accelerator |
| <a name="output_globalaccelerator_custom_routing_listener"></a> [globalaccelerator\_custom\_routing\_listener](#output\_globalaccelerator\_custom\_routing\_listener) | Global Accelerator |
| <a name="output_globalaccelerator_endpoint_group"></a> [globalaccelerator\_endpoint\_group](#output\_globalaccelerator\_endpoint\_group) | Global Accelerator |
| <a name="output_globalaccelerator_listener"></a> [globalaccelerator\_listener](#output\_globalaccelerator\_listener) | Global Accelerator |
| <a name="output_glue_catalog_database"></a> [glue\_catalog\_database](#output\_glue\_catalog\_database) | Glue |
| <a name="output_glue_catalog_table"></a> [glue\_catalog\_table](#output\_glue\_catalog\_table) | Glue |
| <a name="output_glue_catalog_table_optimizer"></a> [glue\_catalog\_table\_optimizer](#output\_glue\_catalog\_table\_optimizer) | Glue |
| <a name="output_glue_classifier"></a> [glue\_classifier](#output\_glue\_classifier) | Glue |
| <a name="output_glue_connection"></a> [glue\_connection](#output\_glue\_connection) | Glue |
| <a name="output_glue_crawler"></a> [glue\_crawler](#output\_glue\_crawler) | Glue |
| <a name="output_glue_data_catalog_encryption_settings"></a> [glue\_data\_catalog\_encryption\_settings](#output\_glue\_data\_catalog\_encryption\_settings) | Glue |
| <a name="output_glue_data_quality_ruleset"></a> [glue\_data\_quality\_ruleset](#output\_glue\_data\_quality\_ruleset) | Glue |
| <a name="output_glue_dev_endpoint"></a> [glue\_dev\_endpoint](#output\_glue\_dev\_endpoint) | Glue |
| <a name="output_glue_job"></a> [glue\_job](#output\_glue\_job) | Glue |
| <a name="output_glue_ml_transform"></a> [glue\_ml\_transform](#output\_glue\_ml\_transform) | Glue |
| <a name="output_glue_partition"></a> [glue\_partition](#output\_glue\_partition) | Glue |
| <a name="output_glue_partition_index"></a> [glue\_partition\_index](#output\_glue\_partition\_index) | Glue |
| <a name="output_glue_registry"></a> [glue\_registry](#output\_glue\_registry) | Glue |
| <a name="output_glue_resource_policy"></a> [glue\_resource\_policy](#output\_glue\_resource\_policy) | Glue |
| <a name="output_glue_schema"></a> [glue\_schema](#output\_glue\_schema) | Glue |
| <a name="output_glue_security_configuration"></a> [glue\_security\_configuration](#output\_glue\_security\_configuration) | Glue |
| <a name="output_glue_trigger"></a> [glue\_trigger](#output\_glue\_trigger) | Glue |
| <a name="output_glue_user_defined_function"></a> [glue\_user\_defined\_function](#output\_glue\_user\_defined\_function) | Glue |
| <a name="output_glue_workflow"></a> [glue\_workflow](#output\_glue\_workflow) | Glue |
| <a name="output_grafana_license_association"></a> [grafana\_license\_association](#output\_grafana\_license\_association) | Managed Grafana |
| <a name="output_grafana_role_association"></a> [grafana\_role\_association](#output\_grafana\_role\_association) | Managed Grafana |
| <a name="output_grafana_workspace"></a> [grafana\_workspace](#output\_grafana\_workspace) | Managed Grafana |
| <a name="output_grafana_workspace_api_key"></a> [grafana\_workspace\_api\_key](#output\_grafana\_workspace\_api\_key) | Managed Grafana |
| <a name="output_grafana_workspace_saml_configuration"></a> [grafana\_workspace\_saml\_configuration](#output\_grafana\_workspace\_saml\_configuration) | Managed Grafana |
| <a name="output_grafana_workspace_service_account"></a> [grafana\_workspace\_service\_account](#output\_grafana\_workspace\_service\_account) | Managed Grafana |
| <a name="output_grafana_workspace_service_account_token"></a> [grafana\_workspace\_service\_account\_token](#output\_grafana\_workspace\_service\_account\_token) | Managed Grafana |
| <a name="output_guardduty_detector"></a> [guardduty\_detector](#output\_guardduty\_detector) | GuardDuty |
| <a name="output_guardduty_detector_feature"></a> [guardduty\_detector\_feature](#output\_guardduty\_detector\_feature) | GuardDuty |
| <a name="output_guardduty_filter"></a> [guardduty\_filter](#output\_guardduty\_filter) | GuardDuty |
| <a name="output_guardduty_invite_accepter"></a> [guardduty\_invite\_accepter](#output\_guardduty\_invite\_accepter) | GuardDuty |
| <a name="output_guardduty_ipset"></a> [guardduty\_ipset](#output\_guardduty\_ipset) | GuardDuty |
| <a name="output_guardduty_malware_protection_plan"></a> [guardduty\_malware\_protection\_plan](#output\_guardduty\_malware\_protection\_plan) | GuardDuty |
| <a name="output_guardduty_member"></a> [guardduty\_member](#output\_guardduty\_member) | GuardDuty |
| <a name="output_guardduty_member_detector_feature"></a> [guardduty\_member\_detector\_feature](#output\_guardduty\_member\_detector\_feature) | GuardDuty |
| <a name="output_guardduty_organization_admin_account"></a> [guardduty\_organization\_admin\_account](#output\_guardduty\_organization\_admin\_account) | GuardDuty |
| <a name="output_guardduty_organization_configuration"></a> [guardduty\_organization\_configuration](#output\_guardduty\_organization\_configuration) | GuardDuty |
| <a name="output_guardduty_organization_configuration_feature"></a> [guardduty\_organization\_configuration\_feature](#output\_guardduty\_organization\_configuration\_feature) | GuardDuty |
| <a name="output_guardduty_publishing_destination"></a> [guardduty\_publishing\_destination](#output\_guardduty\_publishing\_destination) | GuardDuty |
| <a name="output_guardduty_threatintelset"></a> [guardduty\_threatintelset](#output\_guardduty\_threatintelset) | GuardDuty |
| <a name="output_iam_access_key"></a> [iam\_access\_key](#output\_iam\_access\_key) | Identity & Access Management |
| <a name="output_iam_account_alias"></a> [iam\_account\_alias](#output\_iam\_account\_alias) | Identity & Access Management |
| <a name="output_iam_account_password_policy"></a> [iam\_account\_password\_policy](#output\_iam\_account\_password\_policy) | Identity & Access Management |
| <a name="output_iam_group"></a> [iam\_group](#output\_iam\_group) | Identity & Access Management |
| <a name="output_iam_group_membership"></a> [iam\_group\_membership](#output\_iam\_group\_membership) | Identity & Access Management |
| <a name="output_iam_group_policies_exclusive"></a> [iam\_group\_policies\_exclusive](#output\_iam\_group\_policies\_exclusive) | Identity & Access Management |
| <a name="output_iam_group_policy"></a> [iam\_group\_policy](#output\_iam\_group\_policy) | Identity & Access Management |
| <a name="output_iam_group_policy_attachment"></a> [iam\_group\_policy\_attachment](#output\_iam\_group\_policy\_attachment) | Identity & Access Management |
| <a name="output_iam_group_policy_attachments_exclusive"></a> [iam\_group\_policy\_attachments\_exclusive](#output\_iam\_group\_policy\_attachments\_exclusive) | Identity & Access Management |
| <a name="output_iam_instance_profile"></a> [iam\_instance\_profile](#output\_iam\_instance\_profile) | Identity & Access Management |
| <a name="output_iam_openid_connect_provider"></a> [iam\_openid\_connect\_provider](#output\_iam\_openid\_connect\_provider) | Identity & Access Management |
| <a name="output_iam_organizations_features"></a> [iam\_organizations\_features](#output\_iam\_organizations\_features) | Identity & Access Management |
| <a name="output_iam_policy"></a> [iam\_policy](#output\_iam\_policy) | Identity & Access Management |
| <a name="output_iam_policy_attachment"></a> [iam\_policy\_attachment](#output\_iam\_policy\_attachment) | Identity & Access Management |
| <a name="output_iam_role"></a> [iam\_role](#output\_iam\_role) | Identity & Access Management |
| <a name="output_iam_role_policies_exclusive"></a> [iam\_role\_policies\_exclusive](#output\_iam\_role\_policies\_exclusive) | Identity & Access Management |
| <a name="output_iam_role_policy"></a> [iam\_role\_policy](#output\_iam\_role\_policy) | Identity & Access Management |
| <a name="output_iam_role_policy_attachment"></a> [iam\_role\_policy\_attachment](#output\_iam\_role\_policy\_attachment) | Identity & Access Management |
| <a name="output_iam_role_policy_attachments_exclusive"></a> [iam\_role\_policy\_attachments\_exclusive](#output\_iam\_role\_policy\_attachments\_exclusive) | Identity & Access Management |
| <a name="output_iam_saml_provider"></a> [iam\_saml\_provider](#output\_iam\_saml\_provider) | Identity & Access Management |
| <a name="output_iam_security_token_service_preferences"></a> [iam\_security\_token\_service\_preferences](#output\_iam\_security\_token\_service\_preferences) | Identity & Access Management |
| <a name="output_iam_server_certificate"></a> [iam\_server\_certificate](#output\_iam\_server\_certificate) | Identity & Access Management |
| <a name="output_iam_service_linked_role"></a> [iam\_service\_linked\_role](#output\_iam\_service\_linked\_role) | Identity & Access Management |
| <a name="output_iam_service_specific_credential"></a> [iam\_service\_specific\_credential](#output\_iam\_service\_specific\_credential) | Identity & Access Management |
| <a name="output_iam_signing_certificate"></a> [iam\_signing\_certificate](#output\_iam\_signing\_certificate) | Identity & Access Management |
| <a name="output_iam_user"></a> [iam\_user](#output\_iam\_user) | Identity & Access Management |
| <a name="output_iam_user_group_membership"></a> [iam\_user\_group\_membership](#output\_iam\_user\_group\_membership) | Identity & Access Management |
| <a name="output_iam_user_login_profile"></a> [iam\_user\_login\_profile](#output\_iam\_user\_login\_profile) | Identity & Access Management |
| <a name="output_iam_user_policies_exclusive"></a> [iam\_user\_policies\_exclusive](#output\_iam\_user\_policies\_exclusive) | Identity & Access Management |
| <a name="output_iam_user_policy"></a> [iam\_user\_policy](#output\_iam\_user\_policy) | Identity & Access Management |
| <a name="output_iam_user_policy_attachment"></a> [iam\_user\_policy\_attachment](#output\_iam\_user\_policy\_attachment) | Identity & Access Management |
| <a name="output_iam_user_policy_attachments_exclusive"></a> [iam\_user\_policy\_attachments\_exclusive](#output\_iam\_user\_policy\_attachments\_exclusive) | Identity & Access Management |
| <a name="output_iam_user_ssh_key"></a> [iam\_user\_ssh\_key](#output\_iam\_user\_ssh\_key) | Identity & Access Management |
| <a name="output_iam_virtual_mfa_device"></a> [iam\_virtual\_mfa\_device](#output\_iam\_virtual\_mfa\_device) | Identity & Access Management |
| <a name="output_identitystore_group"></a> [identitystore\_group](#output\_identitystore\_group) | SSO Identity Store |
| <a name="output_identitystore_group_membership"></a> [identitystore\_group\_membership](#output\_identitystore\_group\_membership) | SSO Identity Store |
| <a name="output_identitystore_user"></a> [identitystore\_user](#output\_identitystore\_user) | SSO Identity Store |
| <a name="output_imagebuilder_component"></a> [imagebuilder\_component](#output\_imagebuilder\_component) | EC2 Image Builder |
| <a name="output_imagebuilder_container_recipe"></a> [imagebuilder\_container\_recipe](#output\_imagebuilder\_container\_recipe) | EC2 Image Builder |
| <a name="output_imagebuilder_distribution_configuration"></a> [imagebuilder\_distribution\_configuration](#output\_imagebuilder\_distribution\_configuration) | EC2 Image Builder |
| <a name="output_imagebuilder_image"></a> [imagebuilder\_image](#output\_imagebuilder\_image) | EC2 Image Builder |
| <a name="output_imagebuilder_image_pipeline"></a> [imagebuilder\_image\_pipeline](#output\_imagebuilder\_image\_pipeline) | EC2 Image Builder |
| <a name="output_imagebuilder_image_recipe"></a> [imagebuilder\_image\_recipe](#output\_imagebuilder\_image\_recipe) | EC2 Image Builder |
| <a name="output_imagebuilder_infrastructure_configuration"></a> [imagebuilder\_infrastructure\_configuration](#output\_imagebuilder\_infrastructure\_configuration) | EC2 Image Builder |
| <a name="output_imagebuilder_lifecycle_policy"></a> [imagebuilder\_lifecycle\_policy](#output\_imagebuilder\_lifecycle\_policy) | EC2 Image Builder |
| <a name="output_imagebuilder_workflow"></a> [imagebuilder\_workflow](#output\_imagebuilder\_workflow) | EC2 Image Builder |
| <a name="output_inspector2_delegated_admin_account"></a> [inspector2\_delegated\_admin\_account](#output\_inspector2\_delegated\_admin\_account) | Inspector |
| <a name="output_inspector2_enabler"></a> [inspector2\_enabler](#output\_inspector2\_enabler) | Inspector |
| <a name="output_inspector2_member_association"></a> [inspector2\_member\_association](#output\_inspector2\_member\_association) | Inspector |
| <a name="output_inspector2_organization_configuration"></a> [inspector2\_organization\_configuration](#output\_inspector2\_organization\_configuration) | Inspector |
| <a name="output_inspector_assessment_target"></a> [inspector\_assessment\_target](#output\_inspector\_assessment\_target) | Inspector Classic |
| <a name="output_inspector_assessment_template"></a> [inspector\_assessment\_template](#output\_inspector\_assessment\_template) | Inspector Classic |
| <a name="output_inspector_resource_group"></a> [inspector\_resource\_group](#output\_inspector\_resource\_group) | Inspector Classic |
| <a name="output_instance"></a> [instance](#output\_instance) | Elastic Compute Cloud |
| <a name="output_internet_gateway"></a> [internet\_gateway](#output\_internet\_gateway) | Virtual Private Cloud |
| <a name="output_internet_gateway_attachment"></a> [internet\_gateway\_attachment](#output\_internet\_gateway\_attachment) | Virtual Private Cloud |
| <a name="output_internetmonitor_monitor"></a> [internetmonitor\_monitor](#output\_internetmonitor\_monitor) | CloudWatch Internet Monitor |
| <a name="output_iot_authorizer"></a> [iot\_authorizer](#output\_iot\_authorizer) | IoT Core |
| <a name="output_iot_billing_group"></a> [iot\_billing\_group](#output\_iot\_billing\_group) | IoT Core |
| <a name="output_iot_ca_certificate"></a> [iot\_ca\_certificate](#output\_iot\_ca\_certificate) | IoT Core |
| <a name="output_iot_certificate"></a> [iot\_certificate](#output\_iot\_certificate) | IoT Core |
| <a name="output_iot_domain_configuration"></a> [iot\_domain\_configuration](#output\_iot\_domain\_configuration) | IoT Core |
| <a name="output_iot_event_configurations"></a> [iot\_event\_configurations](#output\_iot\_event\_configurations) | IoT Core |
| <a name="output_iot_indexing_configuration"></a> [iot\_indexing\_configuration](#output\_iot\_indexing\_configuration) | IoT Core |
| <a name="output_iot_logging_options"></a> [iot\_logging\_options](#output\_iot\_logging\_options) | IoT Core |
| <a name="output_iot_policy"></a> [iot\_policy](#output\_iot\_policy) | IoT Core |
| <a name="output_iot_policy_attachment"></a> [iot\_policy\_attachment](#output\_iot\_policy\_attachment) | IoT Core |
| <a name="output_iot_provisioning_template"></a> [iot\_provisioning\_template](#output\_iot\_provisioning\_template) | IoT Core |
| <a name="output_iot_role_alias"></a> [iot\_role\_alias](#output\_iot\_role\_alias) | IoT Core |
| <a name="output_iot_thing"></a> [iot\_thing](#output\_iot\_thing) | IoT Core |
| <a name="output_iot_thing_group"></a> [iot\_thing\_group](#output\_iot\_thing\_group) | IoT Core |
| <a name="output_iot_thing_group_membership"></a> [iot\_thing\_group\_membership](#output\_iot\_thing\_group\_membership) | IoT Core |
| <a name="output_iot_thing_principal_attachment"></a> [iot\_thing\_principal\_attachment](#output\_iot\_thing\_principal\_attachment) | IoT Core |
| <a name="output_iot_thing_type"></a> [iot\_thing\_type](#output\_iot\_thing\_type) | IoT Core |
| <a name="output_iot_topic_rule"></a> [iot\_topic\_rule](#output\_iot\_topic\_rule) | IoT Core |
| <a name="output_iot_topic_rule_destination"></a> [iot\_topic\_rule\_destination](#output\_iot\_topic\_rule\_destination) | IoT Core |
| <a name="output_ivs_channel"></a> [ivs\_channel](#output\_ivs\_channel) | Interactive Video |
| <a name="output_ivs_playback_key_pair"></a> [ivs\_playback\_key\_pair](#output\_ivs\_playback\_key\_pair) | Interactive Video |
| <a name="output_ivs_recording_configuration"></a> [ivs\_recording\_configuration](#output\_ivs\_recording\_configuration) | Interactive Video |
| <a name="output_ivschat_logging_configuration"></a> [ivschat\_logging\_configuration](#output\_ivschat\_logging\_configuration) | Interactive Video |
| <a name="output_ivschat_room"></a> [ivschat\_room](#output\_ivschat\_room) | Interactive Video |
| <a name="output_kendra_data_source"></a> [kendra\_data\_source](#output\_kendra\_data\_source) | Kendra |
| <a name="output_kendra_experience"></a> [kendra\_experience](#output\_kendra\_experience) | Kendra |
| <a name="output_kendra_faq"></a> [kendra\_faq](#output\_kendra\_faq) | Kendra |
| <a name="output_kendra_index"></a> [kendra\_index](#output\_kendra\_index) | Kendra |
| <a name="output_kendra_query_suggestions_block_list"></a> [kendra\_query\_suggestions\_block\_list](#output\_kendra\_query\_suggestions\_block\_list) | Kendra |
| <a name="output_kendra_thesaurus"></a> [kendra\_thesaurus](#output\_kendra\_thesaurus) | Kendra |
| <a name="output_key_pair"></a> [key\_pair](#output\_key\_pair) | Elastic Compute Cloud |
| <a name="output_keyspaces_keyspace"></a> [keyspaces\_keyspace](#output\_keyspaces\_keyspace) | for Apache Cassandra |
| <a name="output_keyspaces_table"></a> [keyspaces\_table](#output\_keyspaces\_table) | for Apache Cassandra |
| <a name="output_kinesis_analytics_application"></a> [kinesis\_analytics\_application](#output\_kinesis\_analytics\_application) | Kinesis Analytics |
| <a name="output_kinesis_firehose_delivery_stream"></a> [kinesis\_firehose\_delivery\_stream](#output\_kinesis\_firehose\_delivery\_stream) | Kinesis Firehose |
| <a name="output_kinesis_resource_policy"></a> [kinesis\_resource\_policy](#output\_kinesis\_resource\_policy) | Kinesis |
| <a name="output_kinesis_stream"></a> [kinesis\_stream](#output\_kinesis\_stream) | Kinesis |
| <a name="output_kinesis_stream_consumer"></a> [kinesis\_stream\_consumer](#output\_kinesis\_stream\_consumer) | Kinesis |
| <a name="output_kinesis_video_stream"></a> [kinesis\_video\_stream](#output\_kinesis\_video\_stream) | Kinesis Video |
| <a name="output_kinesisanalyticsv2_application"></a> [kinesisanalyticsv2\_application](#output\_kinesisanalyticsv2\_application) | Kinesis Analytics V2 |
| <a name="output_kinesisanalyticsv2_application_snapshot"></a> [kinesisanalyticsv2\_application\_snapshot](#output\_kinesisanalyticsv2\_application\_snapshot) | Kinesis Analytics V2 |
| <a name="output_kms_alias"></a> [kms\_alias](#output\_kms\_alias) | Key Management |
| <a name="output_kms_ciphertext"></a> [kms\_ciphertext](#output\_kms\_ciphertext) | Key Management |
| <a name="output_kms_custom_key_store"></a> [kms\_custom\_key\_store](#output\_kms\_custom\_key\_store) | Key Management |
| <a name="output_kms_external_key"></a> [kms\_external\_key](#output\_kms\_external\_key) | Key Management |
| <a name="output_kms_grant"></a> [kms\_grant](#output\_kms\_grant) | Key Management |
| <a name="output_kms_key"></a> [kms\_key](#output\_kms\_key) | Key Management |
| <a name="output_kms_key_policy"></a> [kms\_key\_policy](#output\_kms\_key\_policy) | Key Management |
| <a name="output_kms_replica_external_key"></a> [kms\_replica\_external\_key](#output\_kms\_replica\_external\_key) | Key Management |
| <a name="output_kms_replica_key"></a> [kms\_replica\_key](#output\_kms\_replica\_key) | Key Management |
| <a name="output_lakeformation_data_cells_filter"></a> [lakeformation\_data\_cells\_filter](#output\_lakeformation\_data\_cells\_filter) | Lake Formation |
| <a name="output_lakeformation_data_lake_settings"></a> [lakeformation\_data\_lake\_settings](#output\_lakeformation\_data\_lake\_settings) | Lake Formation |
| <a name="output_lakeformation_lf_tag"></a> [lakeformation\_lf\_tag](#output\_lakeformation\_lf\_tag) | Lake Formation |
| <a name="output_lakeformation_opt_in"></a> [lakeformation\_opt\_in](#output\_lakeformation\_opt\_in) | Lake Formation |
| <a name="output_lakeformation_permissions"></a> [lakeformation\_permissions](#output\_lakeformation\_permissions) | Lake Formation |
| <a name="output_lakeformation_resource"></a> [lakeformation\_resource](#output\_lakeformation\_resource) | Lake Formation |
| <a name="output_lakeformation_resource_lf_tag"></a> [lakeformation\_resource\_lf\_tag](#output\_lakeformation\_resource\_lf\_tag) | Lake Formation |
| <a name="output_lakeformation_resource_lf_tags"></a> [lakeformation\_resource\_lf\_tags](#output\_lakeformation\_resource\_lf\_tags) | Lake Formation |
| <a name="output_lambda_alias"></a> [lambda\_alias](#output\_lambda\_alias) | Lambda |
| <a name="output_lambda_code_signing_config"></a> [lambda\_code\_signing\_config](#output\_lambda\_code\_signing\_config) | Lambda |
| <a name="output_lambda_event_source_mapping"></a> [lambda\_event\_source\_mapping](#output\_lambda\_event\_source\_mapping) | Lambda |
| <a name="output_lambda_function"></a> [lambda\_function](#output\_lambda\_function) | Lambda |
| <a name="output_lambda_function_event_invoke_config"></a> [lambda\_function\_event\_invoke\_config](#output\_lambda\_function\_event\_invoke\_config) | Lambda |
| <a name="output_lambda_function_recursion_config"></a> [lambda\_function\_recursion\_config](#output\_lambda\_function\_recursion\_config) | Lambda |
| <a name="output_lambda_function_url"></a> [lambda\_function\_url](#output\_lambda\_function\_url) | Lambda |
| <a name="output_lambda_invocation"></a> [lambda\_invocation](#output\_lambda\_invocation) | Lambda |
| <a name="output_lambda_layer_version"></a> [lambda\_layer\_version](#output\_lambda\_layer\_version) | Lambda |
| <a name="output_lambda_layer_version_permission"></a> [lambda\_layer\_version\_permission](#output\_lambda\_layer\_version\_permission) | Lambda |
| <a name="output_lambda_permission"></a> [lambda\_permission](#output\_lambda\_permission) | Lambda |
| <a name="output_lambda_provisioned_concurrency_config"></a> [lambda\_provisioned\_concurrency\_config](#output\_lambda\_provisioned\_concurrency\_config) | Lambda |
| <a name="output_lambda_runtime_management_config"></a> [lambda\_runtime\_management\_config](#output\_lambda\_runtime\_management\_config) | Lambda |
| <a name="output_launch_configuration"></a> [launch\_configuration](#output\_launch\_configuration) | Auto Scaling |
| <a name="output_launch_template"></a> [launch\_template](#output\_launch\_template) | Elastic Compute Cloud |
| <a name="output_lb"></a> [lb](#output\_lb) | Elastic Load Balancing |
| <a name="output_lb_cookie_stickiness_policy"></a> [lb\_cookie\_stickiness\_policy](#output\_lb\_cookie\_stickiness\_policy) | ELB Classic |
| <a name="output_lb_listener"></a> [lb\_listener](#output\_lb\_listener) | Elastic Load Balancing |
| <a name="output_lb_listener_certificate"></a> [lb\_listener\_certificate](#output\_lb\_listener\_certificate) | Elastic Load Balancing |
| <a name="output_lb_listener_rule"></a> [lb\_listener\_rule](#output\_lb\_listener\_rule) | Elastic Load Balancing |
| <a name="output_lb_ssl_negotiation_policy"></a> [lb\_ssl\_negotiation\_policy](#output\_lb\_ssl\_negotiation\_policy) | ELB Classic |
| <a name="output_lb_target_group"></a> [lb\_target\_group](#output\_lb\_target\_group) | Elastic Load Balancing |
| <a name="output_lb_target_group_attachment"></a> [lb\_target\_group\_attachment](#output\_lb\_target\_group\_attachment) | Elastic Load Balancing |
| <a name="output_lb_trust_store"></a> [lb\_trust\_store](#output\_lb\_trust\_store) | Elastic Load Balancing |
| <a name="output_lb_trust_store_revocation"></a> [lb\_trust\_store\_revocation](#output\_lb\_trust\_store\_revocation) | Elastic Load Balancing |
| <a name="output_lex_bot"></a> [lex\_bot](#output\_lex\_bot) | Lex Model Building |
| <a name="output_lex_bot_alias"></a> [lex\_bot\_alias](#output\_lex\_bot\_alias) | Lex Model Building |
| <a name="output_lex_intent"></a> [lex\_intent](#output\_lex\_intent) | Lex Model Building |
| <a name="output_lex_slot_type"></a> [lex\_slot\_type](#output\_lex\_slot\_type) | Lex Model Building |
| <a name="output_lexv2models_bot"></a> [lexv2models\_bot](#output\_lexv2models\_bot) | Lex V2 Models |
| <a name="output_lexv2models_bot_locale"></a> [lexv2models\_bot\_locale](#output\_lexv2models\_bot\_locale) | Lex V2 Models |
| <a name="output_lexv2models_bot_version"></a> [lexv2models\_bot\_version](#output\_lexv2models\_bot\_version) | Lex V2 Models |
| <a name="output_lexv2models_intent"></a> [lexv2models\_intent](#output\_lexv2models\_intent) | Lex V2 Models |
| <a name="output_lexv2models_slot"></a> [lexv2models\_slot](#output\_lexv2models\_slot) | Lex V2 Models |
| <a name="output_lexv2models_slot_type"></a> [lexv2models\_slot\_type](#output\_lexv2models\_slot\_type) | Lex V2 Models |
| <a name="output_licensemanager_association"></a> [licensemanager\_association](#output\_licensemanager\_association) | License Manager |
| <a name="output_licensemanager_grant"></a> [licensemanager\_grant](#output\_licensemanager\_grant) | License Manager |
| <a name="output_licensemanager_grant_accepter"></a> [licensemanager\_grant\_accepter](#output\_licensemanager\_grant\_accepter) | License Manager |
| <a name="output_licensemanager_license_configuration"></a> [licensemanager\_license\_configuration](#output\_licensemanager\_license\_configuration) | License Manager |
| <a name="output_lightsail_bucket"></a> [lightsail\_bucket](#output\_lightsail\_bucket) | Lightsail |
| <a name="output_lightsail_bucket_access_key"></a> [lightsail\_bucket\_access\_key](#output\_lightsail\_bucket\_access\_key) | Lightsail |
| <a name="output_lightsail_bucket_resource_access"></a> [lightsail\_bucket\_resource\_access](#output\_lightsail\_bucket\_resource\_access) | Lightsail |
| <a name="output_lightsail_certificate"></a> [lightsail\_certificate](#output\_lightsail\_certificate) | Lightsail |
| <a name="output_lightsail_container_service"></a> [lightsail\_container\_service](#output\_lightsail\_container\_service) | Lightsail |
| <a name="output_lightsail_container_service_deployment_version"></a> [lightsail\_container\_service\_deployment\_version](#output\_lightsail\_container\_service\_deployment\_version) | Lightsail |
| <a name="output_lightsail_database"></a> [lightsail\_database](#output\_lightsail\_database) | Lightsail |
| <a name="output_lightsail_disk"></a> [lightsail\_disk](#output\_lightsail\_disk) | Lightsail |
| <a name="output_lightsail_disk_attachment"></a> [lightsail\_disk\_attachment](#output\_lightsail\_disk\_attachment) | Lightsail |
| <a name="output_lightsail_distribution"></a> [lightsail\_distribution](#output\_lightsail\_distribution) | Lightsail |
| <a name="output_lightsail_domain"></a> [lightsail\_domain](#output\_lightsail\_domain) | Lightsail |
| <a name="output_lightsail_domain_entry"></a> [lightsail\_domain\_entry](#output\_lightsail\_domain\_entry) | Lightsail |
| <a name="output_lightsail_instance"></a> [lightsail\_instance](#output\_lightsail\_instance) | Lightsail |
| <a name="output_lightsail_instance_public_ports"></a> [lightsail\_instance\_public\_ports](#output\_lightsail\_instance\_public\_ports) | Lightsail |
| <a name="output_lightsail_key_pair"></a> [lightsail\_key\_pair](#output\_lightsail\_key\_pair) | Lightsail |
| <a name="output_lightsail_lb"></a> [lightsail\_lb](#output\_lightsail\_lb) | Lightsail |
| <a name="output_lightsail_lb_attachment"></a> [lightsail\_lb\_attachment](#output\_lightsail\_lb\_attachment) | Lightsail |
| <a name="output_lightsail_lb_certificate"></a> [lightsail\_lb\_certificate](#output\_lightsail\_lb\_certificate) | Lightsail |
| <a name="output_lightsail_lb_certificate_attachment"></a> [lightsail\_lb\_certificate\_attachment](#output\_lightsail\_lb\_certificate\_attachment) | Lightsail |
| <a name="output_lightsail_lb_https_redirection_policy"></a> [lightsail\_lb\_https\_redirection\_policy](#output\_lightsail\_lb\_https\_redirection\_policy) | Lightsail |
| <a name="output_lightsail_lb_stickiness_policy"></a> [lightsail\_lb\_stickiness\_policy](#output\_lightsail\_lb\_stickiness\_policy) | Lightsail |
| <a name="output_lightsail_static_ip"></a> [lightsail\_static\_ip](#output\_lightsail\_static\_ip) | Lightsail |
| <a name="output_lightsail_static_ip_attachment"></a> [lightsail\_static\_ip\_attachment](#output\_lightsail\_static\_ip\_attachment) | Lightsail |
| <a name="output_load_balancer_backend_server_policy"></a> [load\_balancer\_backend\_server\_policy](#output\_load\_balancer\_backend\_server\_policy) | ELB Classic |
| <a name="output_load_balancer_listener_policy"></a> [load\_balancer\_listener\_policy](#output\_load\_balancer\_listener\_policy) | ELB Classic |
| <a name="output_load_balancer_policy"></a> [load\_balancer\_policy](#output\_load\_balancer\_policy) | ELB Classic |
| <a name="output_location_geofence_collection"></a> [location\_geofence\_collection](#output\_location\_geofence\_collection) | Location |
| <a name="output_location_map"></a> [location\_map](#output\_location\_map) | Location |
| <a name="output_location_place_index"></a> [location\_place\_index](#output\_location\_place\_index) | Location |
| <a name="output_location_route_calculator"></a> [location\_route\_calculator](#output\_location\_route\_calculator) | Location |
| <a name="output_location_tracker"></a> [location\_tracker](#output\_location\_tracker) | Location |
| <a name="output_location_tracker_association"></a> [location\_tracker\_association](#output\_location\_tracker\_association) | Location |
| <a name="output_m2_application"></a> [m2\_application](#output\_m2\_application) | Mainframe Modernization |
| <a name="output_m2_deployment"></a> [m2\_deployment](#output\_m2\_deployment) | Mainframe Modernization |
| <a name="output_m2_environment"></a> [m2\_environment](#output\_m2\_environment) | Mainframe Modernization |
| <a name="output_macie2_account"></a> [macie2\_account](#output\_macie2\_account) | Macie |
| <a name="output_macie2_classification_export_configuration"></a> [macie2\_classification\_export\_configuration](#output\_macie2\_classification\_export\_configuration) | Macie |
| <a name="output_macie2_classification_job"></a> [macie2\_classification\_job](#output\_macie2\_classification\_job) | Macie |
| <a name="output_macie2_custom_data_identifier"></a> [macie2\_custom\_data\_identifier](#output\_macie2\_custom\_data\_identifier) | Macie |
| <a name="output_macie2_findings_filter"></a> [macie2\_findings\_filter](#output\_macie2\_findings\_filter) | Macie |
| <a name="output_macie2_invitation_accepter"></a> [macie2\_invitation\_accepter](#output\_macie2\_invitation\_accepter) | Macie |
| <a name="output_macie2_member"></a> [macie2\_member](#output\_macie2\_member) | Macie |
| <a name="output_macie2_organization_admin_account"></a> [macie2\_organization\_admin\_account](#output\_macie2\_organization\_admin\_account) | Macie |
| <a name="output_macie2_organization_configuration"></a> [macie2\_organization\_configuration](#output\_macie2\_organization\_configuration) | Macie |
| <a name="output_main_route_table_association"></a> [main\_route\_table\_association](#output\_main\_route\_table\_association) | Virtual Private Cloud |
| <a name="output_media_convert_queue"></a> [media\_convert\_queue](#output\_media\_convert\_queue) | Elemental MediaConvert |
| <a name="output_media_package_channel"></a> [media\_package\_channel](#output\_media\_package\_channel) | Elemental MediaPackage |
| <a name="output_media_packagev2_channel_group"></a> [media\_packagev2\_channel\_group](#output\_media\_packagev2\_channel\_group) | Elemental MediaPackage Version 2 |
| <a name="output_media_store_container"></a> [media\_store\_container](#output\_media\_store\_container) | Elemental MediaStore |
| <a name="output_media_store_container_policy"></a> [media\_store\_container\_policy](#output\_media\_store\_container\_policy) | Elemental MediaStore |
| <a name="output_medialive_channel"></a> [medialive\_channel](#output\_medialive\_channel) | Elemental MediaLive |
| <a name="output_medialive_input"></a> [medialive\_input](#output\_medialive\_input) | Elemental MediaLive |
| <a name="output_medialive_input_security_group"></a> [medialive\_input\_security\_group](#output\_medialive\_input\_security\_group) | Elemental MediaLive |
| <a name="output_medialive_multiplex"></a> [medialive\_multiplex](#output\_medialive\_multiplex) | Elemental MediaLive |
| <a name="output_medialive_multiplex_program"></a> [medialive\_multiplex\_program](#output\_medialive\_multiplex\_program) | Elemental MediaLive |
| <a name="output_memorydb_acl"></a> [memorydb\_acl](#output\_memorydb\_acl) | MemoryDB |
| <a name="output_memorydb_cluster"></a> [memorydb\_cluster](#output\_memorydb\_cluster) | MemoryDB |
| <a name="output_memorydb_multi_region_cluster"></a> [memorydb\_multi\_region\_cluster](#output\_memorydb\_multi\_region\_cluster) | MemoryDB |
| <a name="output_memorydb_parameter_group"></a> [memorydb\_parameter\_group](#output\_memorydb\_parameter\_group) | MemoryDB |
| <a name="output_memorydb_snapshot"></a> [memorydb\_snapshot](#output\_memorydb\_snapshot) | MemoryDB |
| <a name="output_memorydb_subnet_group"></a> [memorydb\_subnet\_group](#output\_memorydb\_subnet\_group) | MemoryDB |
| <a name="output_memorydb_user"></a> [memorydb\_user](#output\_memorydb\_user) | MemoryDB |
| <a name="output_mq_broker"></a> [mq\_broker](#output\_mq\_broker) | MQ |
| <a name="output_mq_configuration"></a> [mq\_configuration](#output\_mq\_configuration) | MQ |
| <a name="output_msk_cluster"></a> [msk\_cluster](#output\_msk\_cluster) | Managed Streaming for Kafka |
| <a name="output_msk_cluster_policy"></a> [msk\_cluster\_policy](#output\_msk\_cluster\_policy) | Managed Streaming for Kafka |
| <a name="output_msk_configuration"></a> [msk\_configuration](#output\_msk\_configuration) | Managed Streaming for Kafka |
| <a name="output_msk_replicator"></a> [msk\_replicator](#output\_msk\_replicator) | Managed Streaming for Kafka |
| <a name="output_msk_scram_secret_association"></a> [msk\_scram\_secret\_association](#output\_msk\_scram\_secret\_association) | Managed Streaming for Kafka |
| <a name="output_msk_serverless_cluster"></a> [msk\_serverless\_cluster](#output\_msk\_serverless\_cluster) | Managed Streaming for Kafka |
| <a name="output_msk_single_scram_secret_association"></a> [msk\_single\_scram\_secret\_association](#output\_msk\_single\_scram\_secret\_association) | Managed Streaming for Kafka |
| <a name="output_msk_vpc_connection"></a> [msk\_vpc\_connection](#output\_msk\_vpc\_connection) | Managed Streaming for Kafka |
| <a name="output_mskconnect_connector"></a> [mskconnect\_connector](#output\_mskconnect\_connector) | Managed Streaming for Kafka Connect |
| <a name="output_mskconnect_custom_plugin"></a> [mskconnect\_custom\_plugin](#output\_mskconnect\_custom\_plugin) | Managed Streaming for Kafka Connect |
| <a name="output_mskconnect_worker_configuration"></a> [mskconnect\_worker\_configuration](#output\_mskconnect\_worker\_configuration) | Managed Streaming for Kafka Connect |
| <a name="output_mwaa_environment"></a> [mwaa\_environment](#output\_mwaa\_environment) | Managed Workflows for Apache Airflow |
| <a name="output_name"></a> [name](#output\_name) | Name |
| <a name="output_name_unique"></a> [name\_unique](#output\_name\_unique) | Unique Name |
| <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway) | Virtual Private Cloud |
| <a name="output_neptune_cluster"></a> [neptune\_cluster](#output\_neptune\_cluster) | Neptune |
| <a name="output_neptune_cluster_endpoint"></a> [neptune\_cluster\_endpoint](#output\_neptune\_cluster\_endpoint) | Neptune |
| <a name="output_neptune_cluster_instance"></a> [neptune\_cluster\_instance](#output\_neptune\_cluster\_instance) | Neptune |
| <a name="output_neptune_cluster_parameter_group"></a> [neptune\_cluster\_parameter\_group](#output\_neptune\_cluster\_parameter\_group) | Neptune |
| <a name="output_neptune_cluster_snapshot"></a> [neptune\_cluster\_snapshot](#output\_neptune\_cluster\_snapshot) | Neptune |
| <a name="output_neptune_event_subscription"></a> [neptune\_event\_subscription](#output\_neptune\_event\_subscription) | Neptune |
| <a name="output_neptune_global_cluster"></a> [neptune\_global\_cluster](#output\_neptune\_global\_cluster) | Neptune |
| <a name="output_neptune_parameter_group"></a> [neptune\_parameter\_group](#output\_neptune\_parameter\_group) | Neptune |
| <a name="output_neptune_subnet_group"></a> [neptune\_subnet\_group](#output\_neptune\_subnet\_group) | Neptune |
| <a name="output_neptunegraph_graph"></a> [neptunegraph\_graph](#output\_neptunegraph\_graph) | Neptune Analytics |
| <a name="output_network_acl"></a> [network\_acl](#output\_network\_acl) | Virtual Private Cloud |
| <a name="output_network_acl_association"></a> [network\_acl\_association](#output\_network\_acl\_association) | Virtual Private Cloud |
| <a name="output_network_acl_rule"></a> [network\_acl\_rule](#output\_network\_acl\_rule) | Virtual Private Cloud |
| <a name="output_network_interface"></a> [network\_interface](#output\_network\_interface) | Virtual Private Cloud |
| <a name="output_network_interface_attachment"></a> [network\_interface\_attachment](#output\_network\_interface\_attachment) | Virtual Private Cloud |
| <a name="output_network_interface_permission"></a> [network\_interface\_permission](#output\_network\_interface\_permission) | Virtual Private Cloud |
| <a name="output_network_interface_sg_attachment"></a> [network\_interface\_sg\_attachment](#output\_network\_interface\_sg\_attachment) | Virtual Private Cloud |
| <a name="output_networkfirewall_firewall"></a> [networkfirewall\_firewall](#output\_networkfirewall\_firewall) | Network Firewall |
| <a name="output_networkfirewall_firewall_policy"></a> [networkfirewall\_firewall\_policy](#output\_networkfirewall\_firewall\_policy) | Network Firewall |
| <a name="output_networkfirewall_logging_configuration"></a> [networkfirewall\_logging\_configuration](#output\_networkfirewall\_logging\_configuration) | Network Firewall |
| <a name="output_networkfirewall_resource_policy"></a> [networkfirewall\_resource\_policy](#output\_networkfirewall\_resource\_policy) | Network Firewall |
| <a name="output_networkfirewall_rule_group"></a> [networkfirewall\_rule\_group](#output\_networkfirewall\_rule\_group) | Network Firewall |
| <a name="output_networkfirewall_tls_inspection_configuration"></a> [networkfirewall\_tls\_inspection\_configuration](#output\_networkfirewall\_tls\_inspection\_configuration) | Network Firewall |
| <a name="output_networkmanager_attachment_accepter"></a> [networkmanager\_attachment\_accepter](#output\_networkmanager\_attachment\_accepter) | Network Manager |
| <a name="output_networkmanager_connect_attachment"></a> [networkmanager\_connect\_attachment](#output\_networkmanager\_connect\_attachment) | Network Manager |
| <a name="output_networkmanager_connect_peer"></a> [networkmanager\_connect\_peer](#output\_networkmanager\_connect\_peer) | Network Manager |
| <a name="output_networkmanager_connection"></a> [networkmanager\_connection](#output\_networkmanager\_connection) | Network Manager |
| <a name="output_networkmanager_core_network"></a> [networkmanager\_core\_network](#output\_networkmanager\_core\_network) | Network Manager |
| <a name="output_networkmanager_core_network_policy_attachment"></a> [networkmanager\_core\_network\_policy\_attachment](#output\_networkmanager\_core\_network\_policy\_attachment) | Network Manager |
| <a name="output_networkmanager_customer_gateway_association"></a> [networkmanager\_customer\_gateway\_association](#output\_networkmanager\_customer\_gateway\_association) | Network Manager |
| <a name="output_networkmanager_device"></a> [networkmanager\_device](#output\_networkmanager\_device) | Network Manager |
| <a name="output_networkmanager_dx_gateway_attachment"></a> [networkmanager\_dx\_gateway\_attachment](#output\_networkmanager\_dx\_gateway\_attachment) | Network Manager |
| <a name="output_networkmanager_global_network"></a> [networkmanager\_global\_network](#output\_networkmanager\_global\_network) | Network Manager |
| <a name="output_networkmanager_link"></a> [networkmanager\_link](#output\_networkmanager\_link) | Network Manager |
| <a name="output_networkmanager_link_association"></a> [networkmanager\_link\_association](#output\_networkmanager\_link\_association) | Network Manager |
| <a name="output_networkmanager_site"></a> [networkmanager\_site](#output\_networkmanager\_site) | Network Manager |
| <a name="output_networkmanager_site_to_site_vpn_attachment"></a> [networkmanager\_site\_to\_site\_vpn\_attachment](#output\_networkmanager\_site\_to\_site\_vpn\_attachment) | Network Manager |
| <a name="output_networkmanager_transit_gateway_connect_peer_association"></a> [networkmanager\_transit\_gateway\_connect\_peer\_association](#output\_networkmanager\_transit\_gateway\_connect\_peer\_association) | Network Manager |
| <a name="output_networkmanager_transit_gateway_peering"></a> [networkmanager\_transit\_gateway\_peering](#output\_networkmanager\_transit\_gateway\_peering) | Network Manager |
| <a name="output_networkmanager_transit_gateway_registration"></a> [networkmanager\_transit\_gateway\_registration](#output\_networkmanager\_transit\_gateway\_registration) | Network Manager |
| <a name="output_networkmanager_transit_gateway_route_table_attachment"></a> [networkmanager\_transit\_gateway\_route\_table\_attachment](#output\_networkmanager\_transit\_gateway\_route\_table\_attachment) | Network Manager |
| <a name="output_networkmanager_vpc_attachment"></a> [networkmanager\_vpc\_attachment](#output\_networkmanager\_vpc\_attachment) | Network Manager |
| <a name="output_networkmonitor_monitor"></a> [networkmonitor\_monitor](#output\_networkmonitor\_monitor) | CloudWatch Network Monitor |
| <a name="output_networkmonitor_probe"></a> [networkmonitor\_probe](#output\_networkmonitor\_probe) | CloudWatch Network Monitor |
| <a name="output_oam_link"></a> [oam\_link](#output\_oam\_link) | CloudWatch Observability Access Manager |
| <a name="output_oam_sink"></a> [oam\_sink](#output\_oam\_sink) | CloudWatch Observability Access Manager |
| <a name="output_oam_sink_policy"></a> [oam\_sink\_policy](#output\_oam\_sink\_policy) | CloudWatch Observability Access Manager |
| <a name="output_opensearch_authorize_vpc_endpoint_access"></a> [opensearch\_authorize\_vpc\_endpoint\_access](#output\_opensearch\_authorize\_vpc\_endpoint\_access) | OpenSearch |
| <a name="output_opensearch_domain"></a> [opensearch\_domain](#output\_opensearch\_domain) | OpenSearch |
| <a name="output_opensearch_domain_policy"></a> [opensearch\_domain\_policy](#output\_opensearch\_domain\_policy) | OpenSearch |
| <a name="output_opensearch_domain_saml_options"></a> [opensearch\_domain\_saml\_options](#output\_opensearch\_domain\_saml\_options) | OpenSearch |
| <a name="output_opensearch_inbound_connection_accepter"></a> [opensearch\_inbound\_connection\_accepter](#output\_opensearch\_inbound\_connection\_accepter) | OpenSearch |
| <a name="output_opensearch_outbound_connection"></a> [opensearch\_outbound\_connection](#output\_opensearch\_outbound\_connection) | OpenSearch |
| <a name="output_opensearch_package"></a> [opensearch\_package](#output\_opensearch\_package) | OpenSearch |
| <a name="output_opensearch_package_association"></a> [opensearch\_package\_association](#output\_opensearch\_package\_association) | OpenSearch |
| <a name="output_opensearch_vpc_endpoint"></a> [opensearch\_vpc\_endpoint](#output\_opensearch\_vpc\_endpoint) | OpenSearch |
| <a name="output_opensearchserverless_access_policy"></a> [opensearchserverless\_access\_policy](#output\_opensearchserverless\_access\_policy) | OpenSearch Serverless |
| <a name="output_opensearchserverless_collection"></a> [opensearchserverless\_collection](#output\_opensearchserverless\_collection) | OpenSearch Serverless |
| <a name="output_opensearchserverless_lifecycle_policy"></a> [opensearchserverless\_lifecycle\_policy](#output\_opensearchserverless\_lifecycle\_policy) | OpenSearch Serverless |
| <a name="output_opensearchserverless_security_config"></a> [opensearchserverless\_security\_config](#output\_opensearchserverless\_security\_config) | OpenSearch Serverless |
| <a name="output_opensearchserverless_security_policy"></a> [opensearchserverless\_security\_policy](#output\_opensearchserverless\_security\_policy) | OpenSearch Serverless |
| <a name="output_opensearchserverless_vpc_endpoint"></a> [opensearchserverless\_vpc\_endpoint](#output\_opensearchserverless\_vpc\_endpoint) | OpenSearch Serverless |
| <a name="output_opsworks_application"></a> [opsworks\_application](#output\_opsworks\_application) | OpsWorks |
| <a name="output_opsworks_custom_layer"></a> [opsworks\_custom\_layer](#output\_opsworks\_custom\_layer) | OpsWorks |
| <a name="output_opsworks_ecs_cluster_layer"></a> [opsworks\_ecs\_cluster\_layer](#output\_opsworks\_ecs\_cluster\_layer) | OpsWorks |
| <a name="output_opsworks_ganglia_layer"></a> [opsworks\_ganglia\_layer](#output\_opsworks\_ganglia\_layer) | OpsWorks |
| <a name="output_opsworks_haproxy_layer"></a> [opsworks\_haproxy\_layer](#output\_opsworks\_haproxy\_layer) | OpsWorks |
| <a name="output_opsworks_instance"></a> [opsworks\_instance](#output\_opsworks\_instance) | OpsWorks |
| <a name="output_opsworks_java_app_layer"></a> [opsworks\_java\_app\_layer](#output\_opsworks\_java\_app\_layer) | OpsWorks |
| <a name="output_opsworks_memcached_layer"></a> [opsworks\_memcached\_layer](#output\_opsworks\_memcached\_layer) | OpsWorks |
| <a name="output_opsworks_mysql_layer"></a> [opsworks\_mysql\_layer](#output\_opsworks\_mysql\_layer) | OpsWorks |
| <a name="output_opsworks_nodejs_app_layer"></a> [opsworks\_nodejs\_app\_layer](#output\_opsworks\_nodejs\_app\_layer) | OpsWorks |
| <a name="output_opsworks_permission"></a> [opsworks\_permission](#output\_opsworks\_permission) | OpsWorks |
| <a name="output_opsworks_php_app_layer"></a> [opsworks\_php\_app\_layer](#output\_opsworks\_php\_app\_layer) | OpsWorks |
| <a name="output_opsworks_rails_app_layer"></a> [opsworks\_rails\_app\_layer](#output\_opsworks\_rails\_app\_layer) | OpsWorks |
| <a name="output_opsworks_rds_db_instance"></a> [opsworks\_rds\_db\_instance](#output\_opsworks\_rds\_db\_instance) | OpsWorks |
| <a name="output_opsworks_stack"></a> [opsworks\_stack](#output\_opsworks\_stack) | OpsWorks |
| <a name="output_opsworks_static_web_layer"></a> [opsworks\_static\_web\_layer](#output\_opsworks\_static\_web\_layer) | OpsWorks |
| <a name="output_opsworks_user_profile"></a> [opsworks\_user\_profile](#output\_opsworks\_user\_profile) | OpsWorks |
| <a name="output_organizations_account"></a> [organizations\_account](#output\_organizations\_account) | Organizations |
| <a name="output_organizations_delegated_administrator"></a> [organizations\_delegated\_administrator](#output\_organizations\_delegated\_administrator) | Organizations |
| <a name="output_organizations_organization"></a> [organizations\_organization](#output\_organizations\_organization) | Organizations |
| <a name="output_organizations_organizational_unit"></a> [organizations\_organizational\_unit](#output\_organizations\_organizational\_unit) | Organizations |
| <a name="output_organizations_policy"></a> [organizations\_policy](#output\_organizations\_policy) | Organizations |
| <a name="output_organizations_policy_attachment"></a> [organizations\_policy\_attachment](#output\_organizations\_policy\_attachment) | Organizations |
| <a name="output_organizations_resource_policy"></a> [organizations\_resource\_policy](#output\_organizations\_resource\_policy) | Organizations |
| <a name="output_osis_pipeline"></a> [osis\_pipeline](#output\_osis\_pipeline) | OpenSearch Ingestion |
| <a name="output_paymentcryptography_key"></a> [paymentcryptography\_key](#output\_paymentcryptography\_key) | Payment Cryptography Control Plane |
| <a name="output_paymentcryptography_key_alias"></a> [paymentcryptography\_key\_alias](#output\_paymentcryptography\_key\_alias) | Payment Cryptography Control Plane |
| <a name="output_pinpoint_adm_channel"></a> [pinpoint\_adm\_channel](#output\_pinpoint\_adm\_channel) | Pinpoint |
| <a name="output_pinpoint_apns_channel"></a> [pinpoint\_apns\_channel](#output\_pinpoint\_apns\_channel) | Pinpoint |
| <a name="output_pinpoint_apns_sandbox_channel"></a> [pinpoint\_apns\_sandbox\_channel](#output\_pinpoint\_apns\_sandbox\_channel) | Pinpoint |
| <a name="output_pinpoint_apns_voip_channel"></a> [pinpoint\_apns\_voip\_channel](#output\_pinpoint\_apns\_voip\_channel) | Pinpoint |
| <a name="output_pinpoint_apns_voip_sandbox_channel"></a> [pinpoint\_apns\_voip\_sandbox\_channel](#output\_pinpoint\_apns\_voip\_sandbox\_channel) | Pinpoint |
| <a name="output_pinpoint_app"></a> [pinpoint\_app](#output\_pinpoint\_app) | Pinpoint |
| <a name="output_pinpoint_baidu_channel"></a> [pinpoint\_baidu\_channel](#output\_pinpoint\_baidu\_channel) | Pinpoint |
| <a name="output_pinpoint_email_channel"></a> [pinpoint\_email\_channel](#output\_pinpoint\_email\_channel) | Pinpoint |
| <a name="output_pinpoint_email_template"></a> [pinpoint\_email\_template](#output\_pinpoint\_email\_template) | Pinpoint |
| <a name="output_pinpoint_event_stream"></a> [pinpoint\_event\_stream](#output\_pinpoint\_event\_stream) | Pinpoint |
| <a name="output_pinpoint_gcm_channel"></a> [pinpoint\_gcm\_channel](#output\_pinpoint\_gcm\_channel) | Pinpoint |
| <a name="output_pinpoint_sms_channel"></a> [pinpoint\_sms\_channel](#output\_pinpoint\_sms\_channel) | Pinpoint |
| <a name="output_pinpointsmsvoicev2_configuration_set"></a> [pinpointsmsvoicev2\_configuration\_set](#output\_pinpointsmsvoicev2\_configuration\_set) | End User Messaging SMS |
| <a name="output_pinpointsmsvoicev2_opt_out_list"></a> [pinpointsmsvoicev2\_opt\_out\_list](#output\_pinpointsmsvoicev2\_opt\_out\_list) | End User Messaging SMS |
| <a name="output_pinpointsmsvoicev2_phone_number"></a> [pinpointsmsvoicev2\_phone\_number](#output\_pinpointsmsvoicev2\_phone\_number) | End User Messaging SMS |
| <a name="output_pipes_pipe"></a> [pipes\_pipe](#output\_pipes\_pipe) | EventBridge Pipes |
| <a name="output_placement_group"></a> [placement\_group](#output\_placement\_group) | Elastic Compute Cloud |
| <a name="output_prometheus_alert_manager_definition"></a> [prometheus\_alert\_manager\_definition](#output\_prometheus\_alert\_manager\_definition) | Managed Prometheus |
| <a name="output_prometheus_rule_group_namespace"></a> [prometheus\_rule\_group\_namespace](#output\_prometheus\_rule\_group\_namespace) | Managed Prometheus |
| <a name="output_prometheus_scraper"></a> [prometheus\_scraper](#output\_prometheus\_scraper) | Managed Prometheus |
| <a name="output_prometheus_workspace"></a> [prometheus\_workspace](#output\_prometheus\_workspace) | Managed Prometheus |
| <a name="output_proxy_protocol_policy"></a> [proxy\_protocol\_policy](#output\_proxy\_protocol\_policy) | ELB Classic |
| <a name="output_qbusiness_application"></a> [qbusiness\_application](#output\_qbusiness\_application) | Amazon Q Business |
| <a name="output_qldb_ledger"></a> [qldb\_ledger](#output\_qldb\_ledger) | Quantum Ledger Database |
| <a name="output_qldb_stream"></a> [qldb\_stream](#output\_qldb\_stream) | Quantum Ledger Database |
| <a name="output_quicksight_account_subscription"></a> [quicksight\_account\_subscription](#output\_quicksight\_account\_subscription) | QuickSight |
| <a name="output_quicksight_analysis"></a> [quicksight\_analysis](#output\_quicksight\_analysis) | QuickSight |
| <a name="output_quicksight_dashboard"></a> [quicksight\_dashboard](#output\_quicksight\_dashboard) | QuickSight |
| <a name="output_quicksight_data_set"></a> [quicksight\_data\_set](#output\_quicksight\_data\_set) | QuickSight |
| <a name="output_quicksight_data_source"></a> [quicksight\_data\_source](#output\_quicksight\_data\_source) | QuickSight |
| <a name="output_quicksight_folder"></a> [quicksight\_folder](#output\_quicksight\_folder) | QuickSight |
| <a name="output_quicksight_folder_membership"></a> [quicksight\_folder\_membership](#output\_quicksight\_folder\_membership) | QuickSight |
| <a name="output_quicksight_group"></a> [quicksight\_group](#output\_quicksight\_group) | QuickSight |
| <a name="output_quicksight_group_membership"></a> [quicksight\_group\_membership](#output\_quicksight\_group\_membership) | QuickSight |
| <a name="output_quicksight_iam_policy_assignment"></a> [quicksight\_iam\_policy\_assignment](#output\_quicksight\_iam\_policy\_assignment) | QuickSight |
| <a name="output_quicksight_ingestion"></a> [quicksight\_ingestion](#output\_quicksight\_ingestion) | QuickSight |
| <a name="output_quicksight_namespace"></a> [quicksight\_namespace](#output\_quicksight\_namespace) | QuickSight |
| <a name="output_quicksight_refresh_schedule"></a> [quicksight\_refresh\_schedule](#output\_quicksight\_refresh\_schedule) | QuickSight |
| <a name="output_quicksight_role_membership"></a> [quicksight\_role\_membership](#output\_quicksight\_role\_membership) | QuickSight |
| <a name="output_quicksight_template"></a> [quicksight\_template](#output\_quicksight\_template) | QuickSight |
| <a name="output_quicksight_template_alias"></a> [quicksight\_template\_alias](#output\_quicksight\_template\_alias) | QuickSight |
| <a name="output_quicksight_theme"></a> [quicksight\_theme](#output\_quicksight\_theme) | QuickSight |
| <a name="output_quicksight_user"></a> [quicksight\_user](#output\_quicksight\_user) | QuickSight |
| <a name="output_quicksight_vpc_connection"></a> [quicksight\_vpc\_connection](#output\_quicksight\_vpc\_connection) | QuickSight |
| <a name="output_ram_principal_association"></a> [ram\_principal\_association](#output\_ram\_principal\_association) | Resource Access Manager |
| <a name="output_ram_resource_association"></a> [ram\_resource\_association](#output\_ram\_resource\_association) | Resource Access Manager |
| <a name="output_ram_resource_share"></a> [ram\_resource\_share](#output\_ram\_resource\_share) | Resource Access Manager |
| <a name="output_ram_resource_share_accepter"></a> [ram\_resource\_share\_accepter](#output\_ram\_resource\_share\_accepter) | Resource Access Manager |
| <a name="output_ram_sharing_with_organization"></a> [ram\_sharing\_with\_organization](#output\_ram\_sharing\_with\_organization) | Resource Access Manager |
| <a name="output_rbin_rule"></a> [rbin\_rule](#output\_rbin\_rule) | RBin |
| <a name="output_rds_certificate"></a> [rds\_certificate](#output\_rds\_certificate) | Relational Database |
| <a name="output_rds_cluster"></a> [rds\_cluster](#output\_rds\_cluster) | Relational Database |
| <a name="output_rds_cluster_activity_stream"></a> [rds\_cluster\_activity\_stream](#output\_rds\_cluster\_activity\_stream) | Relational Database |
| <a name="output_rds_cluster_endpoint"></a> [rds\_cluster\_endpoint](#output\_rds\_cluster\_endpoint) | Relational Database |
| <a name="output_rds_cluster_instance"></a> [rds\_cluster\_instance](#output\_rds\_cluster\_instance) | Relational Database |
| <a name="output_rds_cluster_parameter_group"></a> [rds\_cluster\_parameter\_group](#output\_rds\_cluster\_parameter\_group) | Relational Database |
| <a name="output_rds_cluster_role_association"></a> [rds\_cluster\_role\_association](#output\_rds\_cluster\_role\_association) | Relational Database |
| <a name="output_rds_cluster_snapshot_copy"></a> [rds\_cluster\_snapshot\_copy](#output\_rds\_cluster\_snapshot\_copy) | Relational Database |
| <a name="output_rds_custom_db_engine_version"></a> [rds\_custom\_db\_engine\_version](#output\_rds\_custom\_db\_engine\_version) | Relational Database |
| <a name="output_rds_export_task"></a> [rds\_export\_task](#output\_rds\_export\_task) | Relational Database |
| <a name="output_rds_global_cluster"></a> [rds\_global\_cluster](#output\_rds\_global\_cluster) | Relational Database |
| <a name="output_rds_instance_state"></a> [rds\_instance\_state](#output\_rds\_instance\_state) | Relational Database |
| <a name="output_rds_integration"></a> [rds\_integration](#output\_rds\_integration) | Relational Database |
| <a name="output_rds_reserved_instance"></a> [rds\_reserved\_instance](#output\_rds\_reserved\_instance) | Relational Database |
| <a name="output_rds_shard_group"></a> [rds\_shard\_group](#output\_rds\_shard\_group) | Relational Database |
| <a name="output_redshift_authentication_profile"></a> [redshift\_authentication\_profile](#output\_redshift\_authentication\_profile) | Redshift |
| <a name="output_redshift_cluster"></a> [redshift\_cluster](#output\_redshift\_cluster) | Redshift |
| <a name="output_redshift_cluster_iam_roles"></a> [redshift\_cluster\_iam\_roles](#output\_redshift\_cluster\_iam\_roles) | Redshift |
| <a name="output_redshift_cluster_snapshot"></a> [redshift\_cluster\_snapshot](#output\_redshift\_cluster\_snapshot) | Redshift |
| <a name="output_redshift_data_share_authorization"></a> [redshift\_data\_share\_authorization](#output\_redshift\_data\_share\_authorization) | Redshift |
| <a name="output_redshift_data_share_consumer_association"></a> [redshift\_data\_share\_consumer\_association](#output\_redshift\_data\_share\_consumer\_association) | Redshift |
| <a name="output_redshift_endpoint_access"></a> [redshift\_endpoint\_access](#output\_redshift\_endpoint\_access) | Redshift |
| <a name="output_redshift_endpoint_authorization"></a> [redshift\_endpoint\_authorization](#output\_redshift\_endpoint\_authorization) | Redshift |
| <a name="output_redshift_event_subscription"></a> [redshift\_event\_subscription](#output\_redshift\_event\_subscription) | Redshift |
| <a name="output_redshift_hsm_client_certificate"></a> [redshift\_hsm\_client\_certificate](#output\_redshift\_hsm\_client\_certificate) | Redshift |
| <a name="output_redshift_hsm_configuration"></a> [redshift\_hsm\_configuration](#output\_redshift\_hsm\_configuration) | Redshift |
| <a name="output_redshift_logging"></a> [redshift\_logging](#output\_redshift\_logging) | Redshift |
| <a name="output_redshift_parameter_group"></a> [redshift\_parameter\_group](#output\_redshift\_parameter\_group) | Redshift |
| <a name="output_redshift_partner"></a> [redshift\_partner](#output\_redshift\_partner) | Redshift |
| <a name="output_redshift_resource_policy"></a> [redshift\_resource\_policy](#output\_redshift\_resource\_policy) | Redshift |
| <a name="output_redshift_scheduled_action"></a> [redshift\_scheduled\_action](#output\_redshift\_scheduled\_action) | Redshift |
| <a name="output_redshift_snapshot_copy"></a> [redshift\_snapshot\_copy](#output\_redshift\_snapshot\_copy) | Redshift |
| <a name="output_redshift_snapshot_copy_grant"></a> [redshift\_snapshot\_copy\_grant](#output\_redshift\_snapshot\_copy\_grant) | Redshift |
| <a name="output_redshift_snapshot_schedule"></a> [redshift\_snapshot\_schedule](#output\_redshift\_snapshot\_schedule) | Redshift |
| <a name="output_redshift_snapshot_schedule_association"></a> [redshift\_snapshot\_schedule\_association](#output\_redshift\_snapshot\_schedule\_association) | Redshift |
| <a name="output_redshift_subnet_group"></a> [redshift\_subnet\_group](#output\_redshift\_subnet\_group) | Redshift |
| <a name="output_redshift_usage_limit"></a> [redshift\_usage\_limit](#output\_redshift\_usage\_limit) | Redshift |
| <a name="output_redshiftdata_statement"></a> [redshiftdata\_statement](#output\_redshiftdata\_statement) | Redshift Data |
| <a name="output_redshiftserverless_custom_domain_association"></a> [redshiftserverless\_custom\_domain\_association](#output\_redshiftserverless\_custom\_domain\_association) | Redshift Serverless |
| <a name="output_redshiftserverless_endpoint_access"></a> [redshiftserverless\_endpoint\_access](#output\_redshiftserverless\_endpoint\_access) | Redshift Serverless |
| <a name="output_redshiftserverless_namespace"></a> [redshiftserverless\_namespace](#output\_redshiftserverless\_namespace) | Redshift Serverless |
| <a name="output_redshiftserverless_resource_policy"></a> [redshiftserverless\_resource\_policy](#output\_redshiftserverless\_resource\_policy) | Redshift Serverless |
| <a name="output_redshiftserverless_snapshot"></a> [redshiftserverless\_snapshot](#output\_redshiftserverless\_snapshot) | Redshift Serverless |
| <a name="output_redshiftserverless_usage_limit"></a> [redshiftserverless\_usage\_limit](#output\_redshiftserverless\_usage\_limit) | Redshift Serverless |
| <a name="output_redshiftserverless_workgroup"></a> [redshiftserverless\_workgroup](#output\_redshiftserverless\_workgroup) | Redshift Serverless |
| <a name="output_rekognition_collection"></a> [rekognition\_collection](#output\_rekognition\_collection) | Rekognition |
| <a name="output_rekognition_project"></a> [rekognition\_project](#output\_rekognition\_project) | Rekognition |
| <a name="output_rekognition_stream_processor"></a> [rekognition\_stream\_processor](#output\_rekognition\_stream\_processor) | Rekognition |
| <a name="output_resiliencehub_resiliency_policy"></a> [resiliencehub\_resiliency\_policy](#output\_resiliencehub\_resiliency\_policy) | Resilience Hub |
| <a name="output_resourceexplorer2_index"></a> [resourceexplorer2\_index](#output\_resourceexplorer2\_index) | Resource Explorer |
| <a name="output_resourceexplorer2_view"></a> [resourceexplorer2\_view](#output\_resourceexplorer2\_view) | Resource Explorer |
| <a name="output_resourcegroups_group"></a> [resourcegroups\_group](#output\_resourcegroups\_group) | Resource Groups |
| <a name="output_resourcegroups_resource"></a> [resourcegroups\_resource](#output\_resourcegroups\_resource) | Resource Groups |
| <a name="output_rolesanywhere_profile"></a> [rolesanywhere\_profile](#output\_rolesanywhere\_profile) | Roles Anywhere |
| <a name="output_rolesanywhere_trust_anchor"></a> [rolesanywhere\_trust\_anchor](#output\_rolesanywhere\_trust\_anchor) | Roles Anywhere |
| <a name="output_route"></a> [route](#output\_route) | Virtual Private Cloud |
| <a name="output_route53_cidr_collection"></a> [route53\_cidr\_collection](#output\_route53\_cidr\_collection) | Route 53 |
| <a name="output_route53_cidr_location"></a> [route53\_cidr\_location](#output\_route53\_cidr\_location) | Route 53 |
| <a name="output_route53_delegation_set"></a> [route53\_delegation\_set](#output\_route53\_delegation\_set) | Route 53 |
| <a name="output_route53_health_check"></a> [route53\_health\_check](#output\_route53\_health\_check) | Route 53 |
| <a name="output_route53_hosted_zone_dnssec"></a> [route53\_hosted\_zone\_dnssec](#output\_route53\_hosted\_zone\_dnssec) | Route 53 |
| <a name="output_route53_key_signing_key"></a> [route53\_key\_signing\_key](#output\_route53\_key\_signing\_key) | Route 53 |
| <a name="output_route53_query_log"></a> [route53\_query\_log](#output\_route53\_query\_log) | Route 53 |
| <a name="output_route53_record"></a> [route53\_record](#output\_route53\_record) | Route 53 |
| <a name="output_route53_resolver_config"></a> [route53\_resolver\_config](#output\_route53\_resolver\_config) | Route 53 Resolver |
| <a name="output_route53_resolver_dnssec_config"></a> [route53\_resolver\_dnssec\_config](#output\_route53\_resolver\_dnssec\_config) | Route 53 Resolver |
| <a name="output_route53_resolver_endpoint"></a> [route53\_resolver\_endpoint](#output\_route53\_resolver\_endpoint) | Route 53 Resolver |
| <a name="output_route53_resolver_firewall_config"></a> [route53\_resolver\_firewall\_config](#output\_route53\_resolver\_firewall\_config) | Route 53 Resolver |
| <a name="output_route53_resolver_firewall_domain_list"></a> [route53\_resolver\_firewall\_domain\_list](#output\_route53\_resolver\_firewall\_domain\_list) | Route 53 Resolver |
| <a name="output_route53_resolver_firewall_rule"></a> [route53\_resolver\_firewall\_rule](#output\_route53\_resolver\_firewall\_rule) | Route 53 Resolver |
| <a name="output_route53_resolver_firewall_rule_group"></a> [route53\_resolver\_firewall\_rule\_group](#output\_route53\_resolver\_firewall\_rule\_group) | Route 53 Resolver |
| <a name="output_route53_resolver_firewall_rule_group_association"></a> [route53\_resolver\_firewall\_rule\_group\_association](#output\_route53\_resolver\_firewall\_rule\_group\_association) | Route 53 Resolver |
| <a name="output_route53_resolver_query_log_config"></a> [route53\_resolver\_query\_log\_config](#output\_route53\_resolver\_query\_log\_config) | Route 53 Resolver |
| <a name="output_route53_resolver_query_log_config_association"></a> [route53\_resolver\_query\_log\_config\_association](#output\_route53\_resolver\_query\_log\_config\_association) | Route 53 Resolver |
| <a name="output_route53_resolver_rule"></a> [route53\_resolver\_rule](#output\_route53\_resolver\_rule) | Route 53 Resolver |
| <a name="output_route53_resolver_rule_association"></a> [route53\_resolver\_rule\_association](#output\_route53\_resolver\_rule\_association) | Route 53 Resolver |
| <a name="output_route53_traffic_policy"></a> [route53\_traffic\_policy](#output\_route53\_traffic\_policy) | Route 53 |
| <a name="output_route53_traffic_policy_instance"></a> [route53\_traffic\_policy\_instance](#output\_route53\_traffic\_policy\_instance) | Route 53 |
| <a name="output_route53_vpc_association_authorization"></a> [route53\_vpc\_association\_authorization](#output\_route53\_vpc\_association\_authorization) | Route 53 |
| <a name="output_route53_zone"></a> [route53\_zone](#output\_route53\_zone) | Route 53 |
| <a name="output_route53_zone_association"></a> [route53\_zone\_association](#output\_route53\_zone\_association) | Route 53 |
| <a name="output_route53domains_delegation_signer_record"></a> [route53domains\_delegation\_signer\_record](#output\_route53domains\_delegation\_signer\_record) | Route 53 Domains |
| <a name="output_route53domains_domain"></a> [route53domains\_domain](#output\_route53domains\_domain) | Route 53 Domains |
| <a name="output_route53domains_registered_domain"></a> [route53domains\_registered\_domain](#output\_route53domains\_registered\_domain) | Route 53 Domains |
| <a name="output_route53profiles_association"></a> [route53profiles\_association](#output\_route53profiles\_association) | Route 53 Profiles |
| <a name="output_route53profiles_profile"></a> [route53profiles\_profile](#output\_route53profiles\_profile) | Route 53 Profiles |
| <a name="output_route53profiles_resource_association"></a> [route53profiles\_resource\_association](#output\_route53profiles\_resource\_association) | Route 53 Profiles |
| <a name="output_route53recoverycontrolconfig_cluster"></a> [route53recoverycontrolconfig\_cluster](#output\_route53recoverycontrolconfig\_cluster) | Route 53 Recovery Control Config |
| <a name="output_route53recoverycontrolconfig_control_panel"></a> [route53recoverycontrolconfig\_control\_panel](#output\_route53recoverycontrolconfig\_control\_panel) | Route 53 Recovery Control Config |
| <a name="output_route53recoverycontrolconfig_routing_control"></a> [route53recoverycontrolconfig\_routing\_control](#output\_route53recoverycontrolconfig\_routing\_control) | Route 53 Recovery Control Config |
| <a name="output_route53recoverycontrolconfig_safety_rule"></a> [route53recoverycontrolconfig\_safety\_rule](#output\_route53recoverycontrolconfig\_safety\_rule) | Route 53 Recovery Control Config |
| <a name="output_route53recoveryreadiness_cell"></a> [route53recoveryreadiness\_cell](#output\_route53recoveryreadiness\_cell) | Route 53 Recovery Readiness |
| <a name="output_route53recoveryreadiness_readiness_check"></a> [route53recoveryreadiness\_readiness\_check](#output\_route53recoveryreadiness\_readiness\_check) | Route 53 Recovery Readiness |
| <a name="output_route53recoveryreadiness_recovery_group"></a> [route53recoveryreadiness\_recovery\_group](#output\_route53recoveryreadiness\_recovery\_group) | Route 53 Recovery Readiness |
| <a name="output_route53recoveryreadiness_resource_set"></a> [route53recoveryreadiness\_resource\_set](#output\_route53recoveryreadiness\_resource\_set) | Route 53 Recovery Readiness |
| <a name="output_route_table"></a> [route\_table](#output\_route\_table) | Virtual Private Cloud |
| <a name="output_route_table_association"></a> [route\_table\_association](#output\_route\_table\_association) | Virtual Private Cloud |
| <a name="output_rum_app_monitor"></a> [rum\_app\_monitor](#output\_rum\_app\_monitor) | CloudWatch RUM |
| <a name="output_rum_metrics_destination"></a> [rum\_metrics\_destination](#output\_rum\_metrics\_destination) | CloudWatch RUM |
| <a name="output_s3_access_point"></a> [s3\_access\_point](#output\_s3\_access\_point) | S3 Control |
| <a name="output_s3_account_public_access_block"></a> [s3\_account\_public\_access\_block](#output\_s3\_account\_public\_access\_block) | S3 Control |
| <a name="output_s3_bucket"></a> [s3\_bucket](#output\_s3\_bucket) | Simple Storage |
| <a name="output_s3_bucket_accelerate_configuration"></a> [s3\_bucket\_accelerate\_configuration](#output\_s3\_bucket\_accelerate\_configuration) | Simple Storage |
| <a name="output_s3_bucket_acl"></a> [s3\_bucket\_acl](#output\_s3\_bucket\_acl) | Simple Storage |
| <a name="output_s3_bucket_analytics_configuration"></a> [s3\_bucket\_analytics\_configuration](#output\_s3\_bucket\_analytics\_configuration) | Simple Storage |
| <a name="output_s3_bucket_cors_configuration"></a> [s3\_bucket\_cors\_configuration](#output\_s3\_bucket\_cors\_configuration) | Simple Storage |
| <a name="output_s3_bucket_intelligent_tiering_configuration"></a> [s3\_bucket\_intelligent\_tiering\_configuration](#output\_s3\_bucket\_intelligent\_tiering\_configuration) | Simple Storage |
| <a name="output_s3_bucket_inventory"></a> [s3\_bucket\_inventory](#output\_s3\_bucket\_inventory) | Simple Storage |
| <a name="output_s3_bucket_lifecycle_configuration"></a> [s3\_bucket\_lifecycle\_configuration](#output\_s3\_bucket\_lifecycle\_configuration) | Simple Storage |
| <a name="output_s3_bucket_logging"></a> [s3\_bucket\_logging](#output\_s3\_bucket\_logging) | Simple Storage |
| <a name="output_s3_bucket_metric"></a> [s3\_bucket\_metric](#output\_s3\_bucket\_metric) | Simple Storage |
| <a name="output_s3_bucket_notification"></a> [s3\_bucket\_notification](#output\_s3\_bucket\_notification) | Simple Storage |
| <a name="output_s3_bucket_object"></a> [s3\_bucket\_object](#output\_s3\_bucket\_object) | Simple Storage |
| <a name="output_s3_bucket_object_lock_configuration"></a> [s3\_bucket\_object\_lock\_configuration](#output\_s3\_bucket\_object\_lock\_configuration) | Simple Storage |
| <a name="output_s3_bucket_ownership_controls"></a> [s3\_bucket\_ownership\_controls](#output\_s3\_bucket\_ownership\_controls) | Simple Storage |
| <a name="output_s3_bucket_policy"></a> [s3\_bucket\_policy](#output\_s3\_bucket\_policy) | Simple Storage |
| <a name="output_s3_bucket_public_access_block"></a> [s3\_bucket\_public\_access\_block](#output\_s3\_bucket\_public\_access\_block) | Simple Storage |
| <a name="output_s3_bucket_replication_configuration"></a> [s3\_bucket\_replication\_configuration](#output\_s3\_bucket\_replication\_configuration) | Simple Storage |
| <a name="output_s3_bucket_request_payment_configuration"></a> [s3\_bucket\_request\_payment\_configuration](#output\_s3\_bucket\_request\_payment\_configuration) | Simple Storage |
| <a name="output_s3_bucket_server_side_encryption_configuration"></a> [s3\_bucket\_server\_side\_encryption\_configuration](#output\_s3\_bucket\_server\_side\_encryption\_configuration) | Simple Storage |
| <a name="output_s3_bucket_versioning"></a> [s3\_bucket\_versioning](#output\_s3\_bucket\_versioning) | Simple Storage |
| <a name="output_s3_bucket_website_configuration"></a> [s3\_bucket\_website\_configuration](#output\_s3\_bucket\_website\_configuration) | Simple Storage |
| <a name="output_s3_directory_bucket"></a> [s3\_directory\_bucket](#output\_s3\_directory\_bucket) | Simple Storage |
| <a name="output_s3_object"></a> [s3\_object](#output\_s3\_object) | Simple Storage |
| <a name="output_s3_object_copy"></a> [s3\_object\_copy](#output\_s3\_object\_copy) | Simple Storage |
| <a name="output_s3control_access_grant"></a> [s3control\_access\_grant](#output\_s3control\_access\_grant) | S3 Control |
| <a name="output_s3control_access_grants_instance"></a> [s3control\_access\_grants\_instance](#output\_s3control\_access\_grants\_instance) | S3 Control |
| <a name="output_s3control_access_grants_instance_resource_policy"></a> [s3control\_access\_grants\_instance\_resource\_policy](#output\_s3control\_access\_grants\_instance\_resource\_policy) | S3 Control |
| <a name="output_s3control_access_grants_location"></a> [s3control\_access\_grants\_location](#output\_s3control\_access\_grants\_location) | S3 Control |
| <a name="output_s3control_access_point_policy"></a> [s3control\_access\_point\_policy](#output\_s3control\_access\_point\_policy) | S3 Control |
| <a name="output_s3control_bucket"></a> [s3control\_bucket](#output\_s3control\_bucket) | S3 Control |
| <a name="output_s3control_bucket_lifecycle_configuration"></a> [s3control\_bucket\_lifecycle\_configuration](#output\_s3control\_bucket\_lifecycle\_configuration) | S3 Control |
| <a name="output_s3control_bucket_policy"></a> [s3control\_bucket\_policy](#output\_s3control\_bucket\_policy) | S3 Control |
| <a name="output_s3control_multi_region_access_point"></a> [s3control\_multi\_region\_access\_point](#output\_s3control\_multi\_region\_access\_point) | S3 Control |
| <a name="output_s3control_multi_region_access_point_policy"></a> [s3control\_multi\_region\_access\_point\_policy](#output\_s3control\_multi\_region\_access\_point\_policy) | S3 Control |
| <a name="output_s3control_object_lambda_access_point"></a> [s3control\_object\_lambda\_access\_point](#output\_s3control\_object\_lambda\_access\_point) | S3 Control |
| <a name="output_s3control_object_lambda_access_point_policy"></a> [s3control\_object\_lambda\_access\_point\_policy](#output\_s3control\_object\_lambda\_access\_point\_policy) | S3 Control |
| <a name="output_s3control_storage_lens_configuration"></a> [s3control\_storage\_lens\_configuration](#output\_s3control\_storage\_lens\_configuration) | S3 Control |
| <a name="output_s3outposts_endpoint"></a> [s3outposts\_endpoint](#output\_s3outposts\_endpoint) | S3 on Outposts |
| <a name="output_s3tables_namespace"></a> [s3tables\_namespace](#output\_s3tables\_namespace) | S3 Tables |
| <a name="output_s3tables_table"></a> [s3tables\_table](#output\_s3tables\_table) | S3 Tables |
| <a name="output_s3tables_table_bucket"></a> [s3tables\_table\_bucket](#output\_s3tables\_table\_bucket) | S3 Tables |
| <a name="output_s3tables_table_bucket_policy"></a> [s3tables\_table\_bucket\_policy](#output\_s3tables\_table\_bucket\_policy) | S3 Tables |
| <a name="output_s3tables_table_policy"></a> [s3tables\_table\_policy](#output\_s3tables\_table\_policy) | S3 Tables |
| <a name="output_sagemaker_app"></a> [sagemaker\_app](#output\_sagemaker\_app) | SageMaker AI |
| <a name="output_sagemaker_app_image_config"></a> [sagemaker\_app\_image\_config](#output\_sagemaker\_app\_image\_config) | SageMaker AI |
| <a name="output_sagemaker_code_repository"></a> [sagemaker\_code\_repository](#output\_sagemaker\_code\_repository) | SageMaker AI |
| <a name="output_sagemaker_data_quality_job_definition"></a> [sagemaker\_data\_quality\_job\_definition](#output\_sagemaker\_data\_quality\_job\_definition) | SageMaker AI |
| <a name="output_sagemaker_device"></a> [sagemaker\_device](#output\_sagemaker\_device) | SageMaker AI |
| <a name="output_sagemaker_device_fleet"></a> [sagemaker\_device\_fleet](#output\_sagemaker\_device\_fleet) | SageMaker AI |
| <a name="output_sagemaker_domain"></a> [sagemaker\_domain](#output\_sagemaker\_domain) | SageMaker AI |
| <a name="output_sagemaker_endpoint"></a> [sagemaker\_endpoint](#output\_sagemaker\_endpoint) | SageMaker AI |
| <a name="output_sagemaker_endpoint_configuration"></a> [sagemaker\_endpoint\_configuration](#output\_sagemaker\_endpoint\_configuration) | SageMaker AI |
| <a name="output_sagemaker_feature_group"></a> [sagemaker\_feature\_group](#output\_sagemaker\_feature\_group) | SageMaker AI |
| <a name="output_sagemaker_flow_definition"></a> [sagemaker\_flow\_definition](#output\_sagemaker\_flow\_definition) | SageMaker AI |
| <a name="output_sagemaker_hub"></a> [sagemaker\_hub](#output\_sagemaker\_hub) | SageMaker AI |
| <a name="output_sagemaker_human_task_ui"></a> [sagemaker\_human\_task\_ui](#output\_sagemaker\_human\_task\_ui) | SageMaker AI |
| <a name="output_sagemaker_image"></a> [sagemaker\_image](#output\_sagemaker\_image) | SageMaker AI |
| <a name="output_sagemaker_image_version"></a> [sagemaker\_image\_version](#output\_sagemaker\_image\_version) | SageMaker AI |
| <a name="output_sagemaker_mlflow_tracking_server"></a> [sagemaker\_mlflow\_tracking\_server](#output\_sagemaker\_mlflow\_tracking\_server) | SageMaker AI |
| <a name="output_sagemaker_model"></a> [sagemaker\_model](#output\_sagemaker\_model) | SageMaker AI |
| <a name="output_sagemaker_model_package_group"></a> [sagemaker\_model\_package\_group](#output\_sagemaker\_model\_package\_group) | SageMaker AI |
| <a name="output_sagemaker_model_package_group_policy"></a> [sagemaker\_model\_package\_group\_policy](#output\_sagemaker\_model\_package\_group\_policy) | SageMaker AI |
| <a name="output_sagemaker_monitoring_schedule"></a> [sagemaker\_monitoring\_schedule](#output\_sagemaker\_monitoring\_schedule) | SageMaker AI |
| <a name="output_sagemaker_notebook_instance"></a> [sagemaker\_notebook\_instance](#output\_sagemaker\_notebook\_instance) | SageMaker AI |
| <a name="output_sagemaker_notebook_instance_lifecycle_configuration"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration](#output\_sagemaker\_notebook\_instance\_lifecycle\_configuration) | SageMaker AI |
| <a name="output_sagemaker_pipeline"></a> [sagemaker\_pipeline](#output\_sagemaker\_pipeline) | SageMaker AI |
| <a name="output_sagemaker_project"></a> [sagemaker\_project](#output\_sagemaker\_project) | SageMaker AI |
| <a name="output_sagemaker_servicecatalog_portfolio_status"></a> [sagemaker\_servicecatalog\_portfolio\_status](#output\_sagemaker\_servicecatalog\_portfolio\_status) | SageMaker AI |
| <a name="output_sagemaker_space"></a> [sagemaker\_space](#output\_sagemaker\_space) | SageMaker AI |
| <a name="output_sagemaker_studio_lifecycle_config"></a> [sagemaker\_studio\_lifecycle\_config](#output\_sagemaker\_studio\_lifecycle\_config) | SageMaker AI |
| <a name="output_sagemaker_user_profile"></a> [sagemaker\_user\_profile](#output\_sagemaker\_user\_profile) | SageMaker AI |
| <a name="output_sagemaker_workforce"></a> [sagemaker\_workforce](#output\_sagemaker\_workforce) | SageMaker AI |
| <a name="output_sagemaker_workteam"></a> [sagemaker\_workteam](#output\_sagemaker\_workteam) | SageMaker AI |
| <a name="output_scheduler_schedule"></a> [scheduler\_schedule](#output\_scheduler\_schedule) | EventBridge Scheduler |
| <a name="output_scheduler_schedule_group"></a> [scheduler\_schedule\_group](#output\_scheduler\_schedule\_group) | EventBridge Scheduler |
| <a name="output_schemas_discoverer"></a> [schemas\_discoverer](#output\_schemas\_discoverer) | EventBridge Schemas |
| <a name="output_schemas_registry"></a> [schemas\_registry](#output\_schemas\_registry) | EventBridge Schemas |
| <a name="output_schemas_registry_policy"></a> [schemas\_registry\_policy](#output\_schemas\_registry\_policy) | EventBridge Schemas |
| <a name="output_schemas_schema"></a> [schemas\_schema](#output\_schemas\_schema) | EventBridge Schemas |
| <a name="output_secretsmanager_secret"></a> [secretsmanager\_secret](#output\_secretsmanager\_secret) | Secrets Manager |
| <a name="output_secretsmanager_secret_policy"></a> [secretsmanager\_secret\_policy](#output\_secretsmanager\_secret\_policy) | Secrets Manager |
| <a name="output_secretsmanager_secret_rotation"></a> [secretsmanager\_secret\_rotation](#output\_secretsmanager\_secret\_rotation) | Secrets Manager |
| <a name="output_secretsmanager_secret_version"></a> [secretsmanager\_secret\_version](#output\_secretsmanager\_secret\_version) | Secrets Manager |
| <a name="output_security_group"></a> [security\_group](#output\_security\_group) | Virtual Private Cloud |
| <a name="output_security_group_rule"></a> [security\_group\_rule](#output\_security\_group\_rule) | Virtual Private Cloud |
| <a name="output_securityhub_account"></a> [securityhub\_account](#output\_securityhub\_account) | Security Hub |
| <a name="output_securityhub_action_target"></a> [securityhub\_action\_target](#output\_securityhub\_action\_target) | Security Hub |
| <a name="output_securityhub_automation_rule"></a> [securityhub\_automation\_rule](#output\_securityhub\_automation\_rule) | Security Hub |
| <a name="output_securityhub_configuration_policy"></a> [securityhub\_configuration\_policy](#output\_securityhub\_configuration\_policy) | Security Hub |
| <a name="output_securityhub_configuration_policy_association"></a> [securityhub\_configuration\_policy\_association](#output\_securityhub\_configuration\_policy\_association) | Security Hub |
| <a name="output_securityhub_finding_aggregator"></a> [securityhub\_finding\_aggregator](#output\_securityhub\_finding\_aggregator) | Security Hub |
| <a name="output_securityhub_insight"></a> [securityhub\_insight](#output\_securityhub\_insight) | Security Hub |
| <a name="output_securityhub_invite_accepter"></a> [securityhub\_invite\_accepter](#output\_securityhub\_invite\_accepter) | Security Hub |
| <a name="output_securityhub_member"></a> [securityhub\_member](#output\_securityhub\_member) | Security Hub |
| <a name="output_securityhub_organization_admin_account"></a> [securityhub\_organization\_admin\_account](#output\_securityhub\_organization\_admin\_account) | Security Hub |
| <a name="output_securityhub_organization_configuration"></a> [securityhub\_organization\_configuration](#output\_securityhub\_organization\_configuration) | Security Hub |
| <a name="output_securityhub_product_subscription"></a> [securityhub\_product\_subscription](#output\_securityhub\_product\_subscription) | Security Hub |
| <a name="output_securityhub_standards_control"></a> [securityhub\_standards\_control](#output\_securityhub\_standards\_control) | Security Hub |
| <a name="output_securityhub_standards_control_association"></a> [securityhub\_standards\_control\_association](#output\_securityhub\_standards\_control\_association) | Security Hub |
| <a name="output_securityhub_standards_subscription"></a> [securityhub\_standards\_subscription](#output\_securityhub\_standards\_subscription) | Security Hub |
| <a name="output_securitylake_aws_log_source"></a> [securitylake\_aws\_log\_source](#output\_securitylake\_aws\_log\_source) | Security Lake |
| <a name="output_securitylake_custom_log_source"></a> [securitylake\_custom\_log\_source](#output\_securitylake\_custom\_log\_source) | Security Lake |
| <a name="output_securitylake_data_lake"></a> [securitylake\_data\_lake](#output\_securitylake\_data\_lake) | Security Lake |
| <a name="output_securitylake_subscriber"></a> [securitylake\_subscriber](#output\_securitylake\_subscriber) | Security Lake |
| <a name="output_securitylake_subscriber_notification"></a> [securitylake\_subscriber\_notification](#output\_securitylake\_subscriber\_notification) | Security Lake |
| <a name="output_serverlessapplicationrepository_cloudformation_stack"></a> [serverlessapplicationrepository\_cloudformation\_stack](#output\_serverlessapplicationrepository\_cloudformation\_stack) | Serverless Application Repository |
| <a name="output_service_discovery_http_namespace"></a> [service\_discovery\_http\_namespace](#output\_service\_discovery\_http\_namespace) | Cloud Map |
| <a name="output_service_discovery_instance"></a> [service\_discovery\_instance](#output\_service\_discovery\_instance) | Cloud Map |
| <a name="output_service_discovery_private_dns_namespace"></a> [service\_discovery\_private\_dns\_namespace](#output\_service\_discovery\_private\_dns\_namespace) | Cloud Map |
| <a name="output_service_discovery_public_dns_namespace"></a> [service\_discovery\_public\_dns\_namespace](#output\_service\_discovery\_public\_dns\_namespace) | Cloud Map |
| <a name="output_service_discovery_service"></a> [service\_discovery\_service](#output\_service\_discovery\_service) | Cloud Map |
| <a name="output_servicecatalog_budget_resource_association"></a> [servicecatalog\_budget\_resource\_association](#output\_servicecatalog\_budget\_resource\_association) | Service Catalog |
| <a name="output_servicecatalog_constraint"></a> [servicecatalog\_constraint](#output\_servicecatalog\_constraint) | Service Catalog |
| <a name="output_servicecatalog_organizations_access"></a> [servicecatalog\_organizations\_access](#output\_servicecatalog\_organizations\_access) | Service Catalog |
| <a name="output_servicecatalog_portfolio"></a> [servicecatalog\_portfolio](#output\_servicecatalog\_portfolio) | Service Catalog |
| <a name="output_servicecatalog_portfolio_share"></a> [servicecatalog\_portfolio\_share](#output\_servicecatalog\_portfolio\_share) | Service Catalog |
| <a name="output_servicecatalog_principal_portfolio_association"></a> [servicecatalog\_principal\_portfolio\_association](#output\_servicecatalog\_principal\_portfolio\_association) | Service Catalog |
| <a name="output_servicecatalog_product"></a> [servicecatalog\_product](#output\_servicecatalog\_product) | Service Catalog |
| <a name="output_servicecatalog_product_portfolio_association"></a> [servicecatalog\_product\_portfolio\_association](#output\_servicecatalog\_product\_portfolio\_association) | Service Catalog |
| <a name="output_servicecatalog_provisioned_product"></a> [servicecatalog\_provisioned\_product](#output\_servicecatalog\_provisioned\_product) | Service Catalog |
| <a name="output_servicecatalog_provisioning_artifact"></a> [servicecatalog\_provisioning\_artifact](#output\_servicecatalog\_provisioning\_artifact) | Service Catalog |
| <a name="output_servicecatalog_service_action"></a> [servicecatalog\_service\_action](#output\_servicecatalog\_service\_action) | Service Catalog |
| <a name="output_servicecatalog_tag_option"></a> [servicecatalog\_tag\_option](#output\_servicecatalog\_tag\_option) | Service Catalog |
| <a name="output_servicecatalog_tag_option_resource_association"></a> [servicecatalog\_tag\_option\_resource\_association](#output\_servicecatalog\_tag\_option\_resource\_association) | Service Catalog |
| <a name="output_servicecatalogappregistry_application"></a> [servicecatalogappregistry\_application](#output\_servicecatalogappregistry\_application) | Service Catalog AppRegistry |
| <a name="output_servicecatalogappregistry_attribute_group"></a> [servicecatalogappregistry\_attribute\_group](#output\_servicecatalogappregistry\_attribute\_group) | Service Catalog AppRegistry |
| <a name="output_servicecatalogappregistry_attribute_group_association"></a> [servicecatalogappregistry\_attribute\_group\_association](#output\_servicecatalogappregistry\_attribute\_group\_association) | Service Catalog AppRegistry |
| <a name="output_servicequotas_service_quota"></a> [servicequotas\_service\_quota](#output\_servicequotas\_service\_quota) | Service Quotas |
| <a name="output_servicequotas_template"></a> [servicequotas\_template](#output\_servicequotas\_template) | Service Quotas |
| <a name="output_servicequotas_template_association"></a> [servicequotas\_template\_association](#output\_servicequotas\_template\_association) | Service Quotas |
| <a name="output_ses_active_receipt_rule_set"></a> [ses\_active\_receipt\_rule\_set](#output\_ses\_active\_receipt\_rule\_set) | Simple Email |
| <a name="output_ses_configuration_set"></a> [ses\_configuration\_set](#output\_ses\_configuration\_set) | Simple Email |
| <a name="output_ses_domain_dkim"></a> [ses\_domain\_dkim](#output\_ses\_domain\_dkim) | Simple Email |
| <a name="output_ses_domain_identity"></a> [ses\_domain\_identity](#output\_ses\_domain\_identity) | Simple Email |
| <a name="output_ses_domain_identity_verification"></a> [ses\_domain\_identity\_verification](#output\_ses\_domain\_identity\_verification) | Simple Email |
| <a name="output_ses_domain_mail_from"></a> [ses\_domain\_mail\_from](#output\_ses\_domain\_mail\_from) | Simple Email |
| <a name="output_ses_email_identity"></a> [ses\_email\_identity](#output\_ses\_email\_identity) | Simple Email |
| <a name="output_ses_event_destination"></a> [ses\_event\_destination](#output\_ses\_event\_destination) | Simple Email |
| <a name="output_ses_identity_notification_topic"></a> [ses\_identity\_notification\_topic](#output\_ses\_identity\_notification\_topic) | Simple Email |
| <a name="output_ses_identity_policy"></a> [ses\_identity\_policy](#output\_ses\_identity\_policy) | Simple Email |
| <a name="output_ses_receipt_filter"></a> [ses\_receipt\_filter](#output\_ses\_receipt\_filter) | Simple Email |
| <a name="output_ses_receipt_rule"></a> [ses\_receipt\_rule](#output\_ses\_receipt\_rule) | Simple Email |
| <a name="output_ses_receipt_rule_set"></a> [ses\_receipt\_rule\_set](#output\_ses\_receipt\_rule\_set) | Simple Email |
| <a name="output_ses_template"></a> [ses\_template](#output\_ses\_template) | Simple Email |
| <a name="output_sesv2_account_suppression_attributes"></a> [sesv2\_account\_suppression\_attributes](#output\_sesv2\_account\_suppression\_attributes) | Simple Email V2 |
| <a name="output_sesv2_account_vdm_attributes"></a> [sesv2\_account\_vdm\_attributes](#output\_sesv2\_account\_vdm\_attributes) | Simple Email V2 |
| <a name="output_sesv2_configuration_set"></a> [sesv2\_configuration\_set](#output\_sesv2\_configuration\_set) | Simple Email V2 |
| <a name="output_sesv2_configuration_set_event_destination"></a> [sesv2\_configuration\_set\_event\_destination](#output\_sesv2\_configuration\_set\_event\_destination) | Simple Email V2 |
| <a name="output_sesv2_contact_list"></a> [sesv2\_contact\_list](#output\_sesv2\_contact\_list) | Simple Email V2 |
| <a name="output_sesv2_dedicated_ip_assignment"></a> [sesv2\_dedicated\_ip\_assignment](#output\_sesv2\_dedicated\_ip\_assignment) | Simple Email V2 |
| <a name="output_sesv2_dedicated_ip_pool"></a> [sesv2\_dedicated\_ip\_pool](#output\_sesv2\_dedicated\_ip\_pool) | Simple Email V2 |
| <a name="output_sesv2_email_identity"></a> [sesv2\_email\_identity](#output\_sesv2\_email\_identity) | Simple Email V2 |
| <a name="output_sesv2_email_identity_feedback_attributes"></a> [sesv2\_email\_identity\_feedback\_attributes](#output\_sesv2\_email\_identity\_feedback\_attributes) | Simple Email V2 |
| <a name="output_sesv2_email_identity_mail_from_attributes"></a> [sesv2\_email\_identity\_mail\_from\_attributes](#output\_sesv2\_email\_identity\_mail\_from\_attributes) | Simple Email V2 |
| <a name="output_sesv2_email_identity_policy"></a> [sesv2\_email\_identity\_policy](#output\_sesv2\_email\_identity\_policy) | Simple Email V2 |
| <a name="output_sfn_activity"></a> [sfn\_activity](#output\_sfn\_activity) | Step Functions |
| <a name="output_sfn_alias"></a> [sfn\_alias](#output\_sfn\_alias) | Step Functions |
| <a name="output_sfn_state_machine"></a> [sfn\_state\_machine](#output\_sfn\_state\_machine) | Step Functions |
| <a name="output_shield_application_layer_automatic_response"></a> [shield\_application\_layer\_automatic\_response](#output\_shield\_application\_layer\_automatic\_response) | Shield |
| <a name="output_shield_drt_access_log_bucket_association"></a> [shield\_drt\_access\_log\_bucket\_association](#output\_shield\_drt\_access\_log\_bucket\_association) | Shield |
| <a name="output_shield_drt_access_role_arn_association"></a> [shield\_drt\_access\_role\_arn\_association](#output\_shield\_drt\_access\_role\_arn\_association) | Shield |
| <a name="output_shield_proactive_engagement"></a> [shield\_proactive\_engagement](#output\_shield\_proactive\_engagement) | Shield |
| <a name="output_shield_protection"></a> [shield\_protection](#output\_shield\_protection) | Shield |
| <a name="output_shield_protection_group"></a> [shield\_protection\_group](#output\_shield\_protection\_group) | Shield |
| <a name="output_shield_protection_health_check_association"></a> [shield\_protection\_health\_check\_association](#output\_shield\_protection\_health\_check\_association) | Shield |
| <a name="output_shield_subscription"></a> [shield\_subscription](#output\_shield\_subscription) | Shield |
| <a name="output_signer_signing_job"></a> [signer\_signing\_job](#output\_signer\_signing\_job) | Signer |
| <a name="output_signer_signing_profile"></a> [signer\_signing\_profile](#output\_signer\_signing\_profile) | Signer |
| <a name="output_signer_signing_profile_permission"></a> [signer\_signing\_profile\_permission](#output\_signer\_signing\_profile\_permission) | Signer |
| <a name="output_simpledb_domain"></a> [simpledb\_domain](#output\_simpledb\_domain) | SimpleDB |
| <a name="output_snapshot_create_volume_permission"></a> [snapshot\_create\_volume\_permission](#output\_snapshot\_create\_volume\_permission) | EC2 |
| <a name="output_sns_platform_application"></a> [sns\_platform\_application](#output\_sns\_platform\_application) | Simple Notification |
| <a name="output_sns_sms_preferences"></a> [sns\_sms\_preferences](#output\_sns\_sms\_preferences) | Simple Notification |
| <a name="output_sns_topic"></a> [sns\_topic](#output\_sns\_topic) | Simple Notification |
| <a name="output_sns_topic_data_protection_policy"></a> [sns\_topic\_data\_protection\_policy](#output\_sns\_topic\_data\_protection\_policy) | Simple Notification |
| <a name="output_sns_topic_policy"></a> [sns\_topic\_policy](#output\_sns\_topic\_policy) | Simple Notification |
| <a name="output_sns_topic_subscription"></a> [sns\_topic\_subscription](#output\_sns\_topic\_subscription) | Simple Notification |
| <a name="output_spot_datafeed_subscription"></a> [spot\_datafeed\_subscription](#output\_spot\_datafeed\_subscription) | Elastic Compute Cloud |
| <a name="output_spot_fleet_request"></a> [spot\_fleet\_request](#output\_spot\_fleet\_request) | Elastic Compute Cloud |
| <a name="output_spot_instance_request"></a> [spot\_instance\_request](#output\_spot\_instance\_request) | Elastic Compute Cloud |
| <a name="output_sqs_queue"></a> [sqs\_queue](#output\_sqs\_queue) | Simple Queue |
| <a name="output_sqs_queue_policy"></a> [sqs\_queue\_policy](#output\_sqs\_queue\_policy) | Simple Queue |
| <a name="output_sqs_queue_redrive_allow_policy"></a> [sqs\_queue\_redrive\_allow\_policy](#output\_sqs\_queue\_redrive\_allow\_policy) | Simple Queue |
| <a name="output_sqs_queue_redrive_policy"></a> [sqs\_queue\_redrive\_policy](#output\_sqs\_queue\_redrive\_policy) | Simple Queue |
| <a name="output_ssm_activation"></a> [ssm\_activation](#output\_ssm\_activation) | Systems Manager |
| <a name="output_ssm_association"></a> [ssm\_association](#output\_ssm\_association) | Systems Manager |
| <a name="output_ssm_default_patch_baseline"></a> [ssm\_default\_patch\_baseline](#output\_ssm\_default\_patch\_baseline) | Systems Manager |
| <a name="output_ssm_document"></a> [ssm\_document](#output\_ssm\_document) | Systems Manager |
| <a name="output_ssm_maintenance_window"></a> [ssm\_maintenance\_window](#output\_ssm\_maintenance\_window) | Systems Manager |
| <a name="output_ssm_maintenance_window_target"></a> [ssm\_maintenance\_window\_target](#output\_ssm\_maintenance\_window\_target) | Systems Manager |
| <a name="output_ssm_maintenance_window_task"></a> [ssm\_maintenance\_window\_task](#output\_ssm\_maintenance\_window\_task) | Systems Manager |
| <a name="output_ssm_parameter"></a> [ssm\_parameter](#output\_ssm\_parameter) | Systems Manager |
| <a name="output_ssm_patch_baseline"></a> [ssm\_patch\_baseline](#output\_ssm\_patch\_baseline) | Systems Manager |
| <a name="output_ssm_patch_group"></a> [ssm\_patch\_group](#output\_ssm\_patch\_group) | Systems Manager |
| <a name="output_ssm_resource_data_sync"></a> [ssm\_resource\_data\_sync](#output\_ssm\_resource\_data\_sync) | Systems Manager |
| <a name="output_ssm_service_setting"></a> [ssm\_service\_setting](#output\_ssm\_service\_setting) | Systems Manager |
| <a name="output_ssmcontacts_contact"></a> [ssmcontacts\_contact](#output\_ssmcontacts\_contact) | SSM Contacts |
| <a name="output_ssmcontacts_contact_channel"></a> [ssmcontacts\_contact\_channel](#output\_ssmcontacts\_contact\_channel) | SSM Contacts |
| <a name="output_ssmcontacts_plan"></a> [ssmcontacts\_plan](#output\_ssmcontacts\_plan) | SSM Contacts |
| <a name="output_ssmcontacts_rotation"></a> [ssmcontacts\_rotation](#output\_ssmcontacts\_rotation) | SSM Contacts |
| <a name="output_ssmincidents_replication_set"></a> [ssmincidents\_replication\_set](#output\_ssmincidents\_replication\_set) | SSM Incident Manager Incidents |
| <a name="output_ssmincidents_response_plan"></a> [ssmincidents\_response\_plan](#output\_ssmincidents\_response\_plan) | SSM Incident Manager Incidents |
| <a name="output_ssmquicksetup_configuration_manager"></a> [ssmquicksetup\_configuration\_manager](#output\_ssmquicksetup\_configuration\_manager) | SSM Quick Setup |
| <a name="output_ssoadmin_account_assignment"></a> [ssoadmin\_account\_assignment](#output\_ssoadmin\_account\_assignment) | SSO Admin |
| <a name="output_ssoadmin_application"></a> [ssoadmin\_application](#output\_ssoadmin\_application) | SSO Admin |
| <a name="output_ssoadmin_application_access_scope"></a> [ssoadmin\_application\_access\_scope](#output\_ssoadmin\_application\_access\_scope) | SSO Admin |
| <a name="output_ssoadmin_application_assignment"></a> [ssoadmin\_application\_assignment](#output\_ssoadmin\_application\_assignment) | SSO Admin |
| <a name="output_ssoadmin_application_assignment_configuration"></a> [ssoadmin\_application\_assignment\_configuration](#output\_ssoadmin\_application\_assignment\_configuration) | SSO Admin |
| <a name="output_ssoadmin_customer_managed_policy_attachment"></a> [ssoadmin\_customer\_managed\_policy\_attachment](#output\_ssoadmin\_customer\_managed\_policy\_attachment) | SSO Admin |
| <a name="output_ssoadmin_instance_access_control_attributes"></a> [ssoadmin\_instance\_access\_control\_attributes](#output\_ssoadmin\_instance\_access\_control\_attributes) | SSO Admin |
| <a name="output_ssoadmin_managed_policy_attachment"></a> [ssoadmin\_managed\_policy\_attachment](#output\_ssoadmin\_managed\_policy\_attachment) | SSO Admin |
| <a name="output_ssoadmin_permission_set"></a> [ssoadmin\_permission\_set](#output\_ssoadmin\_permission\_set) | SSO Admin |
| <a name="output_ssoadmin_permission_set_inline_policy"></a> [ssoadmin\_permission\_set\_inline\_policy](#output\_ssoadmin\_permission\_set\_inline\_policy) | SSO Admin |
| <a name="output_ssoadmin_permissions_boundary_attachment"></a> [ssoadmin\_permissions\_boundary\_attachment](#output\_ssoadmin\_permissions\_boundary\_attachment) | SSO Admin |
| <a name="output_ssoadmin_trusted_token_issuer"></a> [ssoadmin\_trusted\_token\_issuer](#output\_ssoadmin\_trusted\_token\_issuer) | SSO Admin |
| <a name="output_storagegateway_cache"></a> [storagegateway\_cache](#output\_storagegateway\_cache) | Storage Gateway |
| <a name="output_storagegateway_cached_iscsi_volume"></a> [storagegateway\_cached\_iscsi\_volume](#output\_storagegateway\_cached\_iscsi\_volume) | Storage Gateway |
| <a name="output_storagegateway_file_system_association"></a> [storagegateway\_file\_system\_association](#output\_storagegateway\_file\_system\_association) | Storage Gateway |
| <a name="output_storagegateway_gateway"></a> [storagegateway\_gateway](#output\_storagegateway\_gateway) | Storage Gateway |
| <a name="output_storagegateway_nfs_file_share"></a> [storagegateway\_nfs\_file\_share](#output\_storagegateway\_nfs\_file\_share) | Storage Gateway |
| <a name="output_storagegateway_smb_file_share"></a> [storagegateway\_smb\_file\_share](#output\_storagegateway\_smb\_file\_share) | Storage Gateway |
| <a name="output_storagegateway_stored_iscsi_volume"></a> [storagegateway\_stored\_iscsi\_volume](#output\_storagegateway\_stored\_iscsi\_volume) | Storage Gateway |
| <a name="output_storagegateway_tape_pool"></a> [storagegateway\_tape\_pool](#output\_storagegateway\_tape\_pool) | Storage Gateway |
| <a name="output_storagegateway_upload_buffer"></a> [storagegateway\_upload\_buffer](#output\_storagegateway\_upload\_buffer) | Storage Gateway |
| <a name="output_storagegateway_working_storage"></a> [storagegateway\_working\_storage](#output\_storagegateway\_working\_storage) | Storage Gateway |
| <a name="output_subnet"></a> [subnet](#output\_subnet) | Virtual Private Cloud |
| <a name="output_swf_domain"></a> [swf\_domain](#output\_swf\_domain) | Simple Workflow |
| <a name="output_synthetics_canary"></a> [synthetics\_canary](#output\_synthetics\_canary) | CloudWatch Synthetics |
| <a name="output_synthetics_group"></a> [synthetics\_group](#output\_synthetics\_group) | CloudWatch Synthetics |
| <a name="output_synthetics_group_association"></a> [synthetics\_group\_association](#output\_synthetics\_group\_association) | CloudWatch Synthetics |
| <a name="output_tags"></a> [tags](#output\_tags) | Tags |
| <a name="output_timestreaminfluxdb_db_instance"></a> [timestreaminfluxdb\_db\_instance](#output\_timestreaminfluxdb\_db\_instance) | Timestream for InfluxDB |
| <a name="output_timestreamquery_scheduled_query"></a> [timestreamquery\_scheduled\_query](#output\_timestreamquery\_scheduled\_query) | Timestream Query |
| <a name="output_timestreamwrite_database"></a> [timestreamwrite\_database](#output\_timestreamwrite\_database) | Timestream Write |
| <a name="output_timestreamwrite_table"></a> [timestreamwrite\_table](#output\_timestreamwrite\_table) | Timestream Write |
| <a name="output_transcribe_language_model"></a> [transcribe\_language\_model](#output\_transcribe\_language\_model) | Transcribe |
| <a name="output_transcribe_medical_vocabulary"></a> [transcribe\_medical\_vocabulary](#output\_transcribe\_medical\_vocabulary) | Transcribe |
| <a name="output_transcribe_vocabulary"></a> [transcribe\_vocabulary](#output\_transcribe\_vocabulary) | Transcribe |
| <a name="output_transcribe_vocabulary_filter"></a> [transcribe\_vocabulary\_filter](#output\_transcribe\_vocabulary\_filter) | Transcribe |
| <a name="output_transfer_access"></a> [transfer\_access](#output\_transfer\_access) | Transfer Family |
| <a name="output_transfer_agreement"></a> [transfer\_agreement](#output\_transfer\_agreement) | Transfer Family |
| <a name="output_transfer_certificate"></a> [transfer\_certificate](#output\_transfer\_certificate) | Transfer Family |
| <a name="output_transfer_connector"></a> [transfer\_connector](#output\_transfer\_connector) | Transfer Family |
| <a name="output_transfer_profile"></a> [transfer\_profile](#output\_transfer\_profile) | Transfer Family |
| <a name="output_transfer_server"></a> [transfer\_server](#output\_transfer\_server) | Transfer Family |
| <a name="output_transfer_ssh_key"></a> [transfer\_ssh\_key](#output\_transfer\_ssh\_key) | Transfer Family |
| <a name="output_transfer_tag"></a> [transfer\_tag](#output\_transfer\_tag) | Transfer Family |
| <a name="output_transfer_user"></a> [transfer\_user](#output\_transfer\_user) | Transfer Family |
| <a name="output_transfer_workflow"></a> [transfer\_workflow](#output\_transfer\_workflow) | Transfer Family |
| <a name="output_verifiedaccess_endpoint"></a> [verifiedaccess\_endpoint](#output\_verifiedaccess\_endpoint) | Verified Access |
| <a name="output_verifiedaccess_group"></a> [verifiedaccess\_group](#output\_verifiedaccess\_group) | Verified Access |
| <a name="output_verifiedaccess_instance"></a> [verifiedaccess\_instance](#output\_verifiedaccess\_instance) | Verified Access |
| <a name="output_verifiedaccess_instance_logging_configuration"></a> [verifiedaccess\_instance\_logging\_configuration](#output\_verifiedaccess\_instance\_logging\_configuration) | Verified Access |
| <a name="output_verifiedaccess_instance_trust_provider_attachment"></a> [verifiedaccess\_instance\_trust\_provider\_attachment](#output\_verifiedaccess\_instance\_trust\_provider\_attachment) | Verified Access |
| <a name="output_verifiedaccess_trust_provider"></a> [verifiedaccess\_trust\_provider](#output\_verifiedaccess\_trust\_provider) | Verified Access |
| <a name="output_verifiedpermissions_identity_source"></a> [verifiedpermissions\_identity\_source](#output\_verifiedpermissions\_identity\_source) | Verified Permissions |
| <a name="output_verifiedpermissions_policy"></a> [verifiedpermissions\_policy](#output\_verifiedpermissions\_policy) | Verified Permissions |
| <a name="output_verifiedpermissions_policy_store"></a> [verifiedpermissions\_policy\_store](#output\_verifiedpermissions\_policy\_store) | Verified Permissions |
| <a name="output_verifiedpermissions_policy_template"></a> [verifiedpermissions\_policy\_template](#output\_verifiedpermissions\_policy\_template) | Verified Permissions |
| <a name="output_verifiedpermissions_schema"></a> [verifiedpermissions\_schema](#output\_verifiedpermissions\_schema) | Verified Permissions |
| <a name="output_volume_attachment"></a> [volume\_attachment](#output\_volume\_attachment) | EC2 |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | Virtual Private Cloud |
| <a name="output_vpc_block_public_access_exclusion"></a> [vpc\_block\_public\_access\_exclusion](#output\_vpc\_block\_public\_access\_exclusion) | Virtual Private Cloud |
| <a name="output_vpc_block_public_access_options"></a> [vpc\_block\_public\_access\_options](#output\_vpc\_block\_public\_access\_options) | Virtual Private Cloud |
| <a name="output_vpc_dhcp_options"></a> [vpc\_dhcp\_options](#output\_vpc\_dhcp\_options) | Virtual Private Cloud |
| <a name="output_vpc_dhcp_options_association"></a> [vpc\_dhcp\_options\_association](#output\_vpc\_dhcp\_options\_association) | Virtual Private Cloud |
| <a name="output_vpc_endpoint"></a> [vpc\_endpoint](#output\_vpc\_endpoint) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_connection_accepter"></a> [vpc\_endpoint\_connection\_accepter](#output\_vpc\_endpoint\_connection\_accepter) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_connection_notification"></a> [vpc\_endpoint\_connection\_notification](#output\_vpc\_endpoint\_connection\_notification) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_policy"></a> [vpc\_endpoint\_policy](#output\_vpc\_endpoint\_policy) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_private_dns"></a> [vpc\_endpoint\_private\_dns](#output\_vpc\_endpoint\_private\_dns) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_route_table_association"></a> [vpc\_endpoint\_route\_table\_association](#output\_vpc\_endpoint\_route\_table\_association) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_security_group_association"></a> [vpc\_endpoint\_security\_group\_association](#output\_vpc\_endpoint\_security\_group\_association) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_service"></a> [vpc\_endpoint\_service](#output\_vpc\_endpoint\_service) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_service_allowed_principal"></a> [vpc\_endpoint\_service\_allowed\_principal](#output\_vpc\_endpoint\_service\_allowed\_principal) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_service_private_dns_verification"></a> [vpc\_endpoint\_service\_private\_dns\_verification](#output\_vpc\_endpoint\_service\_private\_dns\_verification) | Virtual Private Cloud |
| <a name="output_vpc_endpoint_subnet_association"></a> [vpc\_endpoint\_subnet\_association](#output\_vpc\_endpoint\_subnet\_association) | Virtual Private Cloud |
| <a name="output_vpc_ipam"></a> [vpc\_ipam](#output\_vpc\_ipam) | IP Address Manager |
| <a name="output_vpc_ipam_organization_admin_account"></a> [vpc\_ipam\_organization\_admin\_account](#output\_vpc\_ipam\_organization\_admin\_account) | IP Address Manager |
| <a name="output_vpc_ipam_pool"></a> [vpc\_ipam\_pool](#output\_vpc\_ipam\_pool) | IP Address Manager |
| <a name="output_vpc_ipam_pool_cidr"></a> [vpc\_ipam\_pool\_cidr](#output\_vpc\_ipam\_pool\_cidr) | IP Address Manager |
| <a name="output_vpc_ipam_pool_cidr_allocation"></a> [vpc\_ipam\_pool\_cidr\_allocation](#output\_vpc\_ipam\_pool\_cidr\_allocation) | IP Address Manager |
| <a name="output_vpc_ipam_preview_next_cidr"></a> [vpc\_ipam\_preview\_next\_cidr](#output\_vpc\_ipam\_preview\_next\_cidr) | IP Address Manager |
| <a name="output_vpc_ipam_resource_discovery"></a> [vpc\_ipam\_resource\_discovery](#output\_vpc\_ipam\_resource\_discovery) | IP Address Manager |
| <a name="output_vpc_ipam_resource_discovery_association"></a> [vpc\_ipam\_resource\_discovery\_association](#output\_vpc\_ipam\_resource\_discovery\_association) | IP Address Manager |
| <a name="output_vpc_ipam_scope"></a> [vpc\_ipam\_scope](#output\_vpc\_ipam\_scope) | IP Address Manager |
| <a name="output_vpc_ipv4_cidr_block_association"></a> [vpc\_ipv4\_cidr\_block\_association](#output\_vpc\_ipv4\_cidr\_block\_association) | Virtual Private Cloud |
| <a name="output_vpc_ipv6_cidr_block_association"></a> [vpc\_ipv6\_cidr\_block\_association](#output\_vpc\_ipv6\_cidr\_block\_association) | Virtual Private Cloud |
| <a name="output_vpc_network_performance_metric_subscription"></a> [vpc\_network\_performance\_metric\_subscription](#output\_vpc\_network\_performance\_metric\_subscription) | Virtual Private Cloud |
| <a name="output_vpc_peering_connection"></a> [vpc\_peering\_connection](#output\_vpc\_peering\_connection) | Virtual Private Cloud |
| <a name="output_vpc_peering_connection_accepter"></a> [vpc\_peering\_connection\_accepter](#output\_vpc\_peering\_connection\_accepter) | Virtual Private Cloud |
| <a name="output_vpc_peering_connection_options"></a> [vpc\_peering\_connection\_options](#output\_vpc\_peering\_connection\_options) | Virtual Private Cloud |
| <a name="output_vpc_security_group_egress_rule"></a> [vpc\_security\_group\_egress\_rule](#output\_vpc\_security\_group\_egress\_rule) | Virtual Private Cloud |
| <a name="output_vpc_security_group_ingress_rule"></a> [vpc\_security\_group\_ingress\_rule](#output\_vpc\_security\_group\_ingress\_rule) | Virtual Private Cloud |
| <a name="output_vpc_security_group_vpc_association"></a> [vpc\_security\_group\_vpc\_association](#output\_vpc\_security\_group\_vpc\_association) | Virtual Private Cloud |
| <a name="output_vpclattice_access_log_subscription"></a> [vpclattice\_access\_log\_subscription](#output\_vpclattice\_access\_log\_subscription) | VPC Lattice |
| <a name="output_vpclattice_auth_policy"></a> [vpclattice\_auth\_policy](#output\_vpclattice\_auth\_policy) | VPC Lattice |
| <a name="output_vpclattice_listener"></a> [vpclattice\_listener](#output\_vpclattice\_listener) | VPC Lattice |
| <a name="output_vpclattice_listener_rule"></a> [vpclattice\_listener\_rule](#output\_vpclattice\_listener\_rule) | VPC Lattice |
| <a name="output_vpclattice_resource_configuration"></a> [vpclattice\_resource\_configuration](#output\_vpclattice\_resource\_configuration) | VPC Lattice |
| <a name="output_vpclattice_resource_gateway"></a> [vpclattice\_resource\_gateway](#output\_vpclattice\_resource\_gateway) | VPC Lattice |
| <a name="output_vpclattice_resource_policy"></a> [vpclattice\_resource\_policy](#output\_vpclattice\_resource\_policy) | VPC Lattice |
| <a name="output_vpclattice_service"></a> [vpclattice\_service](#output\_vpclattice\_service) | VPC Lattice |
| <a name="output_vpclattice_service_network"></a> [vpclattice\_service\_network](#output\_vpclattice\_service\_network) | VPC Lattice |
| <a name="output_vpclattice_service_network_resource_association"></a> [vpclattice\_service\_network\_resource\_association](#output\_vpclattice\_service\_network\_resource\_association) | VPC Lattice |
| <a name="output_vpclattice_service_network_service_association"></a> [vpclattice\_service\_network\_service\_association](#output\_vpclattice\_service\_network\_service\_association) | VPC Lattice |
| <a name="output_vpclattice_service_network_vpc_association"></a> [vpclattice\_service\_network\_vpc\_association](#output\_vpclattice\_service\_network\_vpc\_association) | VPC Lattice |
| <a name="output_vpclattice_target_group"></a> [vpclattice\_target\_group](#output\_vpclattice\_target\_group) | VPC Lattice |
| <a name="output_vpclattice_target_group_attachment"></a> [vpclattice\_target\_group\_attachment](#output\_vpclattice\_target\_group\_attachment) | VPC Lattice |
| <a name="output_vpn_connection"></a> [vpn\_connection](#output\_vpn\_connection) | Site-to-Site |
| <a name="output_vpn_connection_route"></a> [vpn\_connection\_route](#output\_vpn\_connection\_route) | Site-to-Site |
| <a name="output_vpn_gateway"></a> [vpn\_gateway](#output\_vpn\_gateway) | Site-to-Site |
| <a name="output_vpn_gateway_attachment"></a> [vpn\_gateway\_attachment](#output\_vpn\_gateway\_attachment) | Site-to-Site |
| <a name="output_vpn_gateway_route_propagation"></a> [vpn\_gateway\_route\_propagation](#output\_vpn\_gateway\_route\_propagation) | Site-to-Site |
| <a name="output_waf_byte_match_set"></a> [waf\_byte\_match\_set](#output\_waf\_byte\_match\_set) | WAF Classic |
| <a name="output_waf_geo_match_set"></a> [waf\_geo\_match\_set](#output\_waf\_geo\_match\_set) | WAF Classic |
| <a name="output_waf_ipset"></a> [waf\_ipset](#output\_waf\_ipset) | WAF Classic |
| <a name="output_waf_rate_based_rule"></a> [waf\_rate\_based\_rule](#output\_waf\_rate\_based\_rule) | WAF Classic |
| <a name="output_waf_regex_match_set"></a> [waf\_regex\_match\_set](#output\_waf\_regex\_match\_set) | WAF Classic |
| <a name="output_waf_regex_pattern_set"></a> [waf\_regex\_pattern\_set](#output\_waf\_regex\_pattern\_set) | WAF Classic |
| <a name="output_waf_rule"></a> [waf\_rule](#output\_waf\_rule) | WAF Classic |
| <a name="output_waf_rule_group"></a> [waf\_rule\_group](#output\_waf\_rule\_group) | WAF Classic |
| <a name="output_waf_size_constraint_set"></a> [waf\_size\_constraint\_set](#output\_waf\_size\_constraint\_set) | WAF Classic |
| <a name="output_waf_sql_injection_match_set"></a> [waf\_sql\_injection\_match\_set](#output\_waf\_sql\_injection\_match\_set) | WAF Classic |
| <a name="output_waf_web_acl"></a> [waf\_web\_acl](#output\_waf\_web\_acl) | WAF Classic |
| <a name="output_waf_xss_match_set"></a> [waf\_xss\_match\_set](#output\_waf\_xss\_match\_set) | WAF Classic |
| <a name="output_wafregional_byte_match_set"></a> [wafregional\_byte\_match\_set](#output\_wafregional\_byte\_match\_set) | WAF Classic Regional |
| <a name="output_wafregional_geo_match_set"></a> [wafregional\_geo\_match\_set](#output\_wafregional\_geo\_match\_set) | WAF Classic Regional |
| <a name="output_wafregional_ipset"></a> [wafregional\_ipset](#output\_wafregional\_ipset) | WAF Classic Regional |
| <a name="output_wafregional_rate_based_rule"></a> [wafregional\_rate\_based\_rule](#output\_wafregional\_rate\_based\_rule) | WAF Classic Regional |
| <a name="output_wafregional_regex_match_set"></a> [wafregional\_regex\_match\_set](#output\_wafregional\_regex\_match\_set) | WAF Classic Regional |
| <a name="output_wafregional_regex_pattern_set"></a> [wafregional\_regex\_pattern\_set](#output\_wafregional\_regex\_pattern\_set) | WAF Classic Regional |
| <a name="output_wafregional_rule"></a> [wafregional\_rule](#output\_wafregional\_rule) | WAF Classic Regional |
| <a name="output_wafregional_rule_group"></a> [wafregional\_rule\_group](#output\_wafregional\_rule\_group) | WAF Classic Regional |
| <a name="output_wafregional_size_constraint_set"></a> [wafregional\_size\_constraint\_set](#output\_wafregional\_size\_constraint\_set) | WAF Classic Regional |
| <a name="output_wafregional_sql_injection_match_set"></a> [wafregional\_sql\_injection\_match\_set](#output\_wafregional\_sql\_injection\_match\_set) | WAF Classic Regional |
| <a name="output_wafregional_web_acl"></a> [wafregional\_web\_acl](#output\_wafregional\_web\_acl) | WAF Classic Regional |
| <a name="output_wafregional_web_acl_association"></a> [wafregional\_web\_acl\_association](#output\_wafregional\_web\_acl\_association) | WAF Classic Regional |
| <a name="output_wafregional_xss_match_set"></a> [wafregional\_xss\_match\_set](#output\_wafregional\_xss\_match\_set) | WAF Classic Regional |
| <a name="output_wafv2_ip_set"></a> [wafv2\_ip\_set](#output\_wafv2\_ip\_set) | WAF |
| <a name="output_wafv2_regex_pattern_set"></a> [wafv2\_regex\_pattern\_set](#output\_wafv2\_regex\_pattern\_set) | WAF |
| <a name="output_wafv2_rule_group"></a> [wafv2\_rule\_group](#output\_wafv2\_rule\_group) | WAF |
| <a name="output_wafv2_web_acl"></a> [wafv2\_web\_acl](#output\_wafv2\_web\_acl) | WAF |
| <a name="output_wafv2_web_acl_association"></a> [wafv2\_web\_acl\_association](#output\_wafv2\_web\_acl\_association) | WAF |
| <a name="output_wafv2_web_acl_logging_configuration"></a> [wafv2\_web\_acl\_logging\_configuration](#output\_wafv2\_web\_acl\_logging\_configuration) | WAF |
| <a name="output_worklink_fleet"></a> [worklink\_fleet](#output\_worklink\_fleet) | WorkLink |
| <a name="output_worklink_website_certificate_authority_association"></a> [worklink\_website\_certificate\_authority\_association](#output\_worklink\_website\_certificate\_authority\_association) | WorkLink |
| <a name="output_workspaces_connection_alias"></a> [workspaces\_connection\_alias](#output\_workspaces\_connection\_alias) | WorkSpaces |
| <a name="output_workspaces_directory"></a> [workspaces\_directory](#output\_workspaces\_directory) | WorkSpaces |
| <a name="output_workspaces_ip_group"></a> [workspaces\_ip\_group](#output\_workspaces\_ip\_group) | WorkSpaces |
| <a name="output_workspaces_workspace"></a> [workspaces\_workspace](#output\_workspaces\_workspace) | WorkSpaces |
| <a name="output_xray_encryption_config"></a> [xray\_encryption\_config](#output\_xray\_encryption\_config) | X-Ray |
| <a name="output_xray_group"></a> [xray\_group](#output\_xray\_group) | X-Ray |
| <a name="output_xray_resource_policy"></a> [xray\_resource\_policy](#output\_xray\_resource\_policy) | X-Ray |
| <a name="output_xray_sampling_rule"></a> [xray\_sampling\_rule](#output\_xray\_sampling\_rule) | X-Ray |
<!-- END_TF_DOCS -->
