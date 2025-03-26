output "delimiter" {
  value       = var.delimiter
  description = "Delimiter"
}

output "name" {
  value       = local.aws.typeless["name"]
  description = "Name"
}

output "name_unique" {
  value       = local.aws.typeless["name_unique"]
  description = "Unique Name"
}

output "tags" {
  value       = local.aws.typeless.tags
  description = "Tags"
}
{% for resource, details in cookiecutter.__aws_resources | dictsort %}
output "{{ resource }}" {
  value       = contains(var.resource_types, "{{ resource }}") ? local.aws.{{ resource }} : null
  description = "{{ details.category }}"
}
{% endfor -%}
