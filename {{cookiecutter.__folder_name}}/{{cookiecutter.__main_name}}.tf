# Used for generating unique name by putting random string to
resource "random_string" "this" {
  length  = 120
  special = false
  upper   = false
  numeric = var.unique_include_numbers
}

# Shortened region codes
locals {
  short_location = {
    "af-south-1"     = "afs1"
    "ap-east-1"      = "ape1"
    "ap-northeast-1" = "apn1"
    "ap-northeast-2" = "apn2"
    "ap-northeast-3" = "apn3"
    "ap-south-1"     = "aps1"
    "ap-south-2"     = "aps2"
    "ap-southeast-1" = "apse1"
    "ap-southeast-2" = "apse2"
    "ap-southeast-3" = "apse3"
    "ap-southeast-4" = "apse4"
    "ca-central-1"   = "cac1"
    "ca-west-1"      = "caw1"
    "eu-central-1"   = "euc1"
    "eu-central-2"   = "euc2"
    "eu-north-1"     = "eun1"
    "eu-south-1"     = "eus1"
    "eu-south-2"     = "eus2"
    "eu-west-1"      = "euw1"
    "eu-west-2"      = "euw2"
    "eu-west-3"      = "euw3"
    "il-central-1"   = "ilc1"
    "me-central-1"   = "mec1"
    "me-south-1"     = "mes1"
    "sa-east-1"      = "sae1"
    "us-east-1"      = "use1"
    "us-east-2"      = "use2"
    "us-west-1"      = "usw2"
    "us-west-2"      = "usw2"
    "cn-north-1"     = "cnn1"
    "cn-northwest-1" = "cnnw1"
    "us-gov-east-1"  = "usge1"
    "us-gov-west-1"  = "usgw1"
  }

  # Use either provided or generated random seed
  random = substr(coalesce(var.unique_seed, random_string.this.result), 0, var.unique_length)

  # Set the specific string to be replaced by specific resource type if needed
  resource_input = contains(var.name_element_order, "resource") ? "resourcetypeplaceholder" : ""

  # Remove the character from the locataion provided if match with the delimiter (maintaining ability to parse the name by parts)
  normalized_location = replace(var.location, var.delimiter, "")

  # Decide on full or shortened location
  name_location = var.short_location ? lookup(local.short_location, var.location, local.normalized_location) : local.normalized_location

  # Generate the name parts values according to choosen case
  name_inputs = {
    prefix      = var.tag_value_case == "title" ? title(var.prefix) : var.tag_value_case == "upper" ? upper(var.prefix) : lower(var.prefix)
    environment = var.tag_value_case == "title" ? title(var.environment) : var.tag_value_case == "upper" ? upper(var.environment) : lower(var.environment)
    resource    = local.resource_input
    location    = var.tag_value_case == "title" ? title(local.name_location) : var.tag_value_case == "upper" ? upper(local.name_location) : lower(local.name_location)
    description = var.tag_value_case == "title" ? title(var.description) : var.tag_value_case == "upper" ? upper(var.description) : lower(var.description)
    suffix      = join(var.delimiter, var.tag_value_case == "title" ? formatlist(title("%s"), var.suffix) : var.tag_value_case == "upper" ? formatlist(upper("%s"), var.suffix) : formatlist(lower("%s"), var.suffix))
    category    = ""
  }

  # Put the name elements in provided order if values aren't empty
  elements = [for element in var.name_element_order : element if length(local.name_inputs[element]) > 0]

  # Generate the tag values according to choosen case
  tags_inputs = {
    name         = ""
    environment  = local.name_inputs["environment"]
    resourcetype = ""
    category     = ""
    location     = var.tag_value_case == "title" ? title(var.location) : var.tag_value_case == "upper" ? upper(var.location) : var.tag_value_case == "lower" ? lower(var.location) : var.location
    description  = local.name_inputs["description"]
    managedby    = var.tag_value_case == "title" ? "Terraform" : var.tag_value_case == "upper" ? "TERRAFORM" : "terraform"
  }

  # Generate the tags map according to choosen key case if values aren't empty
  tags = merge(
    { for tag in var.tags : var.tag_key_case == "upper" ? upper(tag) : (
    var.tag_key_case == "lower" ? tag : title(tag)) => local.tags_inputs[lower(tag)] if length(local.tags_inputs[lower(tag)]) > 0 },
    { for k, v in var.additional_tags : var.tag_key_case == "upper" ? upper(k) : (
    var.tag_key_case == "lower" ? lower(k) : title(k)) => var.tag_value_case == "title" ? title(v) : var.tag_value_case == "upper" ? upper(v) : var.tag_value_case == "lower" ? lower(v) : v if length(v) > 0 }
  )

  aws_resources = {
    base = {
      name        = join(var.delimiter, compact(concat([local.name_inputs["prefix"]], [for element in local.elements : local.name_inputs[element]], [local.name_inputs["suffix"]])))
      name_unique = join(var.delimiter, compact(concat([local.name_inputs["prefix"]], [for element in local.elements : local.name_inputs[element]], [local.name_inputs["suffix"]], [local.random])))
    }
  }

  # Generate resource specific values
  aws = {
    # Generate generic resource name and unique name, and common tags without resource type specifics
    typeless = {
      name        = substr(join(var.delimiter, compact(concat([local.name_inputs["prefix"]], [for element in local.elements : local.name_inputs[element] if element != "resource"], [local.name_inputs["suffix"]]))), 0, var.max_length)
      name_unique = substr(join(var.delimiter, compact(concat([local.name_inputs["prefix"]], [for element in local.elements : local.name_inputs[element] if element != "resource"], [local.name_inputs["suffix"]], [local.random]))), 0, var.max_length)
      tags        = local.tags
    }

    # Generate name, unique name, and tags specific to resource type.
{% for resource, details in cookiecutter.__aws_resources | dictsort %}
    {{ resource }} = [
      {
        name        = substr(replace(local.aws_resources.base["name"], "resourcetypeplaceholder", replace((var.tag_value_case == "upper" ? upper("{{ resource }}") : var.tag_value_case == "title" ? title("{{ resource }}") : "{{ resource }}"), "_", "")), 0, var.max_length)
        name_unique = substr(replace(local.aws_resources.base["name_unique"], "resourcetypeplaceholder", replace((var.tag_value_case == "upper" ? upper("{{ resource }}") : var.tag_value_case == "title" ? title("{{ resource }}") : "{{ resource }}"), "_", "")), 0, var.max_length)
        tags = merge(
          local.tags,
          contains(var.tags, "Name") ? { (var.tag_key_case == "upper" ? "NAME" : var.tag_key_case == "lower" ? "name" : "Name") = substr(replace(local.aws_resources.base["name"], "resourcetypeplaceholder", replace((var.tag_value_case == "upper" ? upper("{{ resource }}") : var.tag_value_case == "title" ? title("{{ resource }}") : "{{ resource }}"), "_", "")), 0, var.max_length) } : {},
          contains(var.tags, "ResourceType") ? { (var.tag_key_case == "upper" ? "RESOURCETYPE" : var.tag_key_case == "lower" ? "resourcetype" : "ResourceType") = (var.tag_value_case == "upper" ? upper("{{ resource }}") : var.tag_value_case == "title" ? title("{{ resource }}") : "{{ resource }}") } : {},
          contains(var.tags, "Category") ? { (var.tag_key_case == "upper" ? "CATEGORY" : var.tag_key_case == "lower" ? "category" : "Category") = var.tag_value_case == "upper" ? upper("{{ details.category }}") : var.tag_value_case == "title" ? "{{ details.category }}" : lower("{{ details.category }}") } : {}
        )
      },
      {}
    ][contains(var.resource_types, "{{ resource }}") ? 0 : 1]
{% endfor %}
  }
}
