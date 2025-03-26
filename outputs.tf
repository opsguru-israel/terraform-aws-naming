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

output "accessanalyzer_analyzer" {
  value       = contains(var.resource_types, "accessanalyzer_analyzer") ? local.aws.accessanalyzer_analyzer : null
  description = "IAM Access Analyzer"
}

output "accessanalyzer_archive_rule" {
  value       = contains(var.resource_types, "accessanalyzer_archive_rule") ? local.aws.accessanalyzer_archive_rule : null
  description = "IAM Access Analyzer"
}

output "account_alternate_contact" {
  value       = contains(var.resource_types, "account_alternate_contact") ? local.aws.account_alternate_contact : null
  description = "Account Management"
}

output "account_primary_contact" {
  value       = contains(var.resource_types, "account_primary_contact") ? local.aws.account_primary_contact : null
  description = "Account Management"
}

output "account_region" {
  value       = contains(var.resource_types, "account_region") ? local.aws.account_region : null
  description = "Account Management"
}

output "acm_certificate" {
  value       = contains(var.resource_types, "acm_certificate") ? local.aws.acm_certificate : null
  description = "Certificate Manager"
}

output "acm_certificate_validation" {
  value       = contains(var.resource_types, "acm_certificate_validation") ? local.aws.acm_certificate_validation : null
  description = "Certificate Manager"
}

output "acmpca_certificate" {
  value       = contains(var.resource_types, "acmpca_certificate") ? local.aws.acmpca_certificate : null
  description = "Certificate Manager Private Certificate Authority"
}

output "acmpca_certificate_authority" {
  value       = contains(var.resource_types, "acmpca_certificate_authority") ? local.aws.acmpca_certificate_authority : null
  description = "Certificate Manager Private Certificate Authority"
}

output "acmpca_certificate_authority_certificate" {
  value       = contains(var.resource_types, "acmpca_certificate_authority_certificate") ? local.aws.acmpca_certificate_authority_certificate : null
  description = "Certificate Manager Private Certificate Authority"
}

output "acmpca_permission" {
  value       = contains(var.resource_types, "acmpca_permission") ? local.aws.acmpca_permission : null
  description = "Certificate Manager Private Certificate Authority"
}

output "acmpca_policy" {
  value       = contains(var.resource_types, "acmpca_policy") ? local.aws.acmpca_policy : null
  description = "Certificate Manager Private Certificate Authority"
}

output "ami" {
  value       = contains(var.resource_types, "ami") ? local.aws.ami : null
  description = "Elastic Compute Cloud"
}

output "ami_copy" {
  value       = contains(var.resource_types, "ami_copy") ? local.aws.ami_copy : null
  description = "Elastic Compute Cloud"
}

output "ami_from_instance" {
  value       = contains(var.resource_types, "ami_from_instance") ? local.aws.ami_from_instance : null
  description = "Elastic Compute Cloud"
}

output "ami_launch_permission" {
  value       = contains(var.resource_types, "ami_launch_permission") ? local.aws.ami_launch_permission : null
  description = "Elastic Compute Cloud"
}

output "amplify_app" {
  value       = contains(var.resource_types, "amplify_app") ? local.aws.amplify_app : null
  description = "Amplify"
}

output "amplify_backend_environment" {
  value       = contains(var.resource_types, "amplify_backend_environment") ? local.aws.amplify_backend_environment : null
  description = "Amplify"
}

output "amplify_branch" {
  value       = contains(var.resource_types, "amplify_branch") ? local.aws.amplify_branch : null
  description = "Amplify"
}

output "amplify_domain_association" {
  value       = contains(var.resource_types, "amplify_domain_association") ? local.aws.amplify_domain_association : null
  description = "Amplify"
}

output "amplify_webhook" {
  value       = contains(var.resource_types, "amplify_webhook") ? local.aws.amplify_webhook : null
  description = "Amplify"
}

output "api_gateway_account" {
  value       = contains(var.resource_types, "api_gateway_account") ? local.aws.api_gateway_account : null
  description = "API Gateway"
}

output "api_gateway_api_key" {
  value       = contains(var.resource_types, "api_gateway_api_key") ? local.aws.api_gateway_api_key : null
  description = "API Gateway"
}

output "api_gateway_authorizer" {
  value       = contains(var.resource_types, "api_gateway_authorizer") ? local.aws.api_gateway_authorizer : null
  description = "API Gateway"
}

output "api_gateway_base_path_mapping" {
  value       = contains(var.resource_types, "api_gateway_base_path_mapping") ? local.aws.api_gateway_base_path_mapping : null
  description = "API Gateway"
}

output "api_gateway_client_certificate" {
  value       = contains(var.resource_types, "api_gateway_client_certificate") ? local.aws.api_gateway_client_certificate : null
  description = "API Gateway"
}

output "api_gateway_deployment" {
  value       = contains(var.resource_types, "api_gateway_deployment") ? local.aws.api_gateway_deployment : null
  description = "API Gateway"
}

output "api_gateway_documentation_part" {
  value       = contains(var.resource_types, "api_gateway_documentation_part") ? local.aws.api_gateway_documentation_part : null
  description = "API Gateway"
}

output "api_gateway_documentation_version" {
  value       = contains(var.resource_types, "api_gateway_documentation_version") ? local.aws.api_gateway_documentation_version : null
  description = "API Gateway"
}

output "api_gateway_domain_name" {
  value       = contains(var.resource_types, "api_gateway_domain_name") ? local.aws.api_gateway_domain_name : null
  description = "API Gateway"
}

output "api_gateway_domain_name_access_association" {
  value       = contains(var.resource_types, "api_gateway_domain_name_access_association") ? local.aws.api_gateway_domain_name_access_association : null
  description = "API Gateway"
}

output "api_gateway_gateway_response" {
  value       = contains(var.resource_types, "api_gateway_gateway_response") ? local.aws.api_gateway_gateway_response : null
  description = "API Gateway"
}

output "api_gateway_integration" {
  value       = contains(var.resource_types, "api_gateway_integration") ? local.aws.api_gateway_integration : null
  description = "API Gateway"
}

output "api_gateway_integration_response" {
  value       = contains(var.resource_types, "api_gateway_integration_response") ? local.aws.api_gateway_integration_response : null
  description = "API Gateway"
}

output "api_gateway_method" {
  value       = contains(var.resource_types, "api_gateway_method") ? local.aws.api_gateway_method : null
  description = "API Gateway"
}

output "api_gateway_method_response" {
  value       = contains(var.resource_types, "api_gateway_method_response") ? local.aws.api_gateway_method_response : null
  description = "API Gateway"
}

output "api_gateway_method_settings" {
  value       = contains(var.resource_types, "api_gateway_method_settings") ? local.aws.api_gateway_method_settings : null
  description = "API Gateway"
}

output "api_gateway_model" {
  value       = contains(var.resource_types, "api_gateway_model") ? local.aws.api_gateway_model : null
  description = "API Gateway"
}

output "api_gateway_request_validator" {
  value       = contains(var.resource_types, "api_gateway_request_validator") ? local.aws.api_gateway_request_validator : null
  description = "API Gateway"
}

output "api_gateway_resource" {
  value       = contains(var.resource_types, "api_gateway_resource") ? local.aws.api_gateway_resource : null
  description = "API Gateway"
}

output "api_gateway_rest_api" {
  value       = contains(var.resource_types, "api_gateway_rest_api") ? local.aws.api_gateway_rest_api : null
  description = "API Gateway"
}

output "api_gateway_rest_api_policy" {
  value       = contains(var.resource_types, "api_gateway_rest_api_policy") ? local.aws.api_gateway_rest_api_policy : null
  description = "API Gateway"
}

output "api_gateway_stage" {
  value       = contains(var.resource_types, "api_gateway_stage") ? local.aws.api_gateway_stage : null
  description = "API Gateway"
}

output "api_gateway_usage_plan" {
  value       = contains(var.resource_types, "api_gateway_usage_plan") ? local.aws.api_gateway_usage_plan : null
  description = "API Gateway"
}

output "api_gateway_usage_plan_key" {
  value       = contains(var.resource_types, "api_gateway_usage_plan_key") ? local.aws.api_gateway_usage_plan_key : null
  description = "API Gateway"
}

output "api_gateway_vpc_link" {
  value       = contains(var.resource_types, "api_gateway_vpc_link") ? local.aws.api_gateway_vpc_link : null
  description = "API Gateway"
}

output "apigatewayv2_api" {
  value       = contains(var.resource_types, "apigatewayv2_api") ? local.aws.apigatewayv2_api : null
  description = "API Gateway V2"
}

output "apigatewayv2_api_mapping" {
  value       = contains(var.resource_types, "apigatewayv2_api_mapping") ? local.aws.apigatewayv2_api_mapping : null
  description = "API Gateway V2"
}

output "apigatewayv2_authorizer" {
  value       = contains(var.resource_types, "apigatewayv2_authorizer") ? local.aws.apigatewayv2_authorizer : null
  description = "API Gateway V2"
}

output "apigatewayv2_deployment" {
  value       = contains(var.resource_types, "apigatewayv2_deployment") ? local.aws.apigatewayv2_deployment : null
  description = "API Gateway V2"
}

output "apigatewayv2_domain_name" {
  value       = contains(var.resource_types, "apigatewayv2_domain_name") ? local.aws.apigatewayv2_domain_name : null
  description = "API Gateway V2"
}

output "apigatewayv2_integration" {
  value       = contains(var.resource_types, "apigatewayv2_integration") ? local.aws.apigatewayv2_integration : null
  description = "API Gateway V2"
}

output "apigatewayv2_integration_response" {
  value       = contains(var.resource_types, "apigatewayv2_integration_response") ? local.aws.apigatewayv2_integration_response : null
  description = "API Gateway V2"
}

output "apigatewayv2_model" {
  value       = contains(var.resource_types, "apigatewayv2_model") ? local.aws.apigatewayv2_model : null
  description = "API Gateway V2"
}

output "apigatewayv2_route" {
  value       = contains(var.resource_types, "apigatewayv2_route") ? local.aws.apigatewayv2_route : null
  description = "API Gateway V2"
}

output "apigatewayv2_route_response" {
  value       = contains(var.resource_types, "apigatewayv2_route_response") ? local.aws.apigatewayv2_route_response : null
  description = "API Gateway V2"
}

output "apigatewayv2_stage" {
  value       = contains(var.resource_types, "apigatewayv2_stage") ? local.aws.apigatewayv2_stage : null
  description = "API Gateway V2"
}

output "apigatewayv2_vpc_link" {
  value       = contains(var.resource_types, "apigatewayv2_vpc_link") ? local.aws.apigatewayv2_vpc_link : null
  description = "API Gateway V2"
}

output "app_cookie_stickiness_policy" {
  value       = contains(var.resource_types, "app_cookie_stickiness_policy") ? local.aws.app_cookie_stickiness_policy : null
  description = "ELB Classic"
}

output "appautoscaling_policy" {
  value       = contains(var.resource_types, "appautoscaling_policy") ? local.aws.appautoscaling_policy : null
  description = "Application Auto Scaling"
}

output "appautoscaling_scheduled_action" {
  value       = contains(var.resource_types, "appautoscaling_scheduled_action") ? local.aws.appautoscaling_scheduled_action : null
  description = "Application Auto Scaling"
}

output "appautoscaling_target" {
  value       = contains(var.resource_types, "appautoscaling_target") ? local.aws.appautoscaling_target : null
  description = "Application Auto Scaling"
}

output "appconfig_application" {
  value       = contains(var.resource_types, "appconfig_application") ? local.aws.appconfig_application : null
  description = "AppConfig"
}

output "appconfig_configuration_profile" {
  value       = contains(var.resource_types, "appconfig_configuration_profile") ? local.aws.appconfig_configuration_profile : null
  description = "AppConfig"
}

output "appconfig_deployment" {
  value       = contains(var.resource_types, "appconfig_deployment") ? local.aws.appconfig_deployment : null
  description = "AppConfig"
}

output "appconfig_deployment_strategy" {
  value       = contains(var.resource_types, "appconfig_deployment_strategy") ? local.aws.appconfig_deployment_strategy : null
  description = "AppConfig"
}

output "appconfig_environment" {
  value       = contains(var.resource_types, "appconfig_environment") ? local.aws.appconfig_environment : null
  description = "AppConfig"
}

output "appconfig_extension" {
  value       = contains(var.resource_types, "appconfig_extension") ? local.aws.appconfig_extension : null
  description = "AppConfig"
}

output "appconfig_extension_association" {
  value       = contains(var.resource_types, "appconfig_extension_association") ? local.aws.appconfig_extension_association : null
  description = "AppConfig"
}

output "appconfig_hosted_configuration_version" {
  value       = contains(var.resource_types, "appconfig_hosted_configuration_version") ? local.aws.appconfig_hosted_configuration_version : null
  description = "AppConfig"
}

output "appfabric_app_authorization" {
  value       = contains(var.resource_types, "appfabric_app_authorization") ? local.aws.appfabric_app_authorization : null
  description = "AppFabric"
}

output "appfabric_app_authorization_connection" {
  value       = contains(var.resource_types, "appfabric_app_authorization_connection") ? local.aws.appfabric_app_authorization_connection : null
  description = "AppFabric"
}

output "appfabric_app_bundle" {
  value       = contains(var.resource_types, "appfabric_app_bundle") ? local.aws.appfabric_app_bundle : null
  description = "AppFabric"
}

output "appfabric_ingestion" {
  value       = contains(var.resource_types, "appfabric_ingestion") ? local.aws.appfabric_ingestion : null
  description = "AppFabric"
}

output "appfabric_ingestion_destination" {
  value       = contains(var.resource_types, "appfabric_ingestion_destination") ? local.aws.appfabric_ingestion_destination : null
  description = "AppFabric"
}

output "appflow_connector_profile" {
  value       = contains(var.resource_types, "appflow_connector_profile") ? local.aws.appflow_connector_profile : null
  description = "AppFlow"
}

output "appflow_flow" {
  value       = contains(var.resource_types, "appflow_flow") ? local.aws.appflow_flow : null
  description = "AppFlow"
}

output "appintegrations_data_integration" {
  value       = contains(var.resource_types, "appintegrations_data_integration") ? local.aws.appintegrations_data_integration : null
  description = "AppIntegrations"
}

output "appintegrations_event_integration" {
  value       = contains(var.resource_types, "appintegrations_event_integration") ? local.aws.appintegrations_event_integration : null
  description = "AppIntegrations"
}

output "applicationinsights_application" {
  value       = contains(var.resource_types, "applicationinsights_application") ? local.aws.applicationinsights_application : null
  description = "CloudWatch Application Insights"
}

output "appmesh_gateway_route" {
  value       = contains(var.resource_types, "appmesh_gateway_route") ? local.aws.appmesh_gateway_route : null
  description = "App Mesh"
}

output "appmesh_mesh" {
  value       = contains(var.resource_types, "appmesh_mesh") ? local.aws.appmesh_mesh : null
  description = "App Mesh"
}

output "appmesh_route" {
  value       = contains(var.resource_types, "appmesh_route") ? local.aws.appmesh_route : null
  description = "App Mesh"
}

output "appmesh_virtual_gateway" {
  value       = contains(var.resource_types, "appmesh_virtual_gateway") ? local.aws.appmesh_virtual_gateway : null
  description = "App Mesh"
}

output "appmesh_virtual_node" {
  value       = contains(var.resource_types, "appmesh_virtual_node") ? local.aws.appmesh_virtual_node : null
  description = "App Mesh"
}

output "appmesh_virtual_router" {
  value       = contains(var.resource_types, "appmesh_virtual_router") ? local.aws.appmesh_virtual_router : null
  description = "App Mesh"
}

output "appmesh_virtual_service" {
  value       = contains(var.resource_types, "appmesh_virtual_service") ? local.aws.appmesh_virtual_service : null
  description = "App Mesh"
}

output "apprunner_auto_scaling_configuration_version" {
  value       = contains(var.resource_types, "apprunner_auto_scaling_configuration_version") ? local.aws.apprunner_auto_scaling_configuration_version : null
  description = "App Runner"
}

output "apprunner_connection" {
  value       = contains(var.resource_types, "apprunner_connection") ? local.aws.apprunner_connection : null
  description = "App Runner"
}

output "apprunner_custom_domain_association" {
  value       = contains(var.resource_types, "apprunner_custom_domain_association") ? local.aws.apprunner_custom_domain_association : null
  description = "App Runner"
}

output "apprunner_default_auto_scaling_configuration_version" {
  value       = contains(var.resource_types, "apprunner_default_auto_scaling_configuration_version") ? local.aws.apprunner_default_auto_scaling_configuration_version : null
  description = "App Runner"
}

output "apprunner_deployment" {
  value       = contains(var.resource_types, "apprunner_deployment") ? local.aws.apprunner_deployment : null
  description = "App Runner"
}

output "apprunner_observability_configuration" {
  value       = contains(var.resource_types, "apprunner_observability_configuration") ? local.aws.apprunner_observability_configuration : null
  description = "App Runner"
}

output "apprunner_service" {
  value       = contains(var.resource_types, "apprunner_service") ? local.aws.apprunner_service : null
  description = "App Runner"
}

output "apprunner_vpc_connector" {
  value       = contains(var.resource_types, "apprunner_vpc_connector") ? local.aws.apprunner_vpc_connector : null
  description = "App Runner"
}

output "apprunner_vpc_ingress_connection" {
  value       = contains(var.resource_types, "apprunner_vpc_ingress_connection") ? local.aws.apprunner_vpc_ingress_connection : null
  description = "App Runner"
}

output "appstream_directory_config" {
  value       = contains(var.resource_types, "appstream_directory_config") ? local.aws.appstream_directory_config : null
  description = "AppStream 2.0"
}

output "appstream_fleet" {
  value       = contains(var.resource_types, "appstream_fleet") ? local.aws.appstream_fleet : null
  description = "AppStream 2.0"
}

output "appstream_fleet_stack_association" {
  value       = contains(var.resource_types, "appstream_fleet_stack_association") ? local.aws.appstream_fleet_stack_association : null
  description = "AppStream 2.0"
}

output "appstream_image_builder" {
  value       = contains(var.resource_types, "appstream_image_builder") ? local.aws.appstream_image_builder : null
  description = "AppStream 2.0"
}

output "appstream_stack" {
  value       = contains(var.resource_types, "appstream_stack") ? local.aws.appstream_stack : null
  description = "AppStream 2.0"
}

output "appstream_user" {
  value       = contains(var.resource_types, "appstream_user") ? local.aws.appstream_user : null
  description = "AppStream 2.0"
}

output "appstream_user_stack_association" {
  value       = contains(var.resource_types, "appstream_user_stack_association") ? local.aws.appstream_user_stack_association : null
  description = "AppStream 2.0"
}

output "appsync_api_cache" {
  value       = contains(var.resource_types, "appsync_api_cache") ? local.aws.appsync_api_cache : null
  description = "AppSync"
}

output "appsync_api_key" {
  value       = contains(var.resource_types, "appsync_api_key") ? local.aws.appsync_api_key : null
  description = "AppSync"
}

output "appsync_datasource" {
  value       = contains(var.resource_types, "appsync_datasource") ? local.aws.appsync_datasource : null
  description = "AppSync"
}

output "appsync_domain_name" {
  value       = contains(var.resource_types, "appsync_domain_name") ? local.aws.appsync_domain_name : null
  description = "AppSync"
}

output "appsync_domain_name_api_association" {
  value       = contains(var.resource_types, "appsync_domain_name_api_association") ? local.aws.appsync_domain_name_api_association : null
  description = "AppSync"
}

output "appsync_function" {
  value       = contains(var.resource_types, "appsync_function") ? local.aws.appsync_function : null
  description = "AppSync"
}

output "appsync_graphql_api" {
  value       = contains(var.resource_types, "appsync_graphql_api") ? local.aws.appsync_graphql_api : null
  description = "AppSync"
}

output "appsync_resolver" {
  value       = contains(var.resource_types, "appsync_resolver") ? local.aws.appsync_resolver : null
  description = "AppSync"
}

output "appsync_source_api_association" {
  value       = contains(var.resource_types, "appsync_source_api_association") ? local.aws.appsync_source_api_association : null
  description = "AppSync"
}

output "appsync_type" {
  value       = contains(var.resource_types, "appsync_type") ? local.aws.appsync_type : null
  description = "AppSync"
}

output "athena_data_catalog" {
  value       = contains(var.resource_types, "athena_data_catalog") ? local.aws.athena_data_catalog : null
  description = "Athena"
}

output "athena_database" {
  value       = contains(var.resource_types, "athena_database") ? local.aws.athena_database : null
  description = "Athena"
}

output "athena_named_query" {
  value       = contains(var.resource_types, "athena_named_query") ? local.aws.athena_named_query : null
  description = "Athena"
}

output "athena_prepared_statement" {
  value       = contains(var.resource_types, "athena_prepared_statement") ? local.aws.athena_prepared_statement : null
  description = "Athena"
}

output "athena_workgroup" {
  value       = contains(var.resource_types, "athena_workgroup") ? local.aws.athena_workgroup : null
  description = "Athena"
}

output "auditmanager_account_registration" {
  value       = contains(var.resource_types, "auditmanager_account_registration") ? local.aws.auditmanager_account_registration : null
  description = "Audit Manager"
}

output "auditmanager_assessment" {
  value       = contains(var.resource_types, "auditmanager_assessment") ? local.aws.auditmanager_assessment : null
  description = "Audit Manager"
}

output "auditmanager_assessment_delegation" {
  value       = contains(var.resource_types, "auditmanager_assessment_delegation") ? local.aws.auditmanager_assessment_delegation : null
  description = "Audit Manager"
}

output "auditmanager_assessment_report" {
  value       = contains(var.resource_types, "auditmanager_assessment_report") ? local.aws.auditmanager_assessment_report : null
  description = "Audit Manager"
}

output "auditmanager_control" {
  value       = contains(var.resource_types, "auditmanager_control") ? local.aws.auditmanager_control : null
  description = "Audit Manager"
}

output "auditmanager_framework" {
  value       = contains(var.resource_types, "auditmanager_framework") ? local.aws.auditmanager_framework : null
  description = "Audit Manager"
}

output "auditmanager_framework_share" {
  value       = contains(var.resource_types, "auditmanager_framework_share") ? local.aws.auditmanager_framework_share : null
  description = "Audit Manager"
}

output "auditmanager_organization_admin_account_registration" {
  value       = contains(var.resource_types, "auditmanager_organization_admin_account_registration") ? local.aws.auditmanager_organization_admin_account_registration : null
  description = "Audit Manager"
}

output "autoscaling_attachment" {
  value       = contains(var.resource_types, "autoscaling_attachment") ? local.aws.autoscaling_attachment : null
  description = "Auto Scaling"
}

output "autoscaling_group" {
  value       = contains(var.resource_types, "autoscaling_group") ? local.aws.autoscaling_group : null
  description = "Auto Scaling"
}

output "autoscaling_group_tag" {
  value       = contains(var.resource_types, "autoscaling_group_tag") ? local.aws.autoscaling_group_tag : null
  description = "Auto Scaling"
}

output "autoscaling_lifecycle_hook" {
  value       = contains(var.resource_types, "autoscaling_lifecycle_hook") ? local.aws.autoscaling_lifecycle_hook : null
  description = "Auto Scaling"
}

output "autoscaling_notification" {
  value       = contains(var.resource_types, "autoscaling_notification") ? local.aws.autoscaling_notification : null
  description = "Auto Scaling"
}

output "autoscaling_policy" {
  value       = contains(var.resource_types, "autoscaling_policy") ? local.aws.autoscaling_policy : null
  description = "Auto Scaling"
}

output "autoscaling_schedule" {
  value       = contains(var.resource_types, "autoscaling_schedule") ? local.aws.autoscaling_schedule : null
  description = "Auto Scaling"
}

output "autoscaling_traffic_source_attachment" {
  value       = contains(var.resource_types, "autoscaling_traffic_source_attachment") ? local.aws.autoscaling_traffic_source_attachment : null
  description = "Auto Scaling"
}

output "autoscalingplans_scaling_plan" {
  value       = contains(var.resource_types, "autoscalingplans_scaling_plan") ? local.aws.autoscalingplans_scaling_plan : null
  description = "Auto Scaling Plans"
}

output "backup_framework" {
  value       = contains(var.resource_types, "backup_framework") ? local.aws.backup_framework : null
  description = "Backup"
}

output "backup_global_settings" {
  value       = contains(var.resource_types, "backup_global_settings") ? local.aws.backup_global_settings : null
  description = "Backup"
}

output "backup_logically_air_gapped_vault" {
  value       = contains(var.resource_types, "backup_logically_air_gapped_vault") ? local.aws.backup_logically_air_gapped_vault : null
  description = "Backup"
}

output "backup_plan" {
  value       = contains(var.resource_types, "backup_plan") ? local.aws.backup_plan : null
  description = "Backup"
}

output "backup_region_settings" {
  value       = contains(var.resource_types, "backup_region_settings") ? local.aws.backup_region_settings : null
  description = "Backup"
}

output "backup_report_plan" {
  value       = contains(var.resource_types, "backup_report_plan") ? local.aws.backup_report_plan : null
  description = "Backup"
}

output "backup_restore_testing_plan" {
  value       = contains(var.resource_types, "backup_restore_testing_plan") ? local.aws.backup_restore_testing_plan : null
  description = "Backup"
}

output "backup_restore_testing_selection" {
  value       = contains(var.resource_types, "backup_restore_testing_selection") ? local.aws.backup_restore_testing_selection : null
  description = "Backup"
}

output "backup_selection" {
  value       = contains(var.resource_types, "backup_selection") ? local.aws.backup_selection : null
  description = "Backup"
}

output "backup_vault" {
  value       = contains(var.resource_types, "backup_vault") ? local.aws.backup_vault : null
  description = "Backup"
}

output "backup_vault_lock_configuration" {
  value       = contains(var.resource_types, "backup_vault_lock_configuration") ? local.aws.backup_vault_lock_configuration : null
  description = "Backup"
}

output "backup_vault_notifications" {
  value       = contains(var.resource_types, "backup_vault_notifications") ? local.aws.backup_vault_notifications : null
  description = "Backup"
}

output "backup_vault_policy" {
  value       = contains(var.resource_types, "backup_vault_policy") ? local.aws.backup_vault_policy : null
  description = "Backup"
}

output "batch_compute_environment" {
  value       = contains(var.resource_types, "batch_compute_environment") ? local.aws.batch_compute_environment : null
  description = "Batch"
}

output "batch_job_definition" {
  value       = contains(var.resource_types, "batch_job_definition") ? local.aws.batch_job_definition : null
  description = "Batch"
}

output "batch_job_queue" {
  value       = contains(var.resource_types, "batch_job_queue") ? local.aws.batch_job_queue : null
  description = "Batch"
}

output "batch_scheduling_policy" {
  value       = contains(var.resource_types, "batch_scheduling_policy") ? local.aws.batch_scheduling_policy : null
  description = "Batch"
}

output "bcmdataexports_export" {
  value       = contains(var.resource_types, "bcmdataexports_export") ? local.aws.bcmdataexports_export : null
  description = "BCM Data Exports"
}

output "bedrock_custom_model" {
  value       = contains(var.resource_types, "bedrock_custom_model") ? local.aws.bedrock_custom_model : null
  description = "Bedrock"
}

output "bedrock_guardrail" {
  value       = contains(var.resource_types, "bedrock_guardrail") ? local.aws.bedrock_guardrail : null
  description = "Bedrock"
}

output "bedrock_guardrail_version" {
  value       = contains(var.resource_types, "bedrock_guardrail_version") ? local.aws.bedrock_guardrail_version : null
  description = "Bedrock"
}

output "bedrock_inference_profile" {
  value       = contains(var.resource_types, "bedrock_inference_profile") ? local.aws.bedrock_inference_profile : null
  description = "Bedrock"
}

output "bedrock_model_invocation_logging_configuration" {
  value       = contains(var.resource_types, "bedrock_model_invocation_logging_configuration") ? local.aws.bedrock_model_invocation_logging_configuration : null
  description = "Bedrock"
}

output "bedrock_provisioned_model_throughput" {
  value       = contains(var.resource_types, "bedrock_provisioned_model_throughput") ? local.aws.bedrock_provisioned_model_throughput : null
  description = "Bedrock"
}

output "bedrockagent_agent" {
  value       = contains(var.resource_types, "bedrockagent_agent") ? local.aws.bedrockagent_agent : null
  description = "Bedrock Agents"
}

output "bedrockagent_agent_action_group" {
  value       = contains(var.resource_types, "bedrockagent_agent_action_group") ? local.aws.bedrockagent_agent_action_group : null
  description = "Bedrock Agents"
}

output "bedrockagent_agent_alias" {
  value       = contains(var.resource_types, "bedrockagent_agent_alias") ? local.aws.bedrockagent_agent_alias : null
  description = "Bedrock Agents"
}

output "bedrockagent_agent_collaborator" {
  value       = contains(var.resource_types, "bedrockagent_agent_collaborator") ? local.aws.bedrockagent_agent_collaborator : null
  description = "Bedrock Agents"
}

output "bedrockagent_agent_knowledge_base_association" {
  value       = contains(var.resource_types, "bedrockagent_agent_knowledge_base_association") ? local.aws.bedrockagent_agent_knowledge_base_association : null
  description = "Bedrock Agents"
}

output "bedrockagent_data_source" {
  value       = contains(var.resource_types, "bedrockagent_data_source") ? local.aws.bedrockagent_data_source : null
  description = "Bedrock Agents"
}

output "bedrockagent_knowledge_base" {
  value       = contains(var.resource_types, "bedrockagent_knowledge_base") ? local.aws.bedrockagent_knowledge_base : null
  description = "Bedrock Agents"
}

output "budgets_budget" {
  value       = contains(var.resource_types, "budgets_budget") ? local.aws.budgets_budget : null
  description = "Web Services Budgets"
}

output "budgets_budget_action" {
  value       = contains(var.resource_types, "budgets_budget_action") ? local.aws.budgets_budget_action : null
  description = "Web Services Budgets"
}

output "ce_anomaly_monitor" {
  value       = contains(var.resource_types, "ce_anomaly_monitor") ? local.aws.ce_anomaly_monitor : null
  description = "Cost Explorer"
}

output "ce_anomaly_subscription" {
  value       = contains(var.resource_types, "ce_anomaly_subscription") ? local.aws.ce_anomaly_subscription : null
  description = "Cost Explorer"
}

output "ce_cost_allocation_tag" {
  value       = contains(var.resource_types, "ce_cost_allocation_tag") ? local.aws.ce_cost_allocation_tag : null
  description = "Cost Explorer"
}

output "ce_cost_category" {
  value       = contains(var.resource_types, "ce_cost_category") ? local.aws.ce_cost_category : null
  description = "Cost Explorer"
}

output "chatbot_slack_channel_configuration" {
  value       = contains(var.resource_types, "chatbot_slack_channel_configuration") ? local.aws.chatbot_slack_channel_configuration : null
  description = "Chatbot"
}

output "chatbot_teams_channel_configuration" {
  value       = contains(var.resource_types, "chatbot_teams_channel_configuration") ? local.aws.chatbot_teams_channel_configuration : null
  description = "Chatbot"
}

output "chime_voice_connector" {
  value       = contains(var.resource_types, "chime_voice_connector") ? local.aws.chime_voice_connector : null
  description = "Chime"
}

output "chime_voice_connector_group" {
  value       = contains(var.resource_types, "chime_voice_connector_group") ? local.aws.chime_voice_connector_group : null
  description = "Chime"
}

output "chime_voice_connector_logging" {
  value       = contains(var.resource_types, "chime_voice_connector_logging") ? local.aws.chime_voice_connector_logging : null
  description = "Chime"
}

output "chime_voice_connector_origination" {
  value       = contains(var.resource_types, "chime_voice_connector_origination") ? local.aws.chime_voice_connector_origination : null
  description = "Chime"
}

output "chime_voice_connector_streaming" {
  value       = contains(var.resource_types, "chime_voice_connector_streaming") ? local.aws.chime_voice_connector_streaming : null
  description = "Chime"
}

output "chime_voice_connector_termination" {
  value       = contains(var.resource_types, "chime_voice_connector_termination") ? local.aws.chime_voice_connector_termination : null
  description = "Chime"
}

output "chime_voice_connector_termination_credentials" {
  value       = contains(var.resource_types, "chime_voice_connector_termination_credentials") ? local.aws.chime_voice_connector_termination_credentials : null
  description = "Chime"
}

output "chimesdkmediapipelines_media_insights_pipeline_configuration" {
  value       = contains(var.resource_types, "chimesdkmediapipelines_media_insights_pipeline_configuration") ? local.aws.chimesdkmediapipelines_media_insights_pipeline_configuration : null
  description = "Chime SDK Media Pipelines"
}

output "chimesdkvoice_global_settings" {
  value       = contains(var.resource_types, "chimesdkvoice_global_settings") ? local.aws.chimesdkvoice_global_settings : null
  description = "Chime SDK Voice"
}

output "chimesdkvoice_sip_media_application" {
  value       = contains(var.resource_types, "chimesdkvoice_sip_media_application") ? local.aws.chimesdkvoice_sip_media_application : null
  description = "Chime SDK Voice"
}

output "chimesdkvoice_sip_rule" {
  value       = contains(var.resource_types, "chimesdkvoice_sip_rule") ? local.aws.chimesdkvoice_sip_rule : null
  description = "Chime SDK Voice"
}

output "chimesdkvoice_voice_profile_domain" {
  value       = contains(var.resource_types, "chimesdkvoice_voice_profile_domain") ? local.aws.chimesdkvoice_voice_profile_domain : null
  description = "Chime SDK Voice"
}

output "cleanrooms_collaboration" {
  value       = contains(var.resource_types, "cleanrooms_collaboration") ? local.aws.cleanrooms_collaboration : null
  description = "Clean Rooms"
}

output "cleanrooms_configured_table" {
  value       = contains(var.resource_types, "cleanrooms_configured_table") ? local.aws.cleanrooms_configured_table : null
  description = "Clean Rooms"
}

output "cleanrooms_membership" {
  value       = contains(var.resource_types, "cleanrooms_membership") ? local.aws.cleanrooms_membership : null
  description = "Clean Rooms"
}

output "cloud9_environment_ec2" {
  value       = contains(var.resource_types, "cloud9_environment_ec2") ? local.aws.cloud9_environment_ec2 : null
  description = "Cloud9"
}

output "cloud9_environment_membership" {
  value       = contains(var.resource_types, "cloud9_environment_membership") ? local.aws.cloud9_environment_membership : null
  description = "Cloud9"
}

output "cloudcontrolapi_resource" {
  value       = contains(var.resource_types, "cloudcontrolapi_resource") ? local.aws.cloudcontrolapi_resource : null
  description = "Cloud Control API"
}

output "cloudformation_stack" {
  value       = contains(var.resource_types, "cloudformation_stack") ? local.aws.cloudformation_stack : null
  description = "CloudFormation"
}

output "cloudformation_stack_instances" {
  value       = contains(var.resource_types, "cloudformation_stack_instances") ? local.aws.cloudformation_stack_instances : null
  description = "CloudFormation"
}

output "cloudformation_stack_set" {
  value       = contains(var.resource_types, "cloudformation_stack_set") ? local.aws.cloudformation_stack_set : null
  description = "CloudFormation"
}

output "cloudformation_stack_set_instance" {
  value       = contains(var.resource_types, "cloudformation_stack_set_instance") ? local.aws.cloudformation_stack_set_instance : null
  description = "CloudFormation"
}

output "cloudformation_type" {
  value       = contains(var.resource_types, "cloudformation_type") ? local.aws.cloudformation_type : null
  description = "CloudFormation"
}

output "cloudfront_cache_policy" {
  value       = contains(var.resource_types, "cloudfront_cache_policy") ? local.aws.cloudfront_cache_policy : null
  description = "CloudFront"
}

output "cloudfront_continuous_deployment_policy" {
  value       = contains(var.resource_types, "cloudfront_continuous_deployment_policy") ? local.aws.cloudfront_continuous_deployment_policy : null
  description = "CloudFront"
}

output "cloudfront_distribution" {
  value       = contains(var.resource_types, "cloudfront_distribution") ? local.aws.cloudfront_distribution : null
  description = "CloudFront"
}

output "cloudfront_field_level_encryption_config" {
  value       = contains(var.resource_types, "cloudfront_field_level_encryption_config") ? local.aws.cloudfront_field_level_encryption_config : null
  description = "CloudFront"
}

output "cloudfront_field_level_encryption_profile" {
  value       = contains(var.resource_types, "cloudfront_field_level_encryption_profile") ? local.aws.cloudfront_field_level_encryption_profile : null
  description = "CloudFront"
}

output "cloudfront_function" {
  value       = contains(var.resource_types, "cloudfront_function") ? local.aws.cloudfront_function : null
  description = "CloudFront"
}

output "cloudfront_key_group" {
  value       = contains(var.resource_types, "cloudfront_key_group") ? local.aws.cloudfront_key_group : null
  description = "CloudFront"
}

output "cloudfront_key_value_store" {
  value       = contains(var.resource_types, "cloudfront_key_value_store") ? local.aws.cloudfront_key_value_store : null
  description = "CloudFront"
}

output "cloudfront_monitoring_subscription" {
  value       = contains(var.resource_types, "cloudfront_monitoring_subscription") ? local.aws.cloudfront_monitoring_subscription : null
  description = "CloudFront"
}

output "cloudfront_origin_access_control" {
  value       = contains(var.resource_types, "cloudfront_origin_access_control") ? local.aws.cloudfront_origin_access_control : null
  description = "CloudFront"
}

output "cloudfront_origin_access_identity" {
  value       = contains(var.resource_types, "cloudfront_origin_access_identity") ? local.aws.cloudfront_origin_access_identity : null
  description = "CloudFront"
}

output "cloudfront_origin_request_policy" {
  value       = contains(var.resource_types, "cloudfront_origin_request_policy") ? local.aws.cloudfront_origin_request_policy : null
  description = "CloudFront"
}

output "cloudfront_public_key" {
  value       = contains(var.resource_types, "cloudfront_public_key") ? local.aws.cloudfront_public_key : null
  description = "CloudFront"
}

output "cloudfront_realtime_log_config" {
  value       = contains(var.resource_types, "cloudfront_realtime_log_config") ? local.aws.cloudfront_realtime_log_config : null
  description = "CloudFront"
}

output "cloudfront_response_headers_policy" {
  value       = contains(var.resource_types, "cloudfront_response_headers_policy") ? local.aws.cloudfront_response_headers_policy : null
  description = "CloudFront"
}

output "cloudfront_vpc_origin" {
  value       = contains(var.resource_types, "cloudfront_vpc_origin") ? local.aws.cloudfront_vpc_origin : null
  description = "CloudFront"
}

output "cloudfrontkeyvaluestore_key" {
  value       = contains(var.resource_types, "cloudfrontkeyvaluestore_key") ? local.aws.cloudfrontkeyvaluestore_key : null
  description = "CloudFront KeyValueStore"
}

output "cloudhsm_v2_cluster" {
  value       = contains(var.resource_types, "cloudhsm_v2_cluster") ? local.aws.cloudhsm_v2_cluster : null
  description = "CloudHSM"
}

output "cloudhsm_v2_hsm" {
  value       = contains(var.resource_types, "cloudhsm_v2_hsm") ? local.aws.cloudhsm_v2_hsm : null
  description = "CloudHSM"
}

output "cloudsearch_domain" {
  value       = contains(var.resource_types, "cloudsearch_domain") ? local.aws.cloudsearch_domain : null
  description = "CloudSearch"
}

output "cloudsearch_domain_service_access_policy" {
  value       = contains(var.resource_types, "cloudsearch_domain_service_access_policy") ? local.aws.cloudsearch_domain_service_access_policy : null
  description = "CloudSearch"
}

output "cloudtrail" {
  value       = contains(var.resource_types, "cloudtrail") ? local.aws.cloudtrail : null
  description = "CloudTrail"
}

output "cloudtrail_event_data_store" {
  value       = contains(var.resource_types, "cloudtrail_event_data_store") ? local.aws.cloudtrail_event_data_store : null
  description = "CloudTrail"
}

output "cloudtrail_organization_delegated_admin_account" {
  value       = contains(var.resource_types, "cloudtrail_organization_delegated_admin_account") ? local.aws.cloudtrail_organization_delegated_admin_account : null
  description = "CloudTrail"
}

output "cloudwatch_composite_alarm" {
  value       = contains(var.resource_types, "cloudwatch_composite_alarm") ? local.aws.cloudwatch_composite_alarm : null
  description = "CloudWatch"
}

output "cloudwatch_contributor_insight_rule" {
  value       = contains(var.resource_types, "cloudwatch_contributor_insight_rule") ? local.aws.cloudwatch_contributor_insight_rule : null
  description = "CloudWatch"
}

output "cloudwatch_contributor_managed_insight_rule" {
  value       = contains(var.resource_types, "cloudwatch_contributor_managed_insight_rule") ? local.aws.cloudwatch_contributor_managed_insight_rule : null
  description = "CloudWatch"
}

output "cloudwatch_dashboard" {
  value       = contains(var.resource_types, "cloudwatch_dashboard") ? local.aws.cloudwatch_dashboard : null
  description = "CloudWatch"
}

output "cloudwatch_event_api_destination" {
  value       = contains(var.resource_types, "cloudwatch_event_api_destination") ? local.aws.cloudwatch_event_api_destination : null
  description = "EventBridge"
}

output "cloudwatch_event_archive" {
  value       = contains(var.resource_types, "cloudwatch_event_archive") ? local.aws.cloudwatch_event_archive : null
  description = "EventBridge"
}

output "cloudwatch_event_bus" {
  value       = contains(var.resource_types, "cloudwatch_event_bus") ? local.aws.cloudwatch_event_bus : null
  description = "EventBridge"
}

output "cloudwatch_event_bus_policy" {
  value       = contains(var.resource_types, "cloudwatch_event_bus_policy") ? local.aws.cloudwatch_event_bus_policy : null
  description = "EventBridge"
}

output "cloudwatch_event_connection" {
  value       = contains(var.resource_types, "cloudwatch_event_connection") ? local.aws.cloudwatch_event_connection : null
  description = "EventBridge"
}

output "cloudwatch_event_endpoint" {
  value       = contains(var.resource_types, "cloudwatch_event_endpoint") ? local.aws.cloudwatch_event_endpoint : null
  description = "EventBridge"
}

output "cloudwatch_event_permission" {
  value       = contains(var.resource_types, "cloudwatch_event_permission") ? local.aws.cloudwatch_event_permission : null
  description = "EventBridge"
}

output "cloudwatch_event_rule" {
  value       = contains(var.resource_types, "cloudwatch_event_rule") ? local.aws.cloudwatch_event_rule : null
  description = "EventBridge"
}

output "cloudwatch_event_target" {
  value       = contains(var.resource_types, "cloudwatch_event_target") ? local.aws.cloudwatch_event_target : null
  description = "EventBridge"
}

output "cloudwatch_log_account_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_account_policy") ? local.aws.cloudwatch_log_account_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_anomaly_detector" {
  value       = contains(var.resource_types, "cloudwatch_log_anomaly_detector") ? local.aws.cloudwatch_log_anomaly_detector : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_data_protection_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_data_protection_policy") ? local.aws.cloudwatch_log_data_protection_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_delivery" {
  value       = contains(var.resource_types, "cloudwatch_log_delivery") ? local.aws.cloudwatch_log_delivery : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_delivery_destination" {
  value       = contains(var.resource_types, "cloudwatch_log_delivery_destination") ? local.aws.cloudwatch_log_delivery_destination : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_delivery_destination_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_delivery_destination_policy") ? local.aws.cloudwatch_log_delivery_destination_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_delivery_source" {
  value       = contains(var.resource_types, "cloudwatch_log_delivery_source") ? local.aws.cloudwatch_log_delivery_source : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_destination" {
  value       = contains(var.resource_types, "cloudwatch_log_destination") ? local.aws.cloudwatch_log_destination : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_destination_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_destination_policy") ? local.aws.cloudwatch_log_destination_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_group" {
  value       = contains(var.resource_types, "cloudwatch_log_group") ? local.aws.cloudwatch_log_group : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_index_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_index_policy") ? local.aws.cloudwatch_log_index_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_metric_filter" {
  value       = contains(var.resource_types, "cloudwatch_log_metric_filter") ? local.aws.cloudwatch_log_metric_filter : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_resource_policy" {
  value       = contains(var.resource_types, "cloudwatch_log_resource_policy") ? local.aws.cloudwatch_log_resource_policy : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_stream" {
  value       = contains(var.resource_types, "cloudwatch_log_stream") ? local.aws.cloudwatch_log_stream : null
  description = "CloudWatch Logs"
}

output "cloudwatch_log_subscription_filter" {
  value       = contains(var.resource_types, "cloudwatch_log_subscription_filter") ? local.aws.cloudwatch_log_subscription_filter : null
  description = "CloudWatch Logs"
}

output "cloudwatch_metric_alarm" {
  value       = contains(var.resource_types, "cloudwatch_metric_alarm") ? local.aws.cloudwatch_metric_alarm : null
  description = "CloudWatch"
}

output "cloudwatch_metric_stream" {
  value       = contains(var.resource_types, "cloudwatch_metric_stream") ? local.aws.cloudwatch_metric_stream : null
  description = "CloudWatch"
}

output "cloudwatch_query_definition" {
  value       = contains(var.resource_types, "cloudwatch_query_definition") ? local.aws.cloudwatch_query_definition : null
  description = "CloudWatch Logs"
}

output "codeartifact_domain" {
  value       = contains(var.resource_types, "codeartifact_domain") ? local.aws.codeartifact_domain : null
  description = "CodeArtifact"
}

output "codeartifact_domain_permissions_policy" {
  value       = contains(var.resource_types, "codeartifact_domain_permissions_policy") ? local.aws.codeartifact_domain_permissions_policy : null
  description = "CodeArtifact"
}

output "codeartifact_repository" {
  value       = contains(var.resource_types, "codeartifact_repository") ? local.aws.codeartifact_repository : null
  description = "CodeArtifact"
}

output "codeartifact_repository_permissions_policy" {
  value       = contains(var.resource_types, "codeartifact_repository_permissions_policy") ? local.aws.codeartifact_repository_permissions_policy : null
  description = "CodeArtifact"
}

output "codebuild_fleet" {
  value       = contains(var.resource_types, "codebuild_fleet") ? local.aws.codebuild_fleet : null
  description = "CodeBuild"
}

output "codebuild_project" {
  value       = contains(var.resource_types, "codebuild_project") ? local.aws.codebuild_project : null
  description = "CodeBuild"
}

output "codebuild_report_group" {
  value       = contains(var.resource_types, "codebuild_report_group") ? local.aws.codebuild_report_group : null
  description = "CodeBuild"
}

output "codebuild_resource_policy" {
  value       = contains(var.resource_types, "codebuild_resource_policy") ? local.aws.codebuild_resource_policy : null
  description = "CodeBuild"
}

output "codebuild_source_credential" {
  value       = contains(var.resource_types, "codebuild_source_credential") ? local.aws.codebuild_source_credential : null
  description = "CodeBuild"
}

output "codebuild_webhook" {
  value       = contains(var.resource_types, "codebuild_webhook") ? local.aws.codebuild_webhook : null
  description = "CodeBuild"
}

output "codecatalyst_dev_environment" {
  value       = contains(var.resource_types, "codecatalyst_dev_environment") ? local.aws.codecatalyst_dev_environment : null
  description = "CodeCatalyst"
}

output "codecatalyst_project" {
  value       = contains(var.resource_types, "codecatalyst_project") ? local.aws.codecatalyst_project : null
  description = "CodeCatalyst"
}

output "codecatalyst_source_repository" {
  value       = contains(var.resource_types, "codecatalyst_source_repository") ? local.aws.codecatalyst_source_repository : null
  description = "CodeCatalyst"
}

output "codecommit_approval_rule_template" {
  value       = contains(var.resource_types, "codecommit_approval_rule_template") ? local.aws.codecommit_approval_rule_template : null
  description = "CodeCommit"
}

output "codecommit_approval_rule_template_association" {
  value       = contains(var.resource_types, "codecommit_approval_rule_template_association") ? local.aws.codecommit_approval_rule_template_association : null
  description = "CodeCommit"
}

output "codecommit_repository" {
  value       = contains(var.resource_types, "codecommit_repository") ? local.aws.codecommit_repository : null
  description = "CodeCommit"
}

output "codecommit_trigger" {
  value       = contains(var.resource_types, "codecommit_trigger") ? local.aws.codecommit_trigger : null
  description = "CodeCommit"
}

output "codeconnections_connection" {
  value       = contains(var.resource_types, "codeconnections_connection") ? local.aws.codeconnections_connection : null
  description = "CodeConnections"
}

output "codeconnections_host" {
  value       = contains(var.resource_types, "codeconnections_host") ? local.aws.codeconnections_host : null
  description = "CodeConnections"
}

output "codedeploy_app" {
  value       = contains(var.resource_types, "codedeploy_app") ? local.aws.codedeploy_app : null
  description = "CodeDeploy"
}

output "codedeploy_deployment_config" {
  value       = contains(var.resource_types, "codedeploy_deployment_config") ? local.aws.codedeploy_deployment_config : null
  description = "CodeDeploy"
}

output "codedeploy_deployment_group" {
  value       = contains(var.resource_types, "codedeploy_deployment_group") ? local.aws.codedeploy_deployment_group : null
  description = "CodeDeploy"
}

output "codeguruprofiler_profiling_group" {
  value       = contains(var.resource_types, "codeguruprofiler_profiling_group") ? local.aws.codeguruprofiler_profiling_group : null
  description = "CodeGuru Profiler"
}

output "codegurureviewer_repository_association" {
  value       = contains(var.resource_types, "codegurureviewer_repository_association") ? local.aws.codegurureviewer_repository_association : null
  description = "CodeGuru Reviewer"
}

output "codepipeline" {
  value       = contains(var.resource_types, "codepipeline") ? local.aws.codepipeline : null
  description = "CodePipeline"
}

output "codepipeline_custom_action_type" {
  value       = contains(var.resource_types, "codepipeline_custom_action_type") ? local.aws.codepipeline_custom_action_type : null
  description = "CodePipeline"
}

output "codepipeline_webhook" {
  value       = contains(var.resource_types, "codepipeline_webhook") ? local.aws.codepipeline_webhook : null
  description = "CodePipeline"
}

output "codestarconnections_connection" {
  value       = contains(var.resource_types, "codestarconnections_connection") ? local.aws.codestarconnections_connection : null
  description = "CodeStar Connections"
}

output "codestarconnections_host" {
  value       = contains(var.resource_types, "codestarconnections_host") ? local.aws.codestarconnections_host : null
  description = "CodeStar Connections"
}

output "codestarnotifications_notification_rule" {
  value       = contains(var.resource_types, "codestarnotifications_notification_rule") ? local.aws.codestarnotifications_notification_rule : null
  description = "CodeStar Notifications"
}

output "cognito_identity_pool" {
  value       = contains(var.resource_types, "cognito_identity_pool") ? local.aws.cognito_identity_pool : null
  description = "Cognito Identity"
}

output "cognito_identity_pool_provider_principal_tag" {
  value       = contains(var.resource_types, "cognito_identity_pool_provider_principal_tag") ? local.aws.cognito_identity_pool_provider_principal_tag : null
  description = "Cognito Identity"
}

output "cognito_identity_pool_roles_attachment" {
  value       = contains(var.resource_types, "cognito_identity_pool_roles_attachment") ? local.aws.cognito_identity_pool_roles_attachment : null
  description = "Cognito Identity"
}

output "cognito_identity_provider" {
  value       = contains(var.resource_types, "cognito_identity_provider") ? local.aws.cognito_identity_provider : null
  description = "Identity Provider"
}

output "cognito_managed_user_pool_client" {
  value       = contains(var.resource_types, "cognito_managed_user_pool_client") ? local.aws.cognito_managed_user_pool_client : null
  description = "Identity Provider"
}

output "cognito_resource_server" {
  value       = contains(var.resource_types, "cognito_resource_server") ? local.aws.cognito_resource_server : null
  description = "Identity Provider"
}

output "cognito_risk_configuration" {
  value       = contains(var.resource_types, "cognito_risk_configuration") ? local.aws.cognito_risk_configuration : null
  description = "Identity Provider"
}

output "cognito_user" {
  value       = contains(var.resource_types, "cognito_user") ? local.aws.cognito_user : null
  description = "Identity Provider"
}

output "cognito_user_group" {
  value       = contains(var.resource_types, "cognito_user_group") ? local.aws.cognito_user_group : null
  description = "Identity Provider"
}

output "cognito_user_in_group" {
  value       = contains(var.resource_types, "cognito_user_in_group") ? local.aws.cognito_user_in_group : null
  description = "Identity Provider"
}

output "cognito_user_pool" {
  value       = contains(var.resource_types, "cognito_user_pool") ? local.aws.cognito_user_pool : null
  description = "Identity Provider"
}

output "cognito_user_pool_client" {
  value       = contains(var.resource_types, "cognito_user_pool_client") ? local.aws.cognito_user_pool_client : null
  description = "Identity Provider"
}

output "cognito_user_pool_domain" {
  value       = contains(var.resource_types, "cognito_user_pool_domain") ? local.aws.cognito_user_pool_domain : null
  description = "Identity Provider"
}

output "cognito_user_pool_ui_customization" {
  value       = contains(var.resource_types, "cognito_user_pool_ui_customization") ? local.aws.cognito_user_pool_ui_customization : null
  description = "Identity Provider"
}

output "comprehend_document_classifier" {
  value       = contains(var.resource_types, "comprehend_document_classifier") ? local.aws.comprehend_document_classifier : null
  description = "Comprehend"
}

output "comprehend_entity_recognizer" {
  value       = contains(var.resource_types, "comprehend_entity_recognizer") ? local.aws.comprehend_entity_recognizer : null
  description = "Comprehend"
}

output "computeoptimizer_enrollment_status" {
  value       = contains(var.resource_types, "computeoptimizer_enrollment_status") ? local.aws.computeoptimizer_enrollment_status : null
  description = "Compute Optimizer"
}

output "computeoptimizer_recommendation_preferences" {
  value       = contains(var.resource_types, "computeoptimizer_recommendation_preferences") ? local.aws.computeoptimizer_recommendation_preferences : null
  description = "Compute Optimizer"
}

output "config_aggregate_authorization" {
  value       = contains(var.resource_types, "config_aggregate_authorization") ? local.aws.config_aggregate_authorization : null
  description = "Config"
}

output "config_config_rule" {
  value       = contains(var.resource_types, "config_config_rule") ? local.aws.config_config_rule : null
  description = "Config"
}

output "config_configuration_aggregator" {
  value       = contains(var.resource_types, "config_configuration_aggregator") ? local.aws.config_configuration_aggregator : null
  description = "Config"
}

output "config_configuration_recorder" {
  value       = contains(var.resource_types, "config_configuration_recorder") ? local.aws.config_configuration_recorder : null
  description = "Config"
}

output "config_configuration_recorder_status" {
  value       = contains(var.resource_types, "config_configuration_recorder_status") ? local.aws.config_configuration_recorder_status : null
  description = "Config"
}

output "config_conformance_pack" {
  value       = contains(var.resource_types, "config_conformance_pack") ? local.aws.config_conformance_pack : null
  description = "Config"
}

output "config_delivery_channel" {
  value       = contains(var.resource_types, "config_delivery_channel") ? local.aws.config_delivery_channel : null
  description = "Config"
}

output "config_organization_conformance_pack" {
  value       = contains(var.resource_types, "config_organization_conformance_pack") ? local.aws.config_organization_conformance_pack : null
  description = "Config"
}

output "config_organization_custom_policy_rule" {
  value       = contains(var.resource_types, "config_organization_custom_policy_rule") ? local.aws.config_organization_custom_policy_rule : null
  description = "Config"
}

output "config_organization_custom_rule" {
  value       = contains(var.resource_types, "config_organization_custom_rule") ? local.aws.config_organization_custom_rule : null
  description = "Config"
}

output "config_organization_managed_rule" {
  value       = contains(var.resource_types, "config_organization_managed_rule") ? local.aws.config_organization_managed_rule : null
  description = "Config"
}

output "config_remediation_configuration" {
  value       = contains(var.resource_types, "config_remediation_configuration") ? local.aws.config_remediation_configuration : null
  description = "Config"
}

output "config_retention_configuration" {
  value       = contains(var.resource_types, "config_retention_configuration") ? local.aws.config_retention_configuration : null
  description = "Config"
}

output "connect_bot_association" {
  value       = contains(var.resource_types, "connect_bot_association") ? local.aws.connect_bot_association : null
  description = "Connect"
}

output "connect_contact_flow" {
  value       = contains(var.resource_types, "connect_contact_flow") ? local.aws.connect_contact_flow : null
  description = "Connect"
}

output "connect_contact_flow_module" {
  value       = contains(var.resource_types, "connect_contact_flow_module") ? local.aws.connect_contact_flow_module : null
  description = "Connect"
}

output "connect_hours_of_operation" {
  value       = contains(var.resource_types, "connect_hours_of_operation") ? local.aws.connect_hours_of_operation : null
  description = "Connect"
}

output "connect_instance" {
  value       = contains(var.resource_types, "connect_instance") ? local.aws.connect_instance : null
  description = "Connect"
}

output "connect_instance_storage_config" {
  value       = contains(var.resource_types, "connect_instance_storage_config") ? local.aws.connect_instance_storage_config : null
  description = "Connect"
}

output "connect_lambda_function_association" {
  value       = contains(var.resource_types, "connect_lambda_function_association") ? local.aws.connect_lambda_function_association : null
  description = "Connect"
}

output "connect_phone_number" {
  value       = contains(var.resource_types, "connect_phone_number") ? local.aws.connect_phone_number : null
  description = "Connect"
}

output "connect_queue" {
  value       = contains(var.resource_types, "connect_queue") ? local.aws.connect_queue : null
  description = "Connect"
}

output "connect_quick_connect" {
  value       = contains(var.resource_types, "connect_quick_connect") ? local.aws.connect_quick_connect : null
  description = "Connect"
}

output "connect_routing_profile" {
  value       = contains(var.resource_types, "connect_routing_profile") ? local.aws.connect_routing_profile : null
  description = "Connect"
}

output "connect_security_profile" {
  value       = contains(var.resource_types, "connect_security_profile") ? local.aws.connect_security_profile : null
  description = "Connect"
}

output "connect_user" {
  value       = contains(var.resource_types, "connect_user") ? local.aws.connect_user : null
  description = "Connect"
}

output "connect_user_hierarchy_group" {
  value       = contains(var.resource_types, "connect_user_hierarchy_group") ? local.aws.connect_user_hierarchy_group : null
  description = "Connect"
}

output "connect_user_hierarchy_structure" {
  value       = contains(var.resource_types, "connect_user_hierarchy_structure") ? local.aws.connect_user_hierarchy_structure : null
  description = "Connect"
}

output "connect_vocabulary" {
  value       = contains(var.resource_types, "connect_vocabulary") ? local.aws.connect_vocabulary : null
  description = "Connect"
}

output "controltower_control" {
  value       = contains(var.resource_types, "controltower_control") ? local.aws.controltower_control : null
  description = "Control Tower"
}

output "controltower_landing_zone" {
  value       = contains(var.resource_types, "controltower_landing_zone") ? local.aws.controltower_landing_zone : null
  description = "Control Tower"
}

output "costoptimizationhub_enrollment_status" {
  value       = contains(var.resource_types, "costoptimizationhub_enrollment_status") ? local.aws.costoptimizationhub_enrollment_status : null
  description = "Cost Optimization Hub"
}

output "costoptimizationhub_preferences" {
  value       = contains(var.resource_types, "costoptimizationhub_preferences") ? local.aws.costoptimizationhub_preferences : null
  description = "Cost Optimization Hub"
}

output "cur_report_definition" {
  value       = contains(var.resource_types, "cur_report_definition") ? local.aws.cur_report_definition : null
  description = "Cost and Usage Report"
}

output "customer_gateway" {
  value       = contains(var.resource_types, "customer_gateway") ? local.aws.customer_gateway : null
  description = "Site-to-Site"
}

output "customerprofiles_domain" {
  value       = contains(var.resource_types, "customerprofiles_domain") ? local.aws.customerprofiles_domain : null
  description = "Connect Customer Profiles"
}

output "customerprofiles_profile" {
  value       = contains(var.resource_types, "customerprofiles_profile") ? local.aws.customerprofiles_profile : null
  description = "Connect Customer Profiles"
}

output "dataexchange_data_set" {
  value       = contains(var.resource_types, "dataexchange_data_set") ? local.aws.dataexchange_data_set : null
  description = "Data Exchange"
}

output "dataexchange_event_action" {
  value       = contains(var.resource_types, "dataexchange_event_action") ? local.aws.dataexchange_event_action : null
  description = "Data Exchange"
}

output "dataexchange_revision" {
  value       = contains(var.resource_types, "dataexchange_revision") ? local.aws.dataexchange_revision : null
  description = "Data Exchange"
}

output "datapipeline_pipeline" {
  value       = contains(var.resource_types, "datapipeline_pipeline") ? local.aws.datapipeline_pipeline : null
  description = "Data Pipeline"
}

output "datapipeline_pipeline_definition" {
  value       = contains(var.resource_types, "datapipeline_pipeline_definition") ? local.aws.datapipeline_pipeline_definition : null
  description = "Data Pipeline"
}

output "datasync_agent" {
  value       = contains(var.resource_types, "datasync_agent") ? local.aws.datasync_agent : null
  description = "DataSync"
}

output "datasync_location_azure_blob" {
  value       = contains(var.resource_types, "datasync_location_azure_blob") ? local.aws.datasync_location_azure_blob : null
  description = "DataSync"
}

output "datasync_location_efs" {
  value       = contains(var.resource_types, "datasync_location_efs") ? local.aws.datasync_location_efs : null
  description = "DataSync"
}

output "datasync_location_fsx_lustre_file_system" {
  value       = contains(var.resource_types, "datasync_location_fsx_lustre_file_system") ? local.aws.datasync_location_fsx_lustre_file_system : null
  description = "DataSync"
}

output "datasync_location_fsx_ontap_file_system" {
  value       = contains(var.resource_types, "datasync_location_fsx_ontap_file_system") ? local.aws.datasync_location_fsx_ontap_file_system : null
  description = "DataSync"
}

output "datasync_location_fsx_openzfs_file_system" {
  value       = contains(var.resource_types, "datasync_location_fsx_openzfs_file_system") ? local.aws.datasync_location_fsx_openzfs_file_system : null
  description = "DataSync"
}

output "datasync_location_fsx_windows_file_system" {
  value       = contains(var.resource_types, "datasync_location_fsx_windows_file_system") ? local.aws.datasync_location_fsx_windows_file_system : null
  description = "DataSync"
}

output "datasync_location_hdfs" {
  value       = contains(var.resource_types, "datasync_location_hdfs") ? local.aws.datasync_location_hdfs : null
  description = "DataSync"
}

output "datasync_location_nfs" {
  value       = contains(var.resource_types, "datasync_location_nfs") ? local.aws.datasync_location_nfs : null
  description = "DataSync"
}

output "datasync_location_object_storage" {
  value       = contains(var.resource_types, "datasync_location_object_storage") ? local.aws.datasync_location_object_storage : null
  description = "DataSync"
}

output "datasync_location_s3" {
  value       = contains(var.resource_types, "datasync_location_s3") ? local.aws.datasync_location_s3 : null
  description = "DataSync"
}

output "datasync_location_smb" {
  value       = contains(var.resource_types, "datasync_location_smb") ? local.aws.datasync_location_smb : null
  description = "DataSync"
}

output "datasync_task" {
  value       = contains(var.resource_types, "datasync_task") ? local.aws.datasync_task : null
  description = "DataSync"
}

output "datazone_asset_type" {
  value       = contains(var.resource_types, "datazone_asset_type") ? local.aws.datazone_asset_type : null
  description = "DataZone"
}

output "datazone_domain" {
  value       = contains(var.resource_types, "datazone_domain") ? local.aws.datazone_domain : null
  description = "DataZone"
}

output "datazone_environment" {
  value       = contains(var.resource_types, "datazone_environment") ? local.aws.datazone_environment : null
  description = "DataZone"
}

output "datazone_environment_blueprint_configuration" {
  value       = contains(var.resource_types, "datazone_environment_blueprint_configuration") ? local.aws.datazone_environment_blueprint_configuration : null
  description = "DataZone"
}

output "datazone_environment_profile" {
  value       = contains(var.resource_types, "datazone_environment_profile") ? local.aws.datazone_environment_profile : null
  description = "DataZone"
}

output "datazone_form_type" {
  value       = contains(var.resource_types, "datazone_form_type") ? local.aws.datazone_form_type : null
  description = "DataZone"
}

output "datazone_glossary" {
  value       = contains(var.resource_types, "datazone_glossary") ? local.aws.datazone_glossary : null
  description = "DataZone"
}

output "datazone_glossary_term" {
  value       = contains(var.resource_types, "datazone_glossary_term") ? local.aws.datazone_glossary_term : null
  description = "DataZone"
}

output "datazone_project" {
  value       = contains(var.resource_types, "datazone_project") ? local.aws.datazone_project : null
  description = "DataZone"
}

output "datazone_user_profile" {
  value       = contains(var.resource_types, "datazone_user_profile") ? local.aws.datazone_user_profile : null
  description = "DataZone"
}

output "dax_cluster" {
  value       = contains(var.resource_types, "dax_cluster") ? local.aws.dax_cluster : null
  description = "DAX"
}

output "dax_parameter_group" {
  value       = contains(var.resource_types, "dax_parameter_group") ? local.aws.dax_parameter_group : null
  description = "DAX"
}

output "dax_subnet_group" {
  value       = contains(var.resource_types, "dax_subnet_group") ? local.aws.dax_subnet_group : null
  description = "DAX"
}

output "db_cluster_snapshot" {
  value       = contains(var.resource_types, "db_cluster_snapshot") ? local.aws.db_cluster_snapshot : null
  description = "Relational Database"
}

output "db_event_subscription" {
  value       = contains(var.resource_types, "db_event_subscription") ? local.aws.db_event_subscription : null
  description = "Relational Database"
}

output "db_instance" {
  value       = contains(var.resource_types, "db_instance") ? local.aws.db_instance : null
  description = "Relational Database"
}

output "db_instance_automated_backups_replication" {
  value       = contains(var.resource_types, "db_instance_automated_backups_replication") ? local.aws.db_instance_automated_backups_replication : null
  description = "Relational Database"
}

output "db_instance_role_association" {
  value       = contains(var.resource_types, "db_instance_role_association") ? local.aws.db_instance_role_association : null
  description = "Relational Database"
}

output "db_option_group" {
  value       = contains(var.resource_types, "db_option_group") ? local.aws.db_option_group : null
  description = "Relational Database"
}

output "db_parameter_group" {
  value       = contains(var.resource_types, "db_parameter_group") ? local.aws.db_parameter_group : null
  description = "Relational Database"
}

output "db_proxy" {
  value       = contains(var.resource_types, "db_proxy") ? local.aws.db_proxy : null
  description = "Relational Database"
}

output "db_proxy_default_target_group" {
  value       = contains(var.resource_types, "db_proxy_default_target_group") ? local.aws.db_proxy_default_target_group : null
  description = "Relational Database"
}

output "db_proxy_endpoint" {
  value       = contains(var.resource_types, "db_proxy_endpoint") ? local.aws.db_proxy_endpoint : null
  description = "Relational Database"
}

output "db_proxy_target" {
  value       = contains(var.resource_types, "db_proxy_target") ? local.aws.db_proxy_target : null
  description = "Relational Database"
}

output "db_snapshot" {
  value       = contains(var.resource_types, "db_snapshot") ? local.aws.db_snapshot : null
  description = "Relational Database"
}

output "db_snapshot_copy" {
  value       = contains(var.resource_types, "db_snapshot_copy") ? local.aws.db_snapshot_copy : null
  description = "Relational Database"
}

output "db_subnet_group" {
  value       = contains(var.resource_types, "db_subnet_group") ? local.aws.db_subnet_group : null
  description = "Relational Database"
}

output "default_network_acl" {
  value       = contains(var.resource_types, "default_network_acl") ? local.aws.default_network_acl : null
  description = "Virtual Private Cloud"
}

output "default_route_table" {
  value       = contains(var.resource_types, "default_route_table") ? local.aws.default_route_table : null
  description = "Virtual Private Cloud"
}

output "default_security_group" {
  value       = contains(var.resource_types, "default_security_group") ? local.aws.default_security_group : null
  description = "Virtual Private Cloud"
}

output "default_subnet" {
  value       = contains(var.resource_types, "default_subnet") ? local.aws.default_subnet : null
  description = "Virtual Private Cloud"
}

output "default_vpc" {
  value       = contains(var.resource_types, "default_vpc") ? local.aws.default_vpc : null
  description = "Virtual Private Cloud"
}

output "default_vpc_dhcp_options" {
  value       = contains(var.resource_types, "default_vpc_dhcp_options") ? local.aws.default_vpc_dhcp_options : null
  description = "Virtual Private Cloud"
}

output "detective_graph" {
  value       = contains(var.resource_types, "detective_graph") ? local.aws.detective_graph : null
  description = "Detective"
}

output "detective_invitation_accepter" {
  value       = contains(var.resource_types, "detective_invitation_accepter") ? local.aws.detective_invitation_accepter : null
  description = "Detective"
}

output "detective_member" {
  value       = contains(var.resource_types, "detective_member") ? local.aws.detective_member : null
  description = "Detective"
}

output "detective_organization_admin_account" {
  value       = contains(var.resource_types, "detective_organization_admin_account") ? local.aws.detective_organization_admin_account : null
  description = "Detective"
}

output "detective_organization_configuration" {
  value       = contains(var.resource_types, "detective_organization_configuration") ? local.aws.detective_organization_configuration : null
  description = "Detective"
}

output "devicefarm_device_pool" {
  value       = contains(var.resource_types, "devicefarm_device_pool") ? local.aws.devicefarm_device_pool : null
  description = "Device Farm"
}

output "devicefarm_instance_profile" {
  value       = contains(var.resource_types, "devicefarm_instance_profile") ? local.aws.devicefarm_instance_profile : null
  description = "Device Farm"
}

output "devicefarm_network_profile" {
  value       = contains(var.resource_types, "devicefarm_network_profile") ? local.aws.devicefarm_network_profile : null
  description = "Device Farm"
}

output "devicefarm_project" {
  value       = contains(var.resource_types, "devicefarm_project") ? local.aws.devicefarm_project : null
  description = "Device Farm"
}

output "devicefarm_test_grid_project" {
  value       = contains(var.resource_types, "devicefarm_test_grid_project") ? local.aws.devicefarm_test_grid_project : null
  description = "Device Farm"
}

output "devicefarm_upload" {
  value       = contains(var.resource_types, "devicefarm_upload") ? local.aws.devicefarm_upload : null
  description = "Device Farm"
}

output "devopsguru_event_sources_config" {
  value       = contains(var.resource_types, "devopsguru_event_sources_config") ? local.aws.devopsguru_event_sources_config : null
  description = "DevOps Guru"
}

output "devopsguru_notification_channel" {
  value       = contains(var.resource_types, "devopsguru_notification_channel") ? local.aws.devopsguru_notification_channel : null
  description = "DevOps Guru"
}

output "devopsguru_resource_collection" {
  value       = contains(var.resource_types, "devopsguru_resource_collection") ? local.aws.devopsguru_resource_collection : null
  description = "DevOps Guru"
}

output "devopsguru_service_integration" {
  value       = contains(var.resource_types, "devopsguru_service_integration") ? local.aws.devopsguru_service_integration : null
  description = "DevOps Guru"
}

output "directory_service_conditional_forwarder" {
  value       = contains(var.resource_types, "directory_service_conditional_forwarder") ? local.aws.directory_service_conditional_forwarder : null
  description = "Directory Service"
}

output "directory_service_directory" {
  value       = contains(var.resource_types, "directory_service_directory") ? local.aws.directory_service_directory : null
  description = "Directory Service"
}

output "directory_service_log_subscription" {
  value       = contains(var.resource_types, "directory_service_log_subscription") ? local.aws.directory_service_log_subscription : null
  description = "Directory Service"
}

output "directory_service_radius_settings" {
  value       = contains(var.resource_types, "directory_service_radius_settings") ? local.aws.directory_service_radius_settings : null
  description = "Directory Service"
}

output "directory_service_region" {
  value       = contains(var.resource_types, "directory_service_region") ? local.aws.directory_service_region : null
  description = "Directory Service"
}

output "directory_service_shared_directory" {
  value       = contains(var.resource_types, "directory_service_shared_directory") ? local.aws.directory_service_shared_directory : null
  description = "Directory Service"
}

output "directory_service_shared_directory_accepter" {
  value       = contains(var.resource_types, "directory_service_shared_directory_accepter") ? local.aws.directory_service_shared_directory_accepter : null
  description = "Directory Service"
}

output "directory_service_trust" {
  value       = contains(var.resource_types, "directory_service_trust") ? local.aws.directory_service_trust : null
  description = "Directory Service"
}

output "dlm_lifecycle_policy" {
  value       = contains(var.resource_types, "dlm_lifecycle_policy") ? local.aws.dlm_lifecycle_policy : null
  description = "Data Lifecycle Manager"
}

output "dms_certificate" {
  value       = contains(var.resource_types, "dms_certificate") ? local.aws.dms_certificate : null
  description = "Database Migration"
}

output "dms_endpoint" {
  value       = contains(var.resource_types, "dms_endpoint") ? local.aws.dms_endpoint : null
  description = "Database Migration"
}

output "dms_event_subscription" {
  value       = contains(var.resource_types, "dms_event_subscription") ? local.aws.dms_event_subscription : null
  description = "Database Migration"
}

output "dms_replication_config" {
  value       = contains(var.resource_types, "dms_replication_config") ? local.aws.dms_replication_config : null
  description = "Database Migration"
}

output "dms_replication_instance" {
  value       = contains(var.resource_types, "dms_replication_instance") ? local.aws.dms_replication_instance : null
  description = "Database Migration"
}

output "dms_replication_subnet_group" {
  value       = contains(var.resource_types, "dms_replication_subnet_group") ? local.aws.dms_replication_subnet_group : null
  description = "Database Migration"
}

output "dms_replication_task" {
  value       = contains(var.resource_types, "dms_replication_task") ? local.aws.dms_replication_task : null
  description = "Database Migration"
}

output "dms_s3_endpoint" {
  value       = contains(var.resource_types, "dms_s3_endpoint") ? local.aws.dms_s3_endpoint : null
  description = "Database Migration"
}

output "docdb_cluster" {
  value       = contains(var.resource_types, "docdb_cluster") ? local.aws.docdb_cluster : null
  description = "DocumentDB"
}

output "docdb_cluster_instance" {
  value       = contains(var.resource_types, "docdb_cluster_instance") ? local.aws.docdb_cluster_instance : null
  description = "DocumentDB"
}

output "docdb_cluster_parameter_group" {
  value       = contains(var.resource_types, "docdb_cluster_parameter_group") ? local.aws.docdb_cluster_parameter_group : null
  description = "DocumentDB"
}

output "docdb_cluster_snapshot" {
  value       = contains(var.resource_types, "docdb_cluster_snapshot") ? local.aws.docdb_cluster_snapshot : null
  description = "DocumentDB"
}

output "docdb_event_subscription" {
  value       = contains(var.resource_types, "docdb_event_subscription") ? local.aws.docdb_event_subscription : null
  description = "DocumentDB"
}

output "docdb_global_cluster" {
  value       = contains(var.resource_types, "docdb_global_cluster") ? local.aws.docdb_global_cluster : null
  description = "DocumentDB"
}

output "docdb_subnet_group" {
  value       = contains(var.resource_types, "docdb_subnet_group") ? local.aws.docdb_subnet_group : null
  description = "DocumentDB"
}

output "docdbelastic_cluster" {
  value       = contains(var.resource_types, "docdbelastic_cluster") ? local.aws.docdbelastic_cluster : null
  description = "DocumentDB Elastic"
}

output "drs_replication_configuration_template" {
  value       = contains(var.resource_types, "drs_replication_configuration_template") ? local.aws.drs_replication_configuration_template : null
  description = "Elastic Disaster Recovery"
}

output "dx_bgp_peer" {
  value       = contains(var.resource_types, "dx_bgp_peer") ? local.aws.dx_bgp_peer : null
  description = "Direct Connect"
}

output "dx_connection" {
  value       = contains(var.resource_types, "dx_connection") ? local.aws.dx_connection : null
  description = "Direct Connect"
}

output "dx_connection_association" {
  value       = contains(var.resource_types, "dx_connection_association") ? local.aws.dx_connection_association : null
  description = "Direct Connect"
}

output "dx_connection_confirmation" {
  value       = contains(var.resource_types, "dx_connection_confirmation") ? local.aws.dx_connection_confirmation : null
  description = "Direct Connect"
}

output "dx_gateway" {
  value       = contains(var.resource_types, "dx_gateway") ? local.aws.dx_gateway : null
  description = "Direct Connect"
}

output "dx_gateway_association" {
  value       = contains(var.resource_types, "dx_gateway_association") ? local.aws.dx_gateway_association : null
  description = "Direct Connect"
}

output "dx_gateway_association_proposal" {
  value       = contains(var.resource_types, "dx_gateway_association_proposal") ? local.aws.dx_gateway_association_proposal : null
  description = "Direct Connect"
}

output "dx_hosted_connection" {
  value       = contains(var.resource_types, "dx_hosted_connection") ? local.aws.dx_hosted_connection : null
  description = "Direct Connect"
}

output "dx_hosted_private_virtual_interface" {
  value       = contains(var.resource_types, "dx_hosted_private_virtual_interface") ? local.aws.dx_hosted_private_virtual_interface : null
  description = "Direct Connect"
}

output "dx_hosted_private_virtual_interface_accepter" {
  value       = contains(var.resource_types, "dx_hosted_private_virtual_interface_accepter") ? local.aws.dx_hosted_private_virtual_interface_accepter : null
  description = "Direct Connect"
}

output "dx_hosted_public_virtual_interface" {
  value       = contains(var.resource_types, "dx_hosted_public_virtual_interface") ? local.aws.dx_hosted_public_virtual_interface : null
  description = "Direct Connect"
}

output "dx_hosted_public_virtual_interface_accepter" {
  value       = contains(var.resource_types, "dx_hosted_public_virtual_interface_accepter") ? local.aws.dx_hosted_public_virtual_interface_accepter : null
  description = "Direct Connect"
}

output "dx_hosted_transit_virtual_interface" {
  value       = contains(var.resource_types, "dx_hosted_transit_virtual_interface") ? local.aws.dx_hosted_transit_virtual_interface : null
  description = "Direct Connect"
}

output "dx_hosted_transit_virtual_interface_accepter" {
  value       = contains(var.resource_types, "dx_hosted_transit_virtual_interface_accepter") ? local.aws.dx_hosted_transit_virtual_interface_accepter : null
  description = "Direct Connect"
}

output "dx_lag" {
  value       = contains(var.resource_types, "dx_lag") ? local.aws.dx_lag : null
  description = "Direct Connect"
}

output "dx_macsec_key_association" {
  value       = contains(var.resource_types, "dx_macsec_key_association") ? local.aws.dx_macsec_key_association : null
  description = "Direct Connect"
}

output "dx_private_virtual_interface" {
  value       = contains(var.resource_types, "dx_private_virtual_interface") ? local.aws.dx_private_virtual_interface : null
  description = "Direct Connect"
}

output "dx_public_virtual_interface" {
  value       = contains(var.resource_types, "dx_public_virtual_interface") ? local.aws.dx_public_virtual_interface : null
  description = "Direct Connect"
}

output "dx_transit_virtual_interface" {
  value       = contains(var.resource_types, "dx_transit_virtual_interface") ? local.aws.dx_transit_virtual_interface : null
  description = "Direct Connect"
}

output "dynamodb_contributor_insights" {
  value       = contains(var.resource_types, "dynamodb_contributor_insights") ? local.aws.dynamodb_contributor_insights : null
  description = "DynamoDB"
}

output "dynamodb_global_table" {
  value       = contains(var.resource_types, "dynamodb_global_table") ? local.aws.dynamodb_global_table : null
  description = "DynamoDB"
}

output "dynamodb_kinesis_streaming_destination" {
  value       = contains(var.resource_types, "dynamodb_kinesis_streaming_destination") ? local.aws.dynamodb_kinesis_streaming_destination : null
  description = "DynamoDB"
}

output "dynamodb_resource_policy" {
  value       = contains(var.resource_types, "dynamodb_resource_policy") ? local.aws.dynamodb_resource_policy : null
  description = "DynamoDB"
}

output "dynamodb_table" {
  value       = contains(var.resource_types, "dynamodb_table") ? local.aws.dynamodb_table : null
  description = "DynamoDB"
}

output "dynamodb_table_export" {
  value       = contains(var.resource_types, "dynamodb_table_export") ? local.aws.dynamodb_table_export : null
  description = "DynamoDB"
}

output "dynamodb_table_item" {
  value       = contains(var.resource_types, "dynamodb_table_item") ? local.aws.dynamodb_table_item : null
  description = "DynamoDB"
}

output "dynamodb_table_replica" {
  value       = contains(var.resource_types, "dynamodb_table_replica") ? local.aws.dynamodb_table_replica : null
  description = "DynamoDB"
}

output "dynamodb_tag" {
  value       = contains(var.resource_types, "dynamodb_tag") ? local.aws.dynamodb_tag : null
  description = "DynamoDB"
}

output "ebs_default_kms_key" {
  value       = contains(var.resource_types, "ebs_default_kms_key") ? local.aws.ebs_default_kms_key : null
  description = "EC2"
}

output "ebs_encryption_by_default" {
  value       = contains(var.resource_types, "ebs_encryption_by_default") ? local.aws.ebs_encryption_by_default : null
  description = "EC2"
}

output "ebs_fast_snapshot_restore" {
  value       = contains(var.resource_types, "ebs_fast_snapshot_restore") ? local.aws.ebs_fast_snapshot_restore : null
  description = "EC2"
}

output "ebs_snapshot" {
  value       = contains(var.resource_types, "ebs_snapshot") ? local.aws.ebs_snapshot : null
  description = "EC2"
}

output "ebs_snapshot_block_public_access" {
  value       = contains(var.resource_types, "ebs_snapshot_block_public_access") ? local.aws.ebs_snapshot_block_public_access : null
  description = "EC2"
}

output "ebs_snapshot_copy" {
  value       = contains(var.resource_types, "ebs_snapshot_copy") ? local.aws.ebs_snapshot_copy : null
  description = "EC2"
}

output "ebs_snapshot_import" {
  value       = contains(var.resource_types, "ebs_snapshot_import") ? local.aws.ebs_snapshot_import : null
  description = "EC2"
}

output "ebs_volume" {
  value       = contains(var.resource_types, "ebs_volume") ? local.aws.ebs_volume : null
  description = "EC2"
}

output "ec2_availability_zone_group" {
  value       = contains(var.resource_types, "ec2_availability_zone_group") ? local.aws.ec2_availability_zone_group : null
  description = "Elastic Compute Cloud"
}

output "ec2_capacity_block_reservation" {
  value       = contains(var.resource_types, "ec2_capacity_block_reservation") ? local.aws.ec2_capacity_block_reservation : null
  description = "Elastic Compute Cloud"
}

output "ec2_capacity_reservation" {
  value       = contains(var.resource_types, "ec2_capacity_reservation") ? local.aws.ec2_capacity_reservation : null
  description = "Elastic Compute Cloud"
}

output "ec2_carrier_gateway" {
  value       = contains(var.resource_types, "ec2_carrier_gateway") ? local.aws.ec2_carrier_gateway : null
  description = "Wavelength"
}

output "ec2_client_vpn_authorization_rule" {
  value       = contains(var.resource_types, "ec2_client_vpn_authorization_rule") ? local.aws.ec2_client_vpn_authorization_rule : null
  description = "Client"
}

output "ec2_client_vpn_endpoint" {
  value       = contains(var.resource_types, "ec2_client_vpn_endpoint") ? local.aws.ec2_client_vpn_endpoint : null
  description = "Client"
}

output "ec2_client_vpn_network_association" {
  value       = contains(var.resource_types, "ec2_client_vpn_network_association") ? local.aws.ec2_client_vpn_network_association : null
  description = "Client"
}

output "ec2_client_vpn_route" {
  value       = contains(var.resource_types, "ec2_client_vpn_route") ? local.aws.ec2_client_vpn_route : null
  description = "Client"
}

output "ec2_fleet" {
  value       = contains(var.resource_types, "ec2_fleet") ? local.aws.ec2_fleet : null
  description = "Elastic Compute Cloud"
}

output "ec2_host" {
  value       = contains(var.resource_types, "ec2_host") ? local.aws.ec2_host : null
  description = "Elastic Compute Cloud"
}

output "ec2_image_block_public_access" {
  value       = contains(var.resource_types, "ec2_image_block_public_access") ? local.aws.ec2_image_block_public_access : null
  description = "Elastic Compute Cloud"
}

output "ec2_instance_connect_endpoint" {
  value       = contains(var.resource_types, "ec2_instance_connect_endpoint") ? local.aws.ec2_instance_connect_endpoint : null
  description = "Elastic Compute Cloud"
}

output "ec2_instance_metadata_defaults" {
  value       = contains(var.resource_types, "ec2_instance_metadata_defaults") ? local.aws.ec2_instance_metadata_defaults : null
  description = "Elastic Compute Cloud"
}

output "ec2_instance_state" {
  value       = contains(var.resource_types, "ec2_instance_state") ? local.aws.ec2_instance_state : null
  description = "Elastic Compute Cloud"
}

output "ec2_local_gateway_route" {
  value       = contains(var.resource_types, "ec2_local_gateway_route") ? local.aws.ec2_local_gateway_route : null
  description = "EC2"
}

output "ec2_local_gateway_route_table_vpc_association" {
  value       = contains(var.resource_types, "ec2_local_gateway_route_table_vpc_association") ? local.aws.ec2_local_gateway_route_table_vpc_association : null
  description = "EC2"
}

output "ec2_managed_prefix_list" {
  value       = contains(var.resource_types, "ec2_managed_prefix_list") ? local.aws.ec2_managed_prefix_list : null
  description = "Virtual Private Cloud"
}

output "ec2_managed_prefix_list_entry" {
  value       = contains(var.resource_types, "ec2_managed_prefix_list_entry") ? local.aws.ec2_managed_prefix_list_entry : null
  description = "Virtual Private Cloud"
}

output "ec2_network_insights_analysis" {
  value       = contains(var.resource_types, "ec2_network_insights_analysis") ? local.aws.ec2_network_insights_analysis : null
  description = "Virtual Private Cloud"
}

output "ec2_network_insights_path" {
  value       = contains(var.resource_types, "ec2_network_insights_path") ? local.aws.ec2_network_insights_path : null
  description = "Virtual Private Cloud"
}

output "ec2_serial_console_access" {
  value       = contains(var.resource_types, "ec2_serial_console_access") ? local.aws.ec2_serial_console_access : null
  description = "Elastic Compute Cloud"
}

output "ec2_subnet_cidr_reservation" {
  value       = contains(var.resource_types, "ec2_subnet_cidr_reservation") ? local.aws.ec2_subnet_cidr_reservation : null
  description = "Virtual Private Cloud"
}

output "ec2_tag" {
  value       = contains(var.resource_types, "ec2_tag") ? local.aws.ec2_tag : null
  description = "Elastic Compute Cloud"
}

output "ec2_traffic_mirror_filter" {
  value       = contains(var.resource_types, "ec2_traffic_mirror_filter") ? local.aws.ec2_traffic_mirror_filter : null
  description = "Virtual Private Cloud"
}

output "ec2_traffic_mirror_filter_rule" {
  value       = contains(var.resource_types, "ec2_traffic_mirror_filter_rule") ? local.aws.ec2_traffic_mirror_filter_rule : null
  description = "Virtual Private Cloud"
}

output "ec2_traffic_mirror_session" {
  value       = contains(var.resource_types, "ec2_traffic_mirror_session") ? local.aws.ec2_traffic_mirror_session : null
  description = "Virtual Private Cloud"
}

output "ec2_traffic_mirror_target" {
  value       = contains(var.resource_types, "ec2_traffic_mirror_target") ? local.aws.ec2_traffic_mirror_target : null
  description = "Virtual Private Cloud"
}

output "ec2_transit_gateway" {
  value       = contains(var.resource_types, "ec2_transit_gateway") ? local.aws.ec2_transit_gateway : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_connect" {
  value       = contains(var.resource_types, "ec2_transit_gateway_connect") ? local.aws.ec2_transit_gateway_connect : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_connect_peer" {
  value       = contains(var.resource_types, "ec2_transit_gateway_connect_peer") ? local.aws.ec2_transit_gateway_connect_peer : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_default_route_table_association" {
  value       = contains(var.resource_types, "ec2_transit_gateway_default_route_table_association") ? local.aws.ec2_transit_gateway_default_route_table_association : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_default_route_table_propagation" {
  value       = contains(var.resource_types, "ec2_transit_gateway_default_route_table_propagation") ? local.aws.ec2_transit_gateway_default_route_table_propagation : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_multicast_domain" {
  value       = contains(var.resource_types, "ec2_transit_gateway_multicast_domain") ? local.aws.ec2_transit_gateway_multicast_domain : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_multicast_domain_association" {
  value       = contains(var.resource_types, "ec2_transit_gateway_multicast_domain_association") ? local.aws.ec2_transit_gateway_multicast_domain_association : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_multicast_group_member" {
  value       = contains(var.resource_types, "ec2_transit_gateway_multicast_group_member") ? local.aws.ec2_transit_gateway_multicast_group_member : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_multicast_group_source" {
  value       = contains(var.resource_types, "ec2_transit_gateway_multicast_group_source") ? local.aws.ec2_transit_gateway_multicast_group_source : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_peering_attachment" {
  value       = contains(var.resource_types, "ec2_transit_gateway_peering_attachment") ? local.aws.ec2_transit_gateway_peering_attachment : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_peering_attachment_accepter" {
  value       = contains(var.resource_types, "ec2_transit_gateway_peering_attachment_accepter") ? local.aws.ec2_transit_gateway_peering_attachment_accepter : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_policy_table" {
  value       = contains(var.resource_types, "ec2_transit_gateway_policy_table") ? local.aws.ec2_transit_gateway_policy_table : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_policy_table_association" {
  value       = contains(var.resource_types, "ec2_transit_gateway_policy_table_association") ? local.aws.ec2_transit_gateway_policy_table_association : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_prefix_list_reference" {
  value       = contains(var.resource_types, "ec2_transit_gateway_prefix_list_reference") ? local.aws.ec2_transit_gateway_prefix_list_reference : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_route" {
  value       = contains(var.resource_types, "ec2_transit_gateway_route") ? local.aws.ec2_transit_gateway_route : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_route_table" {
  value       = contains(var.resource_types, "ec2_transit_gateway_route_table") ? local.aws.ec2_transit_gateway_route_table : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_route_table_association" {
  value       = contains(var.resource_types, "ec2_transit_gateway_route_table_association") ? local.aws.ec2_transit_gateway_route_table_association : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_route_table_propagation" {
  value       = contains(var.resource_types, "ec2_transit_gateway_route_table_propagation") ? local.aws.ec2_transit_gateway_route_table_propagation : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_vpc_attachment" {
  value       = contains(var.resource_types, "ec2_transit_gateway_vpc_attachment") ? local.aws.ec2_transit_gateway_vpc_attachment : null
  description = "Transit Gateway"
}

output "ec2_transit_gateway_vpc_attachment_accepter" {
  value       = contains(var.resource_types, "ec2_transit_gateway_vpc_attachment_accepter") ? local.aws.ec2_transit_gateway_vpc_attachment_accepter : null
  description = "Transit Gateway"
}

output "ecr_account_setting" {
  value       = contains(var.resource_types, "ecr_account_setting") ? local.aws.ecr_account_setting : null
  description = "Elastic Container Registry"
}

output "ecr_lifecycle_policy" {
  value       = contains(var.resource_types, "ecr_lifecycle_policy") ? local.aws.ecr_lifecycle_policy : null
  description = "Elastic Container Registry"
}

output "ecr_pull_through_cache_rule" {
  value       = contains(var.resource_types, "ecr_pull_through_cache_rule") ? local.aws.ecr_pull_through_cache_rule : null
  description = "Elastic Container Registry"
}

output "ecr_registry_policy" {
  value       = contains(var.resource_types, "ecr_registry_policy") ? local.aws.ecr_registry_policy : null
  description = "Elastic Container Registry"
}

output "ecr_registry_scanning_configuration" {
  value       = contains(var.resource_types, "ecr_registry_scanning_configuration") ? local.aws.ecr_registry_scanning_configuration : null
  description = "Elastic Container Registry"
}

output "ecr_replication_configuration" {
  value       = contains(var.resource_types, "ecr_replication_configuration") ? local.aws.ecr_replication_configuration : null
  description = "Elastic Container Registry"
}

output "ecr_repository" {
  value       = contains(var.resource_types, "ecr_repository") ? local.aws.ecr_repository : null
  description = "Elastic Container Registry"
}

output "ecr_repository_creation_template" {
  value       = contains(var.resource_types, "ecr_repository_creation_template") ? local.aws.ecr_repository_creation_template : null
  description = "Elastic Container Registry"
}

output "ecr_repository_policy" {
  value       = contains(var.resource_types, "ecr_repository_policy") ? local.aws.ecr_repository_policy : null
  description = "Elastic Container Registry"
}

output "ecrpublic_repository" {
  value       = contains(var.resource_types, "ecrpublic_repository") ? local.aws.ecrpublic_repository : null
  description = "ECR Public"
}

output "ecrpublic_repository_policy" {
  value       = contains(var.resource_types, "ecrpublic_repository_policy") ? local.aws.ecrpublic_repository_policy : null
  description = "ECR Public"
}

output "ecs_account_setting_default" {
  value       = contains(var.resource_types, "ecs_account_setting_default") ? local.aws.ecs_account_setting_default : null
  description = "Elastic Container"
}

output "ecs_capacity_provider" {
  value       = contains(var.resource_types, "ecs_capacity_provider") ? local.aws.ecs_capacity_provider : null
  description = "Elastic Container"
}

output "ecs_cluster" {
  value       = contains(var.resource_types, "ecs_cluster") ? local.aws.ecs_cluster : null
  description = "Elastic Container"
}

output "ecs_cluster_capacity_providers" {
  value       = contains(var.resource_types, "ecs_cluster_capacity_providers") ? local.aws.ecs_cluster_capacity_providers : null
  description = "Elastic Container"
}

output "ecs_service" {
  value       = contains(var.resource_types, "ecs_service") ? local.aws.ecs_service : null
  description = "Elastic Container"
}

output "ecs_tag" {
  value       = contains(var.resource_types, "ecs_tag") ? local.aws.ecs_tag : null
  description = "Elastic Container"
}

output "ecs_task_definition" {
  value       = contains(var.resource_types, "ecs_task_definition") ? local.aws.ecs_task_definition : null
  description = "Elastic Container"
}

output "ecs_task_set" {
  value       = contains(var.resource_types, "ecs_task_set") ? local.aws.ecs_task_set : null
  description = "Elastic Container"
}

output "efs_access_point" {
  value       = contains(var.resource_types, "efs_access_point") ? local.aws.efs_access_point : null
  description = "Elastic File System"
}

output "efs_backup_policy" {
  value       = contains(var.resource_types, "efs_backup_policy") ? local.aws.efs_backup_policy : null
  description = "Elastic File System"
}

output "efs_file_system" {
  value       = contains(var.resource_types, "efs_file_system") ? local.aws.efs_file_system : null
  description = "Elastic File System"
}

output "efs_file_system_policy" {
  value       = contains(var.resource_types, "efs_file_system_policy") ? local.aws.efs_file_system_policy : null
  description = "Elastic File System"
}

output "efs_mount_target" {
  value       = contains(var.resource_types, "efs_mount_target") ? local.aws.efs_mount_target : null
  description = "Elastic File System"
}

output "efs_replication_configuration" {
  value       = contains(var.resource_types, "efs_replication_configuration") ? local.aws.efs_replication_configuration : null
  description = "Elastic File System"
}

output "egress_only_internet_gateway" {
  value       = contains(var.resource_types, "egress_only_internet_gateway") ? local.aws.egress_only_internet_gateway : null
  description = "Virtual Private Cloud"
}

output "eip" {
  value       = contains(var.resource_types, "eip") ? local.aws.eip : null
  description = "Elastic Compute Cloud"
}

output "eip_association" {
  value       = contains(var.resource_types, "eip_association") ? local.aws.eip_association : null
  description = "Elastic Compute Cloud"
}

output "eip_domain_name" {
  value       = contains(var.resource_types, "eip_domain_name") ? local.aws.eip_domain_name : null
  description = "Elastic Compute Cloud"
}

output "eks_access_entry" {
  value       = contains(var.resource_types, "eks_access_entry") ? local.aws.eks_access_entry : null
  description = "Elastic Kubernetes"
}

output "eks_access_policy_association" {
  value       = contains(var.resource_types, "eks_access_policy_association") ? local.aws.eks_access_policy_association : null
  description = "Elastic Kubernetes"
}

output "eks_addon" {
  value       = contains(var.resource_types, "eks_addon") ? local.aws.eks_addon : null
  description = "Elastic Kubernetes"
}

output "eks_cluster" {
  value       = contains(var.resource_types, "eks_cluster") ? local.aws.eks_cluster : null
  description = "Elastic Kubernetes"
}

output "eks_fargate_profile" {
  value       = contains(var.resource_types, "eks_fargate_profile") ? local.aws.eks_fargate_profile : null
  description = "Elastic Kubernetes"
}

output "eks_identity_provider_config" {
  value       = contains(var.resource_types, "eks_identity_provider_config") ? local.aws.eks_identity_provider_config : null
  description = "Elastic Kubernetes"
}

output "eks_node_group" {
  value       = contains(var.resource_types, "eks_node_group") ? local.aws.eks_node_group : null
  description = "Elastic Kubernetes"
}

output "eks_pod_identity_association" {
  value       = contains(var.resource_types, "eks_pod_identity_association") ? local.aws.eks_pod_identity_association : null
  description = "Elastic Kubernetes"
}

output "elastic_beanstalk_application" {
  value       = contains(var.resource_types, "elastic_beanstalk_application") ? local.aws.elastic_beanstalk_application : null
  description = "Elastic Beanstalk"
}

output "elastic_beanstalk_application_version" {
  value       = contains(var.resource_types, "elastic_beanstalk_application_version") ? local.aws.elastic_beanstalk_application_version : null
  description = "Elastic Beanstalk"
}

output "elastic_beanstalk_configuration_template" {
  value       = contains(var.resource_types, "elastic_beanstalk_configuration_template") ? local.aws.elastic_beanstalk_configuration_template : null
  description = "Elastic Beanstalk"
}

output "elastic_beanstalk_environment" {
  value       = contains(var.resource_types, "elastic_beanstalk_environment") ? local.aws.elastic_beanstalk_environment : null
  description = "Elastic Beanstalk"
}

output "elasticache_cluster" {
  value       = contains(var.resource_types, "elasticache_cluster") ? local.aws.elasticache_cluster : null
  description = "ElastiCache"
}

output "elasticache_global_replication_group" {
  value       = contains(var.resource_types, "elasticache_global_replication_group") ? local.aws.elasticache_global_replication_group : null
  description = "ElastiCache"
}

output "elasticache_parameter_group" {
  value       = contains(var.resource_types, "elasticache_parameter_group") ? local.aws.elasticache_parameter_group : null
  description = "ElastiCache"
}

output "elasticache_replication_group" {
  value       = contains(var.resource_types, "elasticache_replication_group") ? local.aws.elasticache_replication_group : null
  description = "ElastiCache"
}

output "elasticache_reserved_cache_node" {
  value       = contains(var.resource_types, "elasticache_reserved_cache_node") ? local.aws.elasticache_reserved_cache_node : null
  description = "ElastiCache"
}

output "elasticache_serverless_cache" {
  value       = contains(var.resource_types, "elasticache_serverless_cache") ? local.aws.elasticache_serverless_cache : null
  description = "ElastiCache"
}

output "elasticache_subnet_group" {
  value       = contains(var.resource_types, "elasticache_subnet_group") ? local.aws.elasticache_subnet_group : null
  description = "ElastiCache"
}

output "elasticache_user" {
  value       = contains(var.resource_types, "elasticache_user") ? local.aws.elasticache_user : null
  description = "ElastiCache"
}

output "elasticache_user_group" {
  value       = contains(var.resource_types, "elasticache_user_group") ? local.aws.elasticache_user_group : null
  description = "ElastiCache"
}

output "elasticache_user_group_association" {
  value       = contains(var.resource_types, "elasticache_user_group_association") ? local.aws.elasticache_user_group_association : null
  description = "ElastiCache"
}

output "elasticsearch_domain" {
  value       = contains(var.resource_types, "elasticsearch_domain") ? local.aws.elasticsearch_domain : null
  description = "Elasticsearch"
}

output "elasticsearch_domain_policy" {
  value       = contains(var.resource_types, "elasticsearch_domain_policy") ? local.aws.elasticsearch_domain_policy : null
  description = "Elasticsearch"
}

output "elasticsearch_domain_saml_options" {
  value       = contains(var.resource_types, "elasticsearch_domain_saml_options") ? local.aws.elasticsearch_domain_saml_options : null
  description = "Elasticsearch"
}

output "elasticsearch_vpc_endpoint" {
  value       = contains(var.resource_types, "elasticsearch_vpc_endpoint") ? local.aws.elasticsearch_vpc_endpoint : null
  description = "Elasticsearch"
}

output "elastictranscoder_pipeline" {
  value       = contains(var.resource_types, "elastictranscoder_pipeline") ? local.aws.elastictranscoder_pipeline : null
  description = "Elastic Transcoder"
}

output "elastictranscoder_preset" {
  value       = contains(var.resource_types, "elastictranscoder_preset") ? local.aws.elastictranscoder_preset : null
  description = "Elastic Transcoder"
}

output "elb" {
  value       = contains(var.resource_types, "elb") ? local.aws.elb : null
  description = "ELB Classic"
}

output "elb_attachment" {
  value       = contains(var.resource_types, "elb_attachment") ? local.aws.elb_attachment : null
  description = "ELB Classic"
}

output "emr_block_public_access_configuration" {
  value       = contains(var.resource_types, "emr_block_public_access_configuration") ? local.aws.emr_block_public_access_configuration : null
  description = "EMR"
}

output "emr_cluster" {
  value       = contains(var.resource_types, "emr_cluster") ? local.aws.emr_cluster : null
  description = "EMR"
}

output "emr_instance_fleet" {
  value       = contains(var.resource_types, "emr_instance_fleet") ? local.aws.emr_instance_fleet : null
  description = "EMR"
}

output "emr_instance_group" {
  value       = contains(var.resource_types, "emr_instance_group") ? local.aws.emr_instance_group : null
  description = "EMR"
}

output "emr_managed_scaling_policy" {
  value       = contains(var.resource_types, "emr_managed_scaling_policy") ? local.aws.emr_managed_scaling_policy : null
  description = "EMR"
}

output "emr_security_configuration" {
  value       = contains(var.resource_types, "emr_security_configuration") ? local.aws.emr_security_configuration : null
  description = "EMR"
}

output "emr_studio" {
  value       = contains(var.resource_types, "emr_studio") ? local.aws.emr_studio : null
  description = "EMR"
}

output "emr_studio_session_mapping" {
  value       = contains(var.resource_types, "emr_studio_session_mapping") ? local.aws.emr_studio_session_mapping : null
  description = "EMR"
}

output "emrcontainers_job_template" {
  value       = contains(var.resource_types, "emrcontainers_job_template") ? local.aws.emrcontainers_job_template : null
  description = "EMR Containers"
}

output "emrcontainers_virtual_cluster" {
  value       = contains(var.resource_types, "emrcontainers_virtual_cluster") ? local.aws.emrcontainers_virtual_cluster : null
  description = "EMR Containers"
}

output "emrserverless_application" {
  value       = contains(var.resource_types, "emrserverless_application") ? local.aws.emrserverless_application : null
  description = "EMR Serverless"
}

output "evidently_feature" {
  value       = contains(var.resource_types, "evidently_feature") ? local.aws.evidently_feature : null
  description = "CloudWatch Evidently"
}

output "evidently_launch" {
  value       = contains(var.resource_types, "evidently_launch") ? local.aws.evidently_launch : null
  description = "CloudWatch Evidently"
}

output "evidently_project" {
  value       = contains(var.resource_types, "evidently_project") ? local.aws.evidently_project : null
  description = "CloudWatch Evidently"
}

output "evidently_segment" {
  value       = contains(var.resource_types, "evidently_segment") ? local.aws.evidently_segment : null
  description = "CloudWatch Evidently"
}

output "finspace_kx_cluster" {
  value       = contains(var.resource_types, "finspace_kx_cluster") ? local.aws.finspace_kx_cluster : null
  description = "FinSpace"
}

output "finspace_kx_database" {
  value       = contains(var.resource_types, "finspace_kx_database") ? local.aws.finspace_kx_database : null
  description = "FinSpace"
}

output "finspace_kx_dataview" {
  value       = contains(var.resource_types, "finspace_kx_dataview") ? local.aws.finspace_kx_dataview : null
  description = "FinSpace"
}

output "finspace_kx_environment" {
  value       = contains(var.resource_types, "finspace_kx_environment") ? local.aws.finspace_kx_environment : null
  description = "FinSpace"
}

output "finspace_kx_scaling_group" {
  value       = contains(var.resource_types, "finspace_kx_scaling_group") ? local.aws.finspace_kx_scaling_group : null
  description = "FinSpace"
}

output "finspace_kx_user" {
  value       = contains(var.resource_types, "finspace_kx_user") ? local.aws.finspace_kx_user : null
  description = "FinSpace"
}

output "finspace_kx_volume" {
  value       = contains(var.resource_types, "finspace_kx_volume") ? local.aws.finspace_kx_volume : null
  description = "FinSpace"
}

output "fis_experiment_template" {
  value       = contains(var.resource_types, "fis_experiment_template") ? local.aws.fis_experiment_template : null
  description = "Fault Injection Simulator"
}

output "flow_log" {
  value       = contains(var.resource_types, "flow_log") ? local.aws.flow_log : null
  description = "Virtual Private Cloud"
}

output "fms_admin_account" {
  value       = contains(var.resource_types, "fms_admin_account") ? local.aws.fms_admin_account : null
  description = "Firewall Manager"
}

output "fms_policy" {
  value       = contains(var.resource_types, "fms_policy") ? local.aws.fms_policy : null
  description = "Firewall Manager"
}

output "fms_resource_set" {
  value       = contains(var.resource_types, "fms_resource_set") ? local.aws.fms_resource_set : null
  description = "Firewall Manager"
}

output "fsx_backup" {
  value       = contains(var.resource_types, "fsx_backup") ? local.aws.fsx_backup : null
  description = "FSx"
}

output "fsx_data_repository_association" {
  value       = contains(var.resource_types, "fsx_data_repository_association") ? local.aws.fsx_data_repository_association : null
  description = "FSx"
}

output "fsx_file_cache" {
  value       = contains(var.resource_types, "fsx_file_cache") ? local.aws.fsx_file_cache : null
  description = "FSx"
}

output "fsx_lustre_file_system" {
  value       = contains(var.resource_types, "fsx_lustre_file_system") ? local.aws.fsx_lustre_file_system : null
  description = "FSx"
}

output "fsx_ontap_file_system" {
  value       = contains(var.resource_types, "fsx_ontap_file_system") ? local.aws.fsx_ontap_file_system : null
  description = "FSx"
}

output "fsx_ontap_storage_virtual_machine" {
  value       = contains(var.resource_types, "fsx_ontap_storage_virtual_machine") ? local.aws.fsx_ontap_storage_virtual_machine : null
  description = "FSx"
}

output "fsx_ontap_volume" {
  value       = contains(var.resource_types, "fsx_ontap_volume") ? local.aws.fsx_ontap_volume : null
  description = "FSx"
}

output "fsx_openzfs_file_system" {
  value       = contains(var.resource_types, "fsx_openzfs_file_system") ? local.aws.fsx_openzfs_file_system : null
  description = "FSx"
}

output "fsx_openzfs_snapshot" {
  value       = contains(var.resource_types, "fsx_openzfs_snapshot") ? local.aws.fsx_openzfs_snapshot : null
  description = "FSx"
}

output "fsx_openzfs_volume" {
  value       = contains(var.resource_types, "fsx_openzfs_volume") ? local.aws.fsx_openzfs_volume : null
  description = "FSx"
}

output "fsx_windows_file_system" {
  value       = contains(var.resource_types, "fsx_windows_file_system") ? local.aws.fsx_windows_file_system : null
  description = "FSx"
}

output "gamelift_alias" {
  value       = contains(var.resource_types, "gamelift_alias") ? local.aws.gamelift_alias : null
  description = "GameLift"
}

output "gamelift_build" {
  value       = contains(var.resource_types, "gamelift_build") ? local.aws.gamelift_build : null
  description = "GameLift"
}

output "gamelift_fleet" {
  value       = contains(var.resource_types, "gamelift_fleet") ? local.aws.gamelift_fleet : null
  description = "GameLift"
}

output "gamelift_game_server_group" {
  value       = contains(var.resource_types, "gamelift_game_server_group") ? local.aws.gamelift_game_server_group : null
  description = "GameLift"
}

output "gamelift_game_session_queue" {
  value       = contains(var.resource_types, "gamelift_game_session_queue") ? local.aws.gamelift_game_session_queue : null
  description = "GameLift"
}

output "gamelift_script" {
  value       = contains(var.resource_types, "gamelift_script") ? local.aws.gamelift_script : null
  description = "GameLift"
}

output "glacier_vault" {
  value       = contains(var.resource_types, "glacier_vault") ? local.aws.glacier_vault : null
  description = "S3 Glacier"
}

output "glacier_vault_lock" {
  value       = contains(var.resource_types, "glacier_vault_lock") ? local.aws.glacier_vault_lock : null
  description = "S3 Glacier"
}

output "globalaccelerator_accelerator" {
  value       = contains(var.resource_types, "globalaccelerator_accelerator") ? local.aws.globalaccelerator_accelerator : null
  description = "Global Accelerator"
}

output "globalaccelerator_cross_account_attachment" {
  value       = contains(var.resource_types, "globalaccelerator_cross_account_attachment") ? local.aws.globalaccelerator_cross_account_attachment : null
  description = "Global Accelerator"
}

output "globalaccelerator_custom_routing_accelerator" {
  value       = contains(var.resource_types, "globalaccelerator_custom_routing_accelerator") ? local.aws.globalaccelerator_custom_routing_accelerator : null
  description = "Global Accelerator"
}

output "globalaccelerator_custom_routing_endpoint_group" {
  value       = contains(var.resource_types, "globalaccelerator_custom_routing_endpoint_group") ? local.aws.globalaccelerator_custom_routing_endpoint_group : null
  description = "Global Accelerator"
}

output "globalaccelerator_custom_routing_listener" {
  value       = contains(var.resource_types, "globalaccelerator_custom_routing_listener") ? local.aws.globalaccelerator_custom_routing_listener : null
  description = "Global Accelerator"
}

output "globalaccelerator_endpoint_group" {
  value       = contains(var.resource_types, "globalaccelerator_endpoint_group") ? local.aws.globalaccelerator_endpoint_group : null
  description = "Global Accelerator"
}

output "globalaccelerator_listener" {
  value       = contains(var.resource_types, "globalaccelerator_listener") ? local.aws.globalaccelerator_listener : null
  description = "Global Accelerator"
}

output "glue_catalog_database" {
  value       = contains(var.resource_types, "glue_catalog_database") ? local.aws.glue_catalog_database : null
  description = "Glue"
}

output "glue_catalog_table" {
  value       = contains(var.resource_types, "glue_catalog_table") ? local.aws.glue_catalog_table : null
  description = "Glue"
}

output "glue_catalog_table_optimizer" {
  value       = contains(var.resource_types, "glue_catalog_table_optimizer") ? local.aws.glue_catalog_table_optimizer : null
  description = "Glue"
}

output "glue_classifier" {
  value       = contains(var.resource_types, "glue_classifier") ? local.aws.glue_classifier : null
  description = "Glue"
}

output "glue_connection" {
  value       = contains(var.resource_types, "glue_connection") ? local.aws.glue_connection : null
  description = "Glue"
}

output "glue_crawler" {
  value       = contains(var.resource_types, "glue_crawler") ? local.aws.glue_crawler : null
  description = "Glue"
}

output "glue_data_catalog_encryption_settings" {
  value       = contains(var.resource_types, "glue_data_catalog_encryption_settings") ? local.aws.glue_data_catalog_encryption_settings : null
  description = "Glue"
}

output "glue_data_quality_ruleset" {
  value       = contains(var.resource_types, "glue_data_quality_ruleset") ? local.aws.glue_data_quality_ruleset : null
  description = "Glue"
}

output "glue_dev_endpoint" {
  value       = contains(var.resource_types, "glue_dev_endpoint") ? local.aws.glue_dev_endpoint : null
  description = "Glue"
}

output "glue_job" {
  value       = contains(var.resource_types, "glue_job") ? local.aws.glue_job : null
  description = "Glue"
}

output "glue_ml_transform" {
  value       = contains(var.resource_types, "glue_ml_transform") ? local.aws.glue_ml_transform : null
  description = "Glue"
}

output "glue_partition" {
  value       = contains(var.resource_types, "glue_partition") ? local.aws.glue_partition : null
  description = "Glue"
}

output "glue_partition_index" {
  value       = contains(var.resource_types, "glue_partition_index") ? local.aws.glue_partition_index : null
  description = "Glue"
}

output "glue_registry" {
  value       = contains(var.resource_types, "glue_registry") ? local.aws.glue_registry : null
  description = "Glue"
}

output "glue_resource_policy" {
  value       = contains(var.resource_types, "glue_resource_policy") ? local.aws.glue_resource_policy : null
  description = "Glue"
}

output "glue_schema" {
  value       = contains(var.resource_types, "glue_schema") ? local.aws.glue_schema : null
  description = "Glue"
}

output "glue_security_configuration" {
  value       = contains(var.resource_types, "glue_security_configuration") ? local.aws.glue_security_configuration : null
  description = "Glue"
}

output "glue_trigger" {
  value       = contains(var.resource_types, "glue_trigger") ? local.aws.glue_trigger : null
  description = "Glue"
}

output "glue_user_defined_function" {
  value       = contains(var.resource_types, "glue_user_defined_function") ? local.aws.glue_user_defined_function : null
  description = "Glue"
}

output "glue_workflow" {
  value       = contains(var.resource_types, "glue_workflow") ? local.aws.glue_workflow : null
  description = "Glue"
}

output "grafana_license_association" {
  value       = contains(var.resource_types, "grafana_license_association") ? local.aws.grafana_license_association : null
  description = "Managed Grafana"
}

output "grafana_role_association" {
  value       = contains(var.resource_types, "grafana_role_association") ? local.aws.grafana_role_association : null
  description = "Managed Grafana"
}

output "grafana_workspace" {
  value       = contains(var.resource_types, "grafana_workspace") ? local.aws.grafana_workspace : null
  description = "Managed Grafana"
}

output "grafana_workspace_api_key" {
  value       = contains(var.resource_types, "grafana_workspace_api_key") ? local.aws.grafana_workspace_api_key : null
  description = "Managed Grafana"
}

output "grafana_workspace_saml_configuration" {
  value       = contains(var.resource_types, "grafana_workspace_saml_configuration") ? local.aws.grafana_workspace_saml_configuration : null
  description = "Managed Grafana"
}

output "grafana_workspace_service_account" {
  value       = contains(var.resource_types, "grafana_workspace_service_account") ? local.aws.grafana_workspace_service_account : null
  description = "Managed Grafana"
}

output "grafana_workspace_service_account_token" {
  value       = contains(var.resource_types, "grafana_workspace_service_account_token") ? local.aws.grafana_workspace_service_account_token : null
  description = "Managed Grafana"
}

output "guardduty_detector" {
  value       = contains(var.resource_types, "guardduty_detector") ? local.aws.guardduty_detector : null
  description = "GuardDuty"
}

output "guardduty_detector_feature" {
  value       = contains(var.resource_types, "guardduty_detector_feature") ? local.aws.guardduty_detector_feature : null
  description = "GuardDuty"
}

output "guardduty_filter" {
  value       = contains(var.resource_types, "guardduty_filter") ? local.aws.guardduty_filter : null
  description = "GuardDuty"
}

output "guardduty_invite_accepter" {
  value       = contains(var.resource_types, "guardduty_invite_accepter") ? local.aws.guardduty_invite_accepter : null
  description = "GuardDuty"
}

output "guardduty_ipset" {
  value       = contains(var.resource_types, "guardduty_ipset") ? local.aws.guardduty_ipset : null
  description = "GuardDuty"
}

output "guardduty_malware_protection_plan" {
  value       = contains(var.resource_types, "guardduty_malware_protection_plan") ? local.aws.guardduty_malware_protection_plan : null
  description = "GuardDuty"
}

output "guardduty_member" {
  value       = contains(var.resource_types, "guardduty_member") ? local.aws.guardduty_member : null
  description = "GuardDuty"
}

output "guardduty_member_detector_feature" {
  value       = contains(var.resource_types, "guardduty_member_detector_feature") ? local.aws.guardduty_member_detector_feature : null
  description = "GuardDuty"
}

output "guardduty_organization_admin_account" {
  value       = contains(var.resource_types, "guardduty_organization_admin_account") ? local.aws.guardduty_organization_admin_account : null
  description = "GuardDuty"
}

output "guardduty_organization_configuration" {
  value       = contains(var.resource_types, "guardduty_organization_configuration") ? local.aws.guardduty_organization_configuration : null
  description = "GuardDuty"
}

output "guardduty_organization_configuration_feature" {
  value       = contains(var.resource_types, "guardduty_organization_configuration_feature") ? local.aws.guardduty_organization_configuration_feature : null
  description = "GuardDuty"
}

output "guardduty_publishing_destination" {
  value       = contains(var.resource_types, "guardduty_publishing_destination") ? local.aws.guardduty_publishing_destination : null
  description = "GuardDuty"
}

output "guardduty_threatintelset" {
  value       = contains(var.resource_types, "guardduty_threatintelset") ? local.aws.guardduty_threatintelset : null
  description = "GuardDuty"
}

output "iam_access_key" {
  value       = contains(var.resource_types, "iam_access_key") ? local.aws.iam_access_key : null
  description = "Identity & Access Management"
}

output "iam_account_alias" {
  value       = contains(var.resource_types, "iam_account_alias") ? local.aws.iam_account_alias : null
  description = "Identity & Access Management"
}

output "iam_account_password_policy" {
  value       = contains(var.resource_types, "iam_account_password_policy") ? local.aws.iam_account_password_policy : null
  description = "Identity & Access Management"
}

output "iam_group" {
  value       = contains(var.resource_types, "iam_group") ? local.aws.iam_group : null
  description = "Identity & Access Management"
}

output "iam_group_membership" {
  value       = contains(var.resource_types, "iam_group_membership") ? local.aws.iam_group_membership : null
  description = "Identity & Access Management"
}

output "iam_group_policies_exclusive" {
  value       = contains(var.resource_types, "iam_group_policies_exclusive") ? local.aws.iam_group_policies_exclusive : null
  description = "Identity & Access Management"
}

output "iam_group_policy" {
  value       = contains(var.resource_types, "iam_group_policy") ? local.aws.iam_group_policy : null
  description = "Identity & Access Management"
}

output "iam_group_policy_attachment" {
  value       = contains(var.resource_types, "iam_group_policy_attachment") ? local.aws.iam_group_policy_attachment : null
  description = "Identity & Access Management"
}

output "iam_group_policy_attachments_exclusive" {
  value       = contains(var.resource_types, "iam_group_policy_attachments_exclusive") ? local.aws.iam_group_policy_attachments_exclusive : null
  description = "Identity & Access Management"
}

output "iam_instance_profile" {
  value       = contains(var.resource_types, "iam_instance_profile") ? local.aws.iam_instance_profile : null
  description = "Identity & Access Management"
}

output "iam_openid_connect_provider" {
  value       = contains(var.resource_types, "iam_openid_connect_provider") ? local.aws.iam_openid_connect_provider : null
  description = "Identity & Access Management"
}

output "iam_organizations_features" {
  value       = contains(var.resource_types, "iam_organizations_features") ? local.aws.iam_organizations_features : null
  description = "Identity & Access Management"
}

output "iam_policy" {
  value       = contains(var.resource_types, "iam_policy") ? local.aws.iam_policy : null
  description = "Identity & Access Management"
}

output "iam_policy_attachment" {
  value       = contains(var.resource_types, "iam_policy_attachment") ? local.aws.iam_policy_attachment : null
  description = "Identity & Access Management"
}

output "iam_role" {
  value       = contains(var.resource_types, "iam_role") ? local.aws.iam_role : null
  description = "Identity & Access Management"
}

output "iam_role_policies_exclusive" {
  value       = contains(var.resource_types, "iam_role_policies_exclusive") ? local.aws.iam_role_policies_exclusive : null
  description = "Identity & Access Management"
}

output "iam_role_policy" {
  value       = contains(var.resource_types, "iam_role_policy") ? local.aws.iam_role_policy : null
  description = "Identity & Access Management"
}

output "iam_role_policy_attachment" {
  value       = contains(var.resource_types, "iam_role_policy_attachment") ? local.aws.iam_role_policy_attachment : null
  description = "Identity & Access Management"
}

output "iam_role_policy_attachments_exclusive" {
  value       = contains(var.resource_types, "iam_role_policy_attachments_exclusive") ? local.aws.iam_role_policy_attachments_exclusive : null
  description = "Identity & Access Management"
}

output "iam_saml_provider" {
  value       = contains(var.resource_types, "iam_saml_provider") ? local.aws.iam_saml_provider : null
  description = "Identity & Access Management"
}

output "iam_security_token_service_preferences" {
  value       = contains(var.resource_types, "iam_security_token_service_preferences") ? local.aws.iam_security_token_service_preferences : null
  description = "Identity & Access Management"
}

output "iam_server_certificate" {
  value       = contains(var.resource_types, "iam_server_certificate") ? local.aws.iam_server_certificate : null
  description = "Identity & Access Management"
}

output "iam_service_linked_role" {
  value       = contains(var.resource_types, "iam_service_linked_role") ? local.aws.iam_service_linked_role : null
  description = "Identity & Access Management"
}

output "iam_service_specific_credential" {
  value       = contains(var.resource_types, "iam_service_specific_credential") ? local.aws.iam_service_specific_credential : null
  description = "Identity & Access Management"
}

output "iam_signing_certificate" {
  value       = contains(var.resource_types, "iam_signing_certificate") ? local.aws.iam_signing_certificate : null
  description = "Identity & Access Management"
}

output "iam_user" {
  value       = contains(var.resource_types, "iam_user") ? local.aws.iam_user : null
  description = "Identity & Access Management"
}

output "iam_user_group_membership" {
  value       = contains(var.resource_types, "iam_user_group_membership") ? local.aws.iam_user_group_membership : null
  description = "Identity & Access Management"
}

output "iam_user_login_profile" {
  value       = contains(var.resource_types, "iam_user_login_profile") ? local.aws.iam_user_login_profile : null
  description = "Identity & Access Management"
}

output "iam_user_policies_exclusive" {
  value       = contains(var.resource_types, "iam_user_policies_exclusive") ? local.aws.iam_user_policies_exclusive : null
  description = "Identity & Access Management"
}

output "iam_user_policy" {
  value       = contains(var.resource_types, "iam_user_policy") ? local.aws.iam_user_policy : null
  description = "Identity & Access Management"
}

output "iam_user_policy_attachment" {
  value       = contains(var.resource_types, "iam_user_policy_attachment") ? local.aws.iam_user_policy_attachment : null
  description = "Identity & Access Management"
}

output "iam_user_policy_attachments_exclusive" {
  value       = contains(var.resource_types, "iam_user_policy_attachments_exclusive") ? local.aws.iam_user_policy_attachments_exclusive : null
  description = "Identity & Access Management"
}

output "iam_user_ssh_key" {
  value       = contains(var.resource_types, "iam_user_ssh_key") ? local.aws.iam_user_ssh_key : null
  description = "Identity & Access Management"
}

output "iam_virtual_mfa_device" {
  value       = contains(var.resource_types, "iam_virtual_mfa_device") ? local.aws.iam_virtual_mfa_device : null
  description = "Identity & Access Management"
}

output "identitystore_group" {
  value       = contains(var.resource_types, "identitystore_group") ? local.aws.identitystore_group : null
  description = "SSO Identity Store"
}

output "identitystore_group_membership" {
  value       = contains(var.resource_types, "identitystore_group_membership") ? local.aws.identitystore_group_membership : null
  description = "SSO Identity Store"
}

output "identitystore_user" {
  value       = contains(var.resource_types, "identitystore_user") ? local.aws.identitystore_user : null
  description = "SSO Identity Store"
}

output "imagebuilder_component" {
  value       = contains(var.resource_types, "imagebuilder_component") ? local.aws.imagebuilder_component : null
  description = "EC2 Image Builder"
}

output "imagebuilder_container_recipe" {
  value       = contains(var.resource_types, "imagebuilder_container_recipe") ? local.aws.imagebuilder_container_recipe : null
  description = "EC2 Image Builder"
}

output "imagebuilder_distribution_configuration" {
  value       = contains(var.resource_types, "imagebuilder_distribution_configuration") ? local.aws.imagebuilder_distribution_configuration : null
  description = "EC2 Image Builder"
}

output "imagebuilder_image" {
  value       = contains(var.resource_types, "imagebuilder_image") ? local.aws.imagebuilder_image : null
  description = "EC2 Image Builder"
}

output "imagebuilder_image_pipeline" {
  value       = contains(var.resource_types, "imagebuilder_image_pipeline") ? local.aws.imagebuilder_image_pipeline : null
  description = "EC2 Image Builder"
}

output "imagebuilder_image_recipe" {
  value       = contains(var.resource_types, "imagebuilder_image_recipe") ? local.aws.imagebuilder_image_recipe : null
  description = "EC2 Image Builder"
}

output "imagebuilder_infrastructure_configuration" {
  value       = contains(var.resource_types, "imagebuilder_infrastructure_configuration") ? local.aws.imagebuilder_infrastructure_configuration : null
  description = "EC2 Image Builder"
}

output "imagebuilder_lifecycle_policy" {
  value       = contains(var.resource_types, "imagebuilder_lifecycle_policy") ? local.aws.imagebuilder_lifecycle_policy : null
  description = "EC2 Image Builder"
}

output "imagebuilder_workflow" {
  value       = contains(var.resource_types, "imagebuilder_workflow") ? local.aws.imagebuilder_workflow : null
  description = "EC2 Image Builder"
}

output "inspector2_delegated_admin_account" {
  value       = contains(var.resource_types, "inspector2_delegated_admin_account") ? local.aws.inspector2_delegated_admin_account : null
  description = "Inspector"
}

output "inspector2_enabler" {
  value       = contains(var.resource_types, "inspector2_enabler") ? local.aws.inspector2_enabler : null
  description = "Inspector"
}

output "inspector2_member_association" {
  value       = contains(var.resource_types, "inspector2_member_association") ? local.aws.inspector2_member_association : null
  description = "Inspector"
}

output "inspector2_organization_configuration" {
  value       = contains(var.resource_types, "inspector2_organization_configuration") ? local.aws.inspector2_organization_configuration : null
  description = "Inspector"
}

output "inspector_assessment_target" {
  value       = contains(var.resource_types, "inspector_assessment_target") ? local.aws.inspector_assessment_target : null
  description = "Inspector Classic"
}

output "inspector_assessment_template" {
  value       = contains(var.resource_types, "inspector_assessment_template") ? local.aws.inspector_assessment_template : null
  description = "Inspector Classic"
}

output "inspector_resource_group" {
  value       = contains(var.resource_types, "inspector_resource_group") ? local.aws.inspector_resource_group : null
  description = "Inspector Classic"
}

output "instance" {
  value       = contains(var.resource_types, "instance") ? local.aws.instance : null
  description = "Elastic Compute Cloud"
}

output "internet_gateway" {
  value       = contains(var.resource_types, "internet_gateway") ? local.aws.internet_gateway : null
  description = "Virtual Private Cloud"
}

output "internet_gateway_attachment" {
  value       = contains(var.resource_types, "internet_gateway_attachment") ? local.aws.internet_gateway_attachment : null
  description = "Virtual Private Cloud"
}

output "internetmonitor_monitor" {
  value       = contains(var.resource_types, "internetmonitor_monitor") ? local.aws.internetmonitor_monitor : null
  description = "CloudWatch Internet Monitor"
}

output "iot_authorizer" {
  value       = contains(var.resource_types, "iot_authorizer") ? local.aws.iot_authorizer : null
  description = "IoT Core"
}

output "iot_billing_group" {
  value       = contains(var.resource_types, "iot_billing_group") ? local.aws.iot_billing_group : null
  description = "IoT Core"
}

output "iot_ca_certificate" {
  value       = contains(var.resource_types, "iot_ca_certificate") ? local.aws.iot_ca_certificate : null
  description = "IoT Core"
}

output "iot_certificate" {
  value       = contains(var.resource_types, "iot_certificate") ? local.aws.iot_certificate : null
  description = "IoT Core"
}

output "iot_domain_configuration" {
  value       = contains(var.resource_types, "iot_domain_configuration") ? local.aws.iot_domain_configuration : null
  description = "IoT Core"
}

output "iot_event_configurations" {
  value       = contains(var.resource_types, "iot_event_configurations") ? local.aws.iot_event_configurations : null
  description = "IoT Core"
}

output "iot_indexing_configuration" {
  value       = contains(var.resource_types, "iot_indexing_configuration") ? local.aws.iot_indexing_configuration : null
  description = "IoT Core"
}

output "iot_logging_options" {
  value       = contains(var.resource_types, "iot_logging_options") ? local.aws.iot_logging_options : null
  description = "IoT Core"
}

output "iot_policy" {
  value       = contains(var.resource_types, "iot_policy") ? local.aws.iot_policy : null
  description = "IoT Core"
}

output "iot_policy_attachment" {
  value       = contains(var.resource_types, "iot_policy_attachment") ? local.aws.iot_policy_attachment : null
  description = "IoT Core"
}

output "iot_provisioning_template" {
  value       = contains(var.resource_types, "iot_provisioning_template") ? local.aws.iot_provisioning_template : null
  description = "IoT Core"
}

output "iot_role_alias" {
  value       = contains(var.resource_types, "iot_role_alias") ? local.aws.iot_role_alias : null
  description = "IoT Core"
}

output "iot_thing" {
  value       = contains(var.resource_types, "iot_thing") ? local.aws.iot_thing : null
  description = "IoT Core"
}

output "iot_thing_group" {
  value       = contains(var.resource_types, "iot_thing_group") ? local.aws.iot_thing_group : null
  description = "IoT Core"
}

output "iot_thing_group_membership" {
  value       = contains(var.resource_types, "iot_thing_group_membership") ? local.aws.iot_thing_group_membership : null
  description = "IoT Core"
}

output "iot_thing_principal_attachment" {
  value       = contains(var.resource_types, "iot_thing_principal_attachment") ? local.aws.iot_thing_principal_attachment : null
  description = "IoT Core"
}

output "iot_thing_type" {
  value       = contains(var.resource_types, "iot_thing_type") ? local.aws.iot_thing_type : null
  description = "IoT Core"
}

output "iot_topic_rule" {
  value       = contains(var.resource_types, "iot_topic_rule") ? local.aws.iot_topic_rule : null
  description = "IoT Core"
}

output "iot_topic_rule_destination" {
  value       = contains(var.resource_types, "iot_topic_rule_destination") ? local.aws.iot_topic_rule_destination : null
  description = "IoT Core"
}

output "ivs_channel" {
  value       = contains(var.resource_types, "ivs_channel") ? local.aws.ivs_channel : null
  description = "Interactive Video"
}

output "ivs_playback_key_pair" {
  value       = contains(var.resource_types, "ivs_playback_key_pair") ? local.aws.ivs_playback_key_pair : null
  description = "Interactive Video"
}

output "ivs_recording_configuration" {
  value       = contains(var.resource_types, "ivs_recording_configuration") ? local.aws.ivs_recording_configuration : null
  description = "Interactive Video"
}

output "ivschat_logging_configuration" {
  value       = contains(var.resource_types, "ivschat_logging_configuration") ? local.aws.ivschat_logging_configuration : null
  description = "Interactive Video"
}

output "ivschat_room" {
  value       = contains(var.resource_types, "ivschat_room") ? local.aws.ivschat_room : null
  description = "Interactive Video"
}

output "kendra_data_source" {
  value       = contains(var.resource_types, "kendra_data_source") ? local.aws.kendra_data_source : null
  description = "Kendra"
}

output "kendra_experience" {
  value       = contains(var.resource_types, "kendra_experience") ? local.aws.kendra_experience : null
  description = "Kendra"
}

output "kendra_faq" {
  value       = contains(var.resource_types, "kendra_faq") ? local.aws.kendra_faq : null
  description = "Kendra"
}

output "kendra_index" {
  value       = contains(var.resource_types, "kendra_index") ? local.aws.kendra_index : null
  description = "Kendra"
}

output "kendra_query_suggestions_block_list" {
  value       = contains(var.resource_types, "kendra_query_suggestions_block_list") ? local.aws.kendra_query_suggestions_block_list : null
  description = "Kendra"
}

output "kendra_thesaurus" {
  value       = contains(var.resource_types, "kendra_thesaurus") ? local.aws.kendra_thesaurus : null
  description = "Kendra"
}

output "key_pair" {
  value       = contains(var.resource_types, "key_pair") ? local.aws.key_pair : null
  description = "Elastic Compute Cloud"
}

output "keyspaces_keyspace" {
  value       = contains(var.resource_types, "keyspaces_keyspace") ? local.aws.keyspaces_keyspace : null
  description = "for Apache Cassandra"
}

output "keyspaces_table" {
  value       = contains(var.resource_types, "keyspaces_table") ? local.aws.keyspaces_table : null
  description = "for Apache Cassandra"
}

output "kinesis_analytics_application" {
  value       = contains(var.resource_types, "kinesis_analytics_application") ? local.aws.kinesis_analytics_application : null
  description = "Kinesis Analytics"
}

output "kinesis_firehose_delivery_stream" {
  value       = contains(var.resource_types, "kinesis_firehose_delivery_stream") ? local.aws.kinesis_firehose_delivery_stream : null
  description = "Kinesis Firehose"
}

output "kinesis_resource_policy" {
  value       = contains(var.resource_types, "kinesis_resource_policy") ? local.aws.kinesis_resource_policy : null
  description = "Kinesis"
}

output "kinesis_stream" {
  value       = contains(var.resource_types, "kinesis_stream") ? local.aws.kinesis_stream : null
  description = "Kinesis"
}

output "kinesis_stream_consumer" {
  value       = contains(var.resource_types, "kinesis_stream_consumer") ? local.aws.kinesis_stream_consumer : null
  description = "Kinesis"
}

output "kinesis_video_stream" {
  value       = contains(var.resource_types, "kinesis_video_stream") ? local.aws.kinesis_video_stream : null
  description = "Kinesis Video"
}

output "kinesisanalyticsv2_application" {
  value       = contains(var.resource_types, "kinesisanalyticsv2_application") ? local.aws.kinesisanalyticsv2_application : null
  description = "Kinesis Analytics V2"
}

output "kinesisanalyticsv2_application_snapshot" {
  value       = contains(var.resource_types, "kinesisanalyticsv2_application_snapshot") ? local.aws.kinesisanalyticsv2_application_snapshot : null
  description = "Kinesis Analytics V2"
}

output "kms_alias" {
  value       = contains(var.resource_types, "kms_alias") ? local.aws.kms_alias : null
  description = "Key Management"
}

output "kms_ciphertext" {
  value       = contains(var.resource_types, "kms_ciphertext") ? local.aws.kms_ciphertext : null
  description = "Key Management"
}

output "kms_custom_key_store" {
  value       = contains(var.resource_types, "kms_custom_key_store") ? local.aws.kms_custom_key_store : null
  description = "Key Management"
}

output "kms_external_key" {
  value       = contains(var.resource_types, "kms_external_key") ? local.aws.kms_external_key : null
  description = "Key Management"
}

output "kms_grant" {
  value       = contains(var.resource_types, "kms_grant") ? local.aws.kms_grant : null
  description = "Key Management"
}

output "kms_key" {
  value       = contains(var.resource_types, "kms_key") ? local.aws.kms_key : null
  description = "Key Management"
}

output "kms_key_policy" {
  value       = contains(var.resource_types, "kms_key_policy") ? local.aws.kms_key_policy : null
  description = "Key Management"
}

output "kms_replica_external_key" {
  value       = contains(var.resource_types, "kms_replica_external_key") ? local.aws.kms_replica_external_key : null
  description = "Key Management"
}

output "kms_replica_key" {
  value       = contains(var.resource_types, "kms_replica_key") ? local.aws.kms_replica_key : null
  description = "Key Management"
}

output "lakeformation_data_cells_filter" {
  value       = contains(var.resource_types, "lakeformation_data_cells_filter") ? local.aws.lakeformation_data_cells_filter : null
  description = "Lake Formation"
}

output "lakeformation_data_lake_settings" {
  value       = contains(var.resource_types, "lakeformation_data_lake_settings") ? local.aws.lakeformation_data_lake_settings : null
  description = "Lake Formation"
}

output "lakeformation_lf_tag" {
  value       = contains(var.resource_types, "lakeformation_lf_tag") ? local.aws.lakeformation_lf_tag : null
  description = "Lake Formation"
}

output "lakeformation_opt_in" {
  value       = contains(var.resource_types, "lakeformation_opt_in") ? local.aws.lakeformation_opt_in : null
  description = "Lake Formation"
}

output "lakeformation_permissions" {
  value       = contains(var.resource_types, "lakeformation_permissions") ? local.aws.lakeformation_permissions : null
  description = "Lake Formation"
}

output "lakeformation_resource" {
  value       = contains(var.resource_types, "lakeformation_resource") ? local.aws.lakeformation_resource : null
  description = "Lake Formation"
}

output "lakeformation_resource_lf_tag" {
  value       = contains(var.resource_types, "lakeformation_resource_lf_tag") ? local.aws.lakeformation_resource_lf_tag : null
  description = "Lake Formation"
}

output "lakeformation_resource_lf_tags" {
  value       = contains(var.resource_types, "lakeformation_resource_lf_tags") ? local.aws.lakeformation_resource_lf_tags : null
  description = "Lake Formation"
}

output "lambda_alias" {
  value       = contains(var.resource_types, "lambda_alias") ? local.aws.lambda_alias : null
  description = "Lambda"
}

output "lambda_code_signing_config" {
  value       = contains(var.resource_types, "lambda_code_signing_config") ? local.aws.lambda_code_signing_config : null
  description = "Lambda"
}

output "lambda_event_source_mapping" {
  value       = contains(var.resource_types, "lambda_event_source_mapping") ? local.aws.lambda_event_source_mapping : null
  description = "Lambda"
}

output "lambda_function" {
  value       = contains(var.resource_types, "lambda_function") ? local.aws.lambda_function : null
  description = "Lambda"
}

output "lambda_function_event_invoke_config" {
  value       = contains(var.resource_types, "lambda_function_event_invoke_config") ? local.aws.lambda_function_event_invoke_config : null
  description = "Lambda"
}

output "lambda_function_recursion_config" {
  value       = contains(var.resource_types, "lambda_function_recursion_config") ? local.aws.lambda_function_recursion_config : null
  description = "Lambda"
}

output "lambda_function_url" {
  value       = contains(var.resource_types, "lambda_function_url") ? local.aws.lambda_function_url : null
  description = "Lambda"
}

output "lambda_invocation" {
  value       = contains(var.resource_types, "lambda_invocation") ? local.aws.lambda_invocation : null
  description = "Lambda"
}

output "lambda_layer_version" {
  value       = contains(var.resource_types, "lambda_layer_version") ? local.aws.lambda_layer_version : null
  description = "Lambda"
}

output "lambda_layer_version_permission" {
  value       = contains(var.resource_types, "lambda_layer_version_permission") ? local.aws.lambda_layer_version_permission : null
  description = "Lambda"
}

output "lambda_permission" {
  value       = contains(var.resource_types, "lambda_permission") ? local.aws.lambda_permission : null
  description = "Lambda"
}

output "lambda_provisioned_concurrency_config" {
  value       = contains(var.resource_types, "lambda_provisioned_concurrency_config") ? local.aws.lambda_provisioned_concurrency_config : null
  description = "Lambda"
}

output "lambda_runtime_management_config" {
  value       = contains(var.resource_types, "lambda_runtime_management_config") ? local.aws.lambda_runtime_management_config : null
  description = "Lambda"
}

output "launch_configuration" {
  value       = contains(var.resource_types, "launch_configuration") ? local.aws.launch_configuration : null
  description = "Auto Scaling"
}

output "launch_template" {
  value       = contains(var.resource_types, "launch_template") ? local.aws.launch_template : null
  description = "Elastic Compute Cloud"
}

output "lb" {
  value       = contains(var.resource_types, "lb") ? local.aws.lb : null
  description = "Elastic Load Balancing"
}

output "lb_cookie_stickiness_policy" {
  value       = contains(var.resource_types, "lb_cookie_stickiness_policy") ? local.aws.lb_cookie_stickiness_policy : null
  description = "ELB Classic"
}

output "lb_listener" {
  value       = contains(var.resource_types, "lb_listener") ? local.aws.lb_listener : null
  description = "Elastic Load Balancing"
}

output "lb_listener_certificate" {
  value       = contains(var.resource_types, "lb_listener_certificate") ? local.aws.lb_listener_certificate : null
  description = "Elastic Load Balancing"
}

output "lb_listener_rule" {
  value       = contains(var.resource_types, "lb_listener_rule") ? local.aws.lb_listener_rule : null
  description = "Elastic Load Balancing"
}

output "lb_ssl_negotiation_policy" {
  value       = contains(var.resource_types, "lb_ssl_negotiation_policy") ? local.aws.lb_ssl_negotiation_policy : null
  description = "ELB Classic"
}

output "lb_target_group" {
  value       = contains(var.resource_types, "lb_target_group") ? local.aws.lb_target_group : null
  description = "Elastic Load Balancing"
}

output "lb_target_group_attachment" {
  value       = contains(var.resource_types, "lb_target_group_attachment") ? local.aws.lb_target_group_attachment : null
  description = "Elastic Load Balancing"
}

output "lb_trust_store" {
  value       = contains(var.resource_types, "lb_trust_store") ? local.aws.lb_trust_store : null
  description = "Elastic Load Balancing"
}

output "lb_trust_store_revocation" {
  value       = contains(var.resource_types, "lb_trust_store_revocation") ? local.aws.lb_trust_store_revocation : null
  description = "Elastic Load Balancing"
}

output "lex_bot" {
  value       = contains(var.resource_types, "lex_bot") ? local.aws.lex_bot : null
  description = "Lex Model Building"
}

output "lex_bot_alias" {
  value       = contains(var.resource_types, "lex_bot_alias") ? local.aws.lex_bot_alias : null
  description = "Lex Model Building"
}

output "lex_intent" {
  value       = contains(var.resource_types, "lex_intent") ? local.aws.lex_intent : null
  description = "Lex Model Building"
}

output "lex_slot_type" {
  value       = contains(var.resource_types, "lex_slot_type") ? local.aws.lex_slot_type : null
  description = "Lex Model Building"
}

output "lexv2models_bot" {
  value       = contains(var.resource_types, "lexv2models_bot") ? local.aws.lexv2models_bot : null
  description = "Lex V2 Models"
}

output "lexv2models_bot_locale" {
  value       = contains(var.resource_types, "lexv2models_bot_locale") ? local.aws.lexv2models_bot_locale : null
  description = "Lex V2 Models"
}

output "lexv2models_bot_version" {
  value       = contains(var.resource_types, "lexv2models_bot_version") ? local.aws.lexv2models_bot_version : null
  description = "Lex V2 Models"
}

output "lexv2models_intent" {
  value       = contains(var.resource_types, "lexv2models_intent") ? local.aws.lexv2models_intent : null
  description = "Lex V2 Models"
}

output "lexv2models_slot" {
  value       = contains(var.resource_types, "lexv2models_slot") ? local.aws.lexv2models_slot : null
  description = "Lex V2 Models"
}

output "lexv2models_slot_type" {
  value       = contains(var.resource_types, "lexv2models_slot_type") ? local.aws.lexv2models_slot_type : null
  description = "Lex V2 Models"
}

output "licensemanager_association" {
  value       = contains(var.resource_types, "licensemanager_association") ? local.aws.licensemanager_association : null
  description = "License Manager"
}

output "licensemanager_grant" {
  value       = contains(var.resource_types, "licensemanager_grant") ? local.aws.licensemanager_grant : null
  description = "License Manager"
}

output "licensemanager_grant_accepter" {
  value       = contains(var.resource_types, "licensemanager_grant_accepter") ? local.aws.licensemanager_grant_accepter : null
  description = "License Manager"
}

output "licensemanager_license_configuration" {
  value       = contains(var.resource_types, "licensemanager_license_configuration") ? local.aws.licensemanager_license_configuration : null
  description = "License Manager"
}

output "lightsail_bucket" {
  value       = contains(var.resource_types, "lightsail_bucket") ? local.aws.lightsail_bucket : null
  description = "Lightsail"
}

output "lightsail_bucket_access_key" {
  value       = contains(var.resource_types, "lightsail_bucket_access_key") ? local.aws.lightsail_bucket_access_key : null
  description = "Lightsail"
}

output "lightsail_bucket_resource_access" {
  value       = contains(var.resource_types, "lightsail_bucket_resource_access") ? local.aws.lightsail_bucket_resource_access : null
  description = "Lightsail"
}

output "lightsail_certificate" {
  value       = contains(var.resource_types, "lightsail_certificate") ? local.aws.lightsail_certificate : null
  description = "Lightsail"
}

output "lightsail_container_service" {
  value       = contains(var.resource_types, "lightsail_container_service") ? local.aws.lightsail_container_service : null
  description = "Lightsail"
}

output "lightsail_container_service_deployment_version" {
  value       = contains(var.resource_types, "lightsail_container_service_deployment_version") ? local.aws.lightsail_container_service_deployment_version : null
  description = "Lightsail"
}

output "lightsail_database" {
  value       = contains(var.resource_types, "lightsail_database") ? local.aws.lightsail_database : null
  description = "Lightsail"
}

output "lightsail_disk" {
  value       = contains(var.resource_types, "lightsail_disk") ? local.aws.lightsail_disk : null
  description = "Lightsail"
}

output "lightsail_disk_attachment" {
  value       = contains(var.resource_types, "lightsail_disk_attachment") ? local.aws.lightsail_disk_attachment : null
  description = "Lightsail"
}

output "lightsail_distribution" {
  value       = contains(var.resource_types, "lightsail_distribution") ? local.aws.lightsail_distribution : null
  description = "Lightsail"
}

output "lightsail_domain" {
  value       = contains(var.resource_types, "lightsail_domain") ? local.aws.lightsail_domain : null
  description = "Lightsail"
}

output "lightsail_domain_entry" {
  value       = contains(var.resource_types, "lightsail_domain_entry") ? local.aws.lightsail_domain_entry : null
  description = "Lightsail"
}

output "lightsail_instance" {
  value       = contains(var.resource_types, "lightsail_instance") ? local.aws.lightsail_instance : null
  description = "Lightsail"
}

output "lightsail_instance_public_ports" {
  value       = contains(var.resource_types, "lightsail_instance_public_ports") ? local.aws.lightsail_instance_public_ports : null
  description = "Lightsail"
}

output "lightsail_key_pair" {
  value       = contains(var.resource_types, "lightsail_key_pair") ? local.aws.lightsail_key_pair : null
  description = "Lightsail"
}

output "lightsail_lb" {
  value       = contains(var.resource_types, "lightsail_lb") ? local.aws.lightsail_lb : null
  description = "Lightsail"
}

output "lightsail_lb_attachment" {
  value       = contains(var.resource_types, "lightsail_lb_attachment") ? local.aws.lightsail_lb_attachment : null
  description = "Lightsail"
}

output "lightsail_lb_certificate" {
  value       = contains(var.resource_types, "lightsail_lb_certificate") ? local.aws.lightsail_lb_certificate : null
  description = "Lightsail"
}

output "lightsail_lb_certificate_attachment" {
  value       = contains(var.resource_types, "lightsail_lb_certificate_attachment") ? local.aws.lightsail_lb_certificate_attachment : null
  description = "Lightsail"
}

output "lightsail_lb_https_redirection_policy" {
  value       = contains(var.resource_types, "lightsail_lb_https_redirection_policy") ? local.aws.lightsail_lb_https_redirection_policy : null
  description = "Lightsail"
}

output "lightsail_lb_stickiness_policy" {
  value       = contains(var.resource_types, "lightsail_lb_stickiness_policy") ? local.aws.lightsail_lb_stickiness_policy : null
  description = "Lightsail"
}

output "lightsail_static_ip" {
  value       = contains(var.resource_types, "lightsail_static_ip") ? local.aws.lightsail_static_ip : null
  description = "Lightsail"
}

output "lightsail_static_ip_attachment" {
  value       = contains(var.resource_types, "lightsail_static_ip_attachment") ? local.aws.lightsail_static_ip_attachment : null
  description = "Lightsail"
}

output "load_balancer_backend_server_policy" {
  value       = contains(var.resource_types, "load_balancer_backend_server_policy") ? local.aws.load_balancer_backend_server_policy : null
  description = "ELB Classic"
}

output "load_balancer_listener_policy" {
  value       = contains(var.resource_types, "load_balancer_listener_policy") ? local.aws.load_balancer_listener_policy : null
  description = "ELB Classic"
}

output "load_balancer_policy" {
  value       = contains(var.resource_types, "load_balancer_policy") ? local.aws.load_balancer_policy : null
  description = "ELB Classic"
}

output "location_geofence_collection" {
  value       = contains(var.resource_types, "location_geofence_collection") ? local.aws.location_geofence_collection : null
  description = "Location"
}

output "location_map" {
  value       = contains(var.resource_types, "location_map") ? local.aws.location_map : null
  description = "Location"
}

output "location_place_index" {
  value       = contains(var.resource_types, "location_place_index") ? local.aws.location_place_index : null
  description = "Location"
}

output "location_route_calculator" {
  value       = contains(var.resource_types, "location_route_calculator") ? local.aws.location_route_calculator : null
  description = "Location"
}

output "location_tracker" {
  value       = contains(var.resource_types, "location_tracker") ? local.aws.location_tracker : null
  description = "Location"
}

output "location_tracker_association" {
  value       = contains(var.resource_types, "location_tracker_association") ? local.aws.location_tracker_association : null
  description = "Location"
}

output "m2_application" {
  value       = contains(var.resource_types, "m2_application") ? local.aws.m2_application : null
  description = "Mainframe Modernization"
}

output "m2_deployment" {
  value       = contains(var.resource_types, "m2_deployment") ? local.aws.m2_deployment : null
  description = "Mainframe Modernization"
}

output "m2_environment" {
  value       = contains(var.resource_types, "m2_environment") ? local.aws.m2_environment : null
  description = "Mainframe Modernization"
}

output "macie2_account" {
  value       = contains(var.resource_types, "macie2_account") ? local.aws.macie2_account : null
  description = "Macie"
}

output "macie2_classification_export_configuration" {
  value       = contains(var.resource_types, "macie2_classification_export_configuration") ? local.aws.macie2_classification_export_configuration : null
  description = "Macie"
}

output "macie2_classification_job" {
  value       = contains(var.resource_types, "macie2_classification_job") ? local.aws.macie2_classification_job : null
  description = "Macie"
}

output "macie2_custom_data_identifier" {
  value       = contains(var.resource_types, "macie2_custom_data_identifier") ? local.aws.macie2_custom_data_identifier : null
  description = "Macie"
}

output "macie2_findings_filter" {
  value       = contains(var.resource_types, "macie2_findings_filter") ? local.aws.macie2_findings_filter : null
  description = "Macie"
}

output "macie2_invitation_accepter" {
  value       = contains(var.resource_types, "macie2_invitation_accepter") ? local.aws.macie2_invitation_accepter : null
  description = "Macie"
}

output "macie2_member" {
  value       = contains(var.resource_types, "macie2_member") ? local.aws.macie2_member : null
  description = "Macie"
}

output "macie2_organization_admin_account" {
  value       = contains(var.resource_types, "macie2_organization_admin_account") ? local.aws.macie2_organization_admin_account : null
  description = "Macie"
}

output "macie2_organization_configuration" {
  value       = contains(var.resource_types, "macie2_organization_configuration") ? local.aws.macie2_organization_configuration : null
  description = "Macie"
}

output "main_route_table_association" {
  value       = contains(var.resource_types, "main_route_table_association") ? local.aws.main_route_table_association : null
  description = "Virtual Private Cloud"
}

output "media_convert_queue" {
  value       = contains(var.resource_types, "media_convert_queue") ? local.aws.media_convert_queue : null
  description = "Elemental MediaConvert"
}

output "media_package_channel" {
  value       = contains(var.resource_types, "media_package_channel") ? local.aws.media_package_channel : null
  description = "Elemental MediaPackage"
}

output "media_packagev2_channel_group" {
  value       = contains(var.resource_types, "media_packagev2_channel_group") ? local.aws.media_packagev2_channel_group : null
  description = "Elemental MediaPackage Version 2"
}

output "media_store_container" {
  value       = contains(var.resource_types, "media_store_container") ? local.aws.media_store_container : null
  description = "Elemental MediaStore"
}

output "media_store_container_policy" {
  value       = contains(var.resource_types, "media_store_container_policy") ? local.aws.media_store_container_policy : null
  description = "Elemental MediaStore"
}

output "medialive_channel" {
  value       = contains(var.resource_types, "medialive_channel") ? local.aws.medialive_channel : null
  description = "Elemental MediaLive"
}

output "medialive_input" {
  value       = contains(var.resource_types, "medialive_input") ? local.aws.medialive_input : null
  description = "Elemental MediaLive"
}

output "medialive_input_security_group" {
  value       = contains(var.resource_types, "medialive_input_security_group") ? local.aws.medialive_input_security_group : null
  description = "Elemental MediaLive"
}

output "medialive_multiplex" {
  value       = contains(var.resource_types, "medialive_multiplex") ? local.aws.medialive_multiplex : null
  description = "Elemental MediaLive"
}

output "medialive_multiplex_program" {
  value       = contains(var.resource_types, "medialive_multiplex_program") ? local.aws.medialive_multiplex_program : null
  description = "Elemental MediaLive"
}

output "memorydb_acl" {
  value       = contains(var.resource_types, "memorydb_acl") ? local.aws.memorydb_acl : null
  description = "MemoryDB"
}

output "memorydb_cluster" {
  value       = contains(var.resource_types, "memorydb_cluster") ? local.aws.memorydb_cluster : null
  description = "MemoryDB"
}

output "memorydb_multi_region_cluster" {
  value       = contains(var.resource_types, "memorydb_multi_region_cluster") ? local.aws.memorydb_multi_region_cluster : null
  description = "MemoryDB"
}

output "memorydb_parameter_group" {
  value       = contains(var.resource_types, "memorydb_parameter_group") ? local.aws.memorydb_parameter_group : null
  description = "MemoryDB"
}

output "memorydb_snapshot" {
  value       = contains(var.resource_types, "memorydb_snapshot") ? local.aws.memorydb_snapshot : null
  description = "MemoryDB"
}

output "memorydb_subnet_group" {
  value       = contains(var.resource_types, "memorydb_subnet_group") ? local.aws.memorydb_subnet_group : null
  description = "MemoryDB"
}

output "memorydb_user" {
  value       = contains(var.resource_types, "memorydb_user") ? local.aws.memorydb_user : null
  description = "MemoryDB"
}

output "mq_broker" {
  value       = contains(var.resource_types, "mq_broker") ? local.aws.mq_broker : null
  description = "MQ"
}

output "mq_configuration" {
  value       = contains(var.resource_types, "mq_configuration") ? local.aws.mq_configuration : null
  description = "MQ"
}

output "msk_cluster" {
  value       = contains(var.resource_types, "msk_cluster") ? local.aws.msk_cluster : null
  description = "Managed Streaming for Kafka"
}

output "msk_cluster_policy" {
  value       = contains(var.resource_types, "msk_cluster_policy") ? local.aws.msk_cluster_policy : null
  description = "Managed Streaming for Kafka"
}

output "msk_configuration" {
  value       = contains(var.resource_types, "msk_configuration") ? local.aws.msk_configuration : null
  description = "Managed Streaming for Kafka"
}

output "msk_replicator" {
  value       = contains(var.resource_types, "msk_replicator") ? local.aws.msk_replicator : null
  description = "Managed Streaming for Kafka"
}

output "msk_scram_secret_association" {
  value       = contains(var.resource_types, "msk_scram_secret_association") ? local.aws.msk_scram_secret_association : null
  description = "Managed Streaming for Kafka"
}

output "msk_serverless_cluster" {
  value       = contains(var.resource_types, "msk_serverless_cluster") ? local.aws.msk_serverless_cluster : null
  description = "Managed Streaming for Kafka"
}

output "msk_single_scram_secret_association" {
  value       = contains(var.resource_types, "msk_single_scram_secret_association") ? local.aws.msk_single_scram_secret_association : null
  description = "Managed Streaming for Kafka"
}

output "msk_vpc_connection" {
  value       = contains(var.resource_types, "msk_vpc_connection") ? local.aws.msk_vpc_connection : null
  description = "Managed Streaming for Kafka"
}

output "mskconnect_connector" {
  value       = contains(var.resource_types, "mskconnect_connector") ? local.aws.mskconnect_connector : null
  description = "Managed Streaming for Kafka Connect"
}

output "mskconnect_custom_plugin" {
  value       = contains(var.resource_types, "mskconnect_custom_plugin") ? local.aws.mskconnect_custom_plugin : null
  description = "Managed Streaming for Kafka Connect"
}

output "mskconnect_worker_configuration" {
  value       = contains(var.resource_types, "mskconnect_worker_configuration") ? local.aws.mskconnect_worker_configuration : null
  description = "Managed Streaming for Kafka Connect"
}

output "mwaa_environment" {
  value       = contains(var.resource_types, "mwaa_environment") ? local.aws.mwaa_environment : null
  description = "Managed Workflows for Apache Airflow"
}

output "nat_gateway" {
  value       = contains(var.resource_types, "nat_gateway") ? local.aws.nat_gateway : null
  description = "Virtual Private Cloud"
}

output "neptune_cluster" {
  value       = contains(var.resource_types, "neptune_cluster") ? local.aws.neptune_cluster : null
  description = "Neptune"
}

output "neptune_cluster_endpoint" {
  value       = contains(var.resource_types, "neptune_cluster_endpoint") ? local.aws.neptune_cluster_endpoint : null
  description = "Neptune"
}

output "neptune_cluster_instance" {
  value       = contains(var.resource_types, "neptune_cluster_instance") ? local.aws.neptune_cluster_instance : null
  description = "Neptune"
}

output "neptune_cluster_parameter_group" {
  value       = contains(var.resource_types, "neptune_cluster_parameter_group") ? local.aws.neptune_cluster_parameter_group : null
  description = "Neptune"
}

output "neptune_cluster_snapshot" {
  value       = contains(var.resource_types, "neptune_cluster_snapshot") ? local.aws.neptune_cluster_snapshot : null
  description = "Neptune"
}

output "neptune_event_subscription" {
  value       = contains(var.resource_types, "neptune_event_subscription") ? local.aws.neptune_event_subscription : null
  description = "Neptune"
}

output "neptune_global_cluster" {
  value       = contains(var.resource_types, "neptune_global_cluster") ? local.aws.neptune_global_cluster : null
  description = "Neptune"
}

output "neptune_parameter_group" {
  value       = contains(var.resource_types, "neptune_parameter_group") ? local.aws.neptune_parameter_group : null
  description = "Neptune"
}

output "neptune_subnet_group" {
  value       = contains(var.resource_types, "neptune_subnet_group") ? local.aws.neptune_subnet_group : null
  description = "Neptune"
}

output "neptunegraph_graph" {
  value       = contains(var.resource_types, "neptunegraph_graph") ? local.aws.neptunegraph_graph : null
  description = "Neptune Analytics"
}

output "network_acl" {
  value       = contains(var.resource_types, "network_acl") ? local.aws.network_acl : null
  description = "Virtual Private Cloud"
}

output "network_acl_association" {
  value       = contains(var.resource_types, "network_acl_association") ? local.aws.network_acl_association : null
  description = "Virtual Private Cloud"
}

output "network_acl_rule" {
  value       = contains(var.resource_types, "network_acl_rule") ? local.aws.network_acl_rule : null
  description = "Virtual Private Cloud"
}

output "network_interface" {
  value       = contains(var.resource_types, "network_interface") ? local.aws.network_interface : null
  description = "Virtual Private Cloud"
}

output "network_interface_attachment" {
  value       = contains(var.resource_types, "network_interface_attachment") ? local.aws.network_interface_attachment : null
  description = "Virtual Private Cloud"
}

output "network_interface_permission" {
  value       = contains(var.resource_types, "network_interface_permission") ? local.aws.network_interface_permission : null
  description = "Virtual Private Cloud"
}

output "network_interface_sg_attachment" {
  value       = contains(var.resource_types, "network_interface_sg_attachment") ? local.aws.network_interface_sg_attachment : null
  description = "Virtual Private Cloud"
}

output "networkfirewall_firewall" {
  value       = contains(var.resource_types, "networkfirewall_firewall") ? local.aws.networkfirewall_firewall : null
  description = "Network Firewall"
}

output "networkfirewall_firewall_policy" {
  value       = contains(var.resource_types, "networkfirewall_firewall_policy") ? local.aws.networkfirewall_firewall_policy : null
  description = "Network Firewall"
}

output "networkfirewall_logging_configuration" {
  value       = contains(var.resource_types, "networkfirewall_logging_configuration") ? local.aws.networkfirewall_logging_configuration : null
  description = "Network Firewall"
}

output "networkfirewall_resource_policy" {
  value       = contains(var.resource_types, "networkfirewall_resource_policy") ? local.aws.networkfirewall_resource_policy : null
  description = "Network Firewall"
}

output "networkfirewall_rule_group" {
  value       = contains(var.resource_types, "networkfirewall_rule_group") ? local.aws.networkfirewall_rule_group : null
  description = "Network Firewall"
}

output "networkfirewall_tls_inspection_configuration" {
  value       = contains(var.resource_types, "networkfirewall_tls_inspection_configuration") ? local.aws.networkfirewall_tls_inspection_configuration : null
  description = "Network Firewall"
}

output "networkmanager_attachment_accepter" {
  value       = contains(var.resource_types, "networkmanager_attachment_accepter") ? local.aws.networkmanager_attachment_accepter : null
  description = "Network Manager"
}

output "networkmanager_connect_attachment" {
  value       = contains(var.resource_types, "networkmanager_connect_attachment") ? local.aws.networkmanager_connect_attachment : null
  description = "Network Manager"
}

output "networkmanager_connect_peer" {
  value       = contains(var.resource_types, "networkmanager_connect_peer") ? local.aws.networkmanager_connect_peer : null
  description = "Network Manager"
}

output "networkmanager_connection" {
  value       = contains(var.resource_types, "networkmanager_connection") ? local.aws.networkmanager_connection : null
  description = "Network Manager"
}

output "networkmanager_core_network" {
  value       = contains(var.resource_types, "networkmanager_core_network") ? local.aws.networkmanager_core_network : null
  description = "Network Manager"
}

output "networkmanager_core_network_policy_attachment" {
  value       = contains(var.resource_types, "networkmanager_core_network_policy_attachment") ? local.aws.networkmanager_core_network_policy_attachment : null
  description = "Network Manager"
}

output "networkmanager_customer_gateway_association" {
  value       = contains(var.resource_types, "networkmanager_customer_gateway_association") ? local.aws.networkmanager_customer_gateway_association : null
  description = "Network Manager"
}

output "networkmanager_device" {
  value       = contains(var.resource_types, "networkmanager_device") ? local.aws.networkmanager_device : null
  description = "Network Manager"
}

output "networkmanager_dx_gateway_attachment" {
  value       = contains(var.resource_types, "networkmanager_dx_gateway_attachment") ? local.aws.networkmanager_dx_gateway_attachment : null
  description = "Network Manager"
}

output "networkmanager_global_network" {
  value       = contains(var.resource_types, "networkmanager_global_network") ? local.aws.networkmanager_global_network : null
  description = "Network Manager"
}

output "networkmanager_link" {
  value       = contains(var.resource_types, "networkmanager_link") ? local.aws.networkmanager_link : null
  description = "Network Manager"
}

output "networkmanager_link_association" {
  value       = contains(var.resource_types, "networkmanager_link_association") ? local.aws.networkmanager_link_association : null
  description = "Network Manager"
}

output "networkmanager_site" {
  value       = contains(var.resource_types, "networkmanager_site") ? local.aws.networkmanager_site : null
  description = "Network Manager"
}

output "networkmanager_site_to_site_vpn_attachment" {
  value       = contains(var.resource_types, "networkmanager_site_to_site_vpn_attachment") ? local.aws.networkmanager_site_to_site_vpn_attachment : null
  description = "Network Manager"
}

output "networkmanager_transit_gateway_connect_peer_association" {
  value       = contains(var.resource_types, "networkmanager_transit_gateway_connect_peer_association") ? local.aws.networkmanager_transit_gateway_connect_peer_association : null
  description = "Network Manager"
}

output "networkmanager_transit_gateway_peering" {
  value       = contains(var.resource_types, "networkmanager_transit_gateway_peering") ? local.aws.networkmanager_transit_gateway_peering : null
  description = "Network Manager"
}

output "networkmanager_transit_gateway_registration" {
  value       = contains(var.resource_types, "networkmanager_transit_gateway_registration") ? local.aws.networkmanager_transit_gateway_registration : null
  description = "Network Manager"
}

output "networkmanager_transit_gateway_route_table_attachment" {
  value       = contains(var.resource_types, "networkmanager_transit_gateway_route_table_attachment") ? local.aws.networkmanager_transit_gateway_route_table_attachment : null
  description = "Network Manager"
}

output "networkmanager_vpc_attachment" {
  value       = contains(var.resource_types, "networkmanager_vpc_attachment") ? local.aws.networkmanager_vpc_attachment : null
  description = "Network Manager"
}

output "networkmonitor_monitor" {
  value       = contains(var.resource_types, "networkmonitor_monitor") ? local.aws.networkmonitor_monitor : null
  description = "CloudWatch Network Monitor"
}

output "networkmonitor_probe" {
  value       = contains(var.resource_types, "networkmonitor_probe") ? local.aws.networkmonitor_probe : null
  description = "CloudWatch Network Monitor"
}

output "oam_link" {
  value       = contains(var.resource_types, "oam_link") ? local.aws.oam_link : null
  description = "CloudWatch Observability Access Manager"
}

output "oam_sink" {
  value       = contains(var.resource_types, "oam_sink") ? local.aws.oam_sink : null
  description = "CloudWatch Observability Access Manager"
}

output "oam_sink_policy" {
  value       = contains(var.resource_types, "oam_sink_policy") ? local.aws.oam_sink_policy : null
  description = "CloudWatch Observability Access Manager"
}

output "opensearch_authorize_vpc_endpoint_access" {
  value       = contains(var.resource_types, "opensearch_authorize_vpc_endpoint_access") ? local.aws.opensearch_authorize_vpc_endpoint_access : null
  description = "OpenSearch"
}

output "opensearch_domain" {
  value       = contains(var.resource_types, "opensearch_domain") ? local.aws.opensearch_domain : null
  description = "OpenSearch"
}

output "opensearch_domain_policy" {
  value       = contains(var.resource_types, "opensearch_domain_policy") ? local.aws.opensearch_domain_policy : null
  description = "OpenSearch"
}

output "opensearch_domain_saml_options" {
  value       = contains(var.resource_types, "opensearch_domain_saml_options") ? local.aws.opensearch_domain_saml_options : null
  description = "OpenSearch"
}

output "opensearch_inbound_connection_accepter" {
  value       = contains(var.resource_types, "opensearch_inbound_connection_accepter") ? local.aws.opensearch_inbound_connection_accepter : null
  description = "OpenSearch"
}

output "opensearch_outbound_connection" {
  value       = contains(var.resource_types, "opensearch_outbound_connection") ? local.aws.opensearch_outbound_connection : null
  description = "OpenSearch"
}

output "opensearch_package" {
  value       = contains(var.resource_types, "opensearch_package") ? local.aws.opensearch_package : null
  description = "OpenSearch"
}

output "opensearch_package_association" {
  value       = contains(var.resource_types, "opensearch_package_association") ? local.aws.opensearch_package_association : null
  description = "OpenSearch"
}

output "opensearch_vpc_endpoint" {
  value       = contains(var.resource_types, "opensearch_vpc_endpoint") ? local.aws.opensearch_vpc_endpoint : null
  description = "OpenSearch"
}

output "opensearchserverless_access_policy" {
  value       = contains(var.resource_types, "opensearchserverless_access_policy") ? local.aws.opensearchserverless_access_policy : null
  description = "OpenSearch Serverless"
}

output "opensearchserverless_collection" {
  value       = contains(var.resource_types, "opensearchserverless_collection") ? local.aws.opensearchserverless_collection : null
  description = "OpenSearch Serverless"
}

output "opensearchserverless_lifecycle_policy" {
  value       = contains(var.resource_types, "opensearchserverless_lifecycle_policy") ? local.aws.opensearchserverless_lifecycle_policy : null
  description = "OpenSearch Serverless"
}

output "opensearchserverless_security_config" {
  value       = contains(var.resource_types, "opensearchserverless_security_config") ? local.aws.opensearchserverless_security_config : null
  description = "OpenSearch Serverless"
}

output "opensearchserverless_security_policy" {
  value       = contains(var.resource_types, "opensearchserverless_security_policy") ? local.aws.opensearchserverless_security_policy : null
  description = "OpenSearch Serverless"
}

output "opensearchserverless_vpc_endpoint" {
  value       = contains(var.resource_types, "opensearchserverless_vpc_endpoint") ? local.aws.opensearchserverless_vpc_endpoint : null
  description = "OpenSearch Serverless"
}

output "opsworks_application" {
  value       = contains(var.resource_types, "opsworks_application") ? local.aws.opsworks_application : null
  description = "OpsWorks"
}

output "opsworks_custom_layer" {
  value       = contains(var.resource_types, "opsworks_custom_layer") ? local.aws.opsworks_custom_layer : null
  description = "OpsWorks"
}

output "opsworks_ecs_cluster_layer" {
  value       = contains(var.resource_types, "opsworks_ecs_cluster_layer") ? local.aws.opsworks_ecs_cluster_layer : null
  description = "OpsWorks"
}

output "opsworks_ganglia_layer" {
  value       = contains(var.resource_types, "opsworks_ganglia_layer") ? local.aws.opsworks_ganglia_layer : null
  description = "OpsWorks"
}

output "opsworks_haproxy_layer" {
  value       = contains(var.resource_types, "opsworks_haproxy_layer") ? local.aws.opsworks_haproxy_layer : null
  description = "OpsWorks"
}

output "opsworks_instance" {
  value       = contains(var.resource_types, "opsworks_instance") ? local.aws.opsworks_instance : null
  description = "OpsWorks"
}

output "opsworks_java_app_layer" {
  value       = contains(var.resource_types, "opsworks_java_app_layer") ? local.aws.opsworks_java_app_layer : null
  description = "OpsWorks"
}

output "opsworks_memcached_layer" {
  value       = contains(var.resource_types, "opsworks_memcached_layer") ? local.aws.opsworks_memcached_layer : null
  description = "OpsWorks"
}

output "opsworks_mysql_layer" {
  value       = contains(var.resource_types, "opsworks_mysql_layer") ? local.aws.opsworks_mysql_layer : null
  description = "OpsWorks"
}

output "opsworks_nodejs_app_layer" {
  value       = contains(var.resource_types, "opsworks_nodejs_app_layer") ? local.aws.opsworks_nodejs_app_layer : null
  description = "OpsWorks"
}

output "opsworks_permission" {
  value       = contains(var.resource_types, "opsworks_permission") ? local.aws.opsworks_permission : null
  description = "OpsWorks"
}

output "opsworks_php_app_layer" {
  value       = contains(var.resource_types, "opsworks_php_app_layer") ? local.aws.opsworks_php_app_layer : null
  description = "OpsWorks"
}

output "opsworks_rails_app_layer" {
  value       = contains(var.resource_types, "opsworks_rails_app_layer") ? local.aws.opsworks_rails_app_layer : null
  description = "OpsWorks"
}

output "opsworks_rds_db_instance" {
  value       = contains(var.resource_types, "opsworks_rds_db_instance") ? local.aws.opsworks_rds_db_instance : null
  description = "OpsWorks"
}

output "opsworks_stack" {
  value       = contains(var.resource_types, "opsworks_stack") ? local.aws.opsworks_stack : null
  description = "OpsWorks"
}

output "opsworks_static_web_layer" {
  value       = contains(var.resource_types, "opsworks_static_web_layer") ? local.aws.opsworks_static_web_layer : null
  description = "OpsWorks"
}

output "opsworks_user_profile" {
  value       = contains(var.resource_types, "opsworks_user_profile") ? local.aws.opsworks_user_profile : null
  description = "OpsWorks"
}

output "organizations_account" {
  value       = contains(var.resource_types, "organizations_account") ? local.aws.organizations_account : null
  description = "Organizations"
}

output "organizations_delegated_administrator" {
  value       = contains(var.resource_types, "organizations_delegated_administrator") ? local.aws.organizations_delegated_administrator : null
  description = "Organizations"
}

output "organizations_organization" {
  value       = contains(var.resource_types, "organizations_organization") ? local.aws.organizations_organization : null
  description = "Organizations"
}

output "organizations_organizational_unit" {
  value       = contains(var.resource_types, "organizations_organizational_unit") ? local.aws.organizations_organizational_unit : null
  description = "Organizations"
}

output "organizations_policy" {
  value       = contains(var.resource_types, "organizations_policy") ? local.aws.organizations_policy : null
  description = "Organizations"
}

output "organizations_policy_attachment" {
  value       = contains(var.resource_types, "organizations_policy_attachment") ? local.aws.organizations_policy_attachment : null
  description = "Organizations"
}

output "organizations_resource_policy" {
  value       = contains(var.resource_types, "organizations_resource_policy") ? local.aws.organizations_resource_policy : null
  description = "Organizations"
}

output "osis_pipeline" {
  value       = contains(var.resource_types, "osis_pipeline") ? local.aws.osis_pipeline : null
  description = "OpenSearch Ingestion"
}

output "paymentcryptography_key" {
  value       = contains(var.resource_types, "paymentcryptography_key") ? local.aws.paymentcryptography_key : null
  description = "Payment Cryptography Control Plane"
}

output "paymentcryptography_key_alias" {
  value       = contains(var.resource_types, "paymentcryptography_key_alias") ? local.aws.paymentcryptography_key_alias : null
  description = "Payment Cryptography Control Plane"
}

output "pinpoint_adm_channel" {
  value       = contains(var.resource_types, "pinpoint_adm_channel") ? local.aws.pinpoint_adm_channel : null
  description = "Pinpoint"
}

output "pinpoint_apns_channel" {
  value       = contains(var.resource_types, "pinpoint_apns_channel") ? local.aws.pinpoint_apns_channel : null
  description = "Pinpoint"
}

output "pinpoint_apns_sandbox_channel" {
  value       = contains(var.resource_types, "pinpoint_apns_sandbox_channel") ? local.aws.pinpoint_apns_sandbox_channel : null
  description = "Pinpoint"
}

output "pinpoint_apns_voip_channel" {
  value       = contains(var.resource_types, "pinpoint_apns_voip_channel") ? local.aws.pinpoint_apns_voip_channel : null
  description = "Pinpoint"
}

output "pinpoint_apns_voip_sandbox_channel" {
  value       = contains(var.resource_types, "pinpoint_apns_voip_sandbox_channel") ? local.aws.pinpoint_apns_voip_sandbox_channel : null
  description = "Pinpoint"
}

output "pinpoint_app" {
  value       = contains(var.resource_types, "pinpoint_app") ? local.aws.pinpoint_app : null
  description = "Pinpoint"
}

output "pinpoint_baidu_channel" {
  value       = contains(var.resource_types, "pinpoint_baidu_channel") ? local.aws.pinpoint_baidu_channel : null
  description = "Pinpoint"
}

output "pinpoint_email_channel" {
  value       = contains(var.resource_types, "pinpoint_email_channel") ? local.aws.pinpoint_email_channel : null
  description = "Pinpoint"
}

output "pinpoint_email_template" {
  value       = contains(var.resource_types, "pinpoint_email_template") ? local.aws.pinpoint_email_template : null
  description = "Pinpoint"
}

output "pinpoint_event_stream" {
  value       = contains(var.resource_types, "pinpoint_event_stream") ? local.aws.pinpoint_event_stream : null
  description = "Pinpoint"
}

output "pinpoint_gcm_channel" {
  value       = contains(var.resource_types, "pinpoint_gcm_channel") ? local.aws.pinpoint_gcm_channel : null
  description = "Pinpoint"
}

output "pinpoint_sms_channel" {
  value       = contains(var.resource_types, "pinpoint_sms_channel") ? local.aws.pinpoint_sms_channel : null
  description = "Pinpoint"
}

output "pinpointsmsvoicev2_configuration_set" {
  value       = contains(var.resource_types, "pinpointsmsvoicev2_configuration_set") ? local.aws.pinpointsmsvoicev2_configuration_set : null
  description = "End User Messaging SMS"
}

output "pinpointsmsvoicev2_opt_out_list" {
  value       = contains(var.resource_types, "pinpointsmsvoicev2_opt_out_list") ? local.aws.pinpointsmsvoicev2_opt_out_list : null
  description = "End User Messaging SMS"
}

output "pinpointsmsvoicev2_phone_number" {
  value       = contains(var.resource_types, "pinpointsmsvoicev2_phone_number") ? local.aws.pinpointsmsvoicev2_phone_number : null
  description = "End User Messaging SMS"
}

output "pipes_pipe" {
  value       = contains(var.resource_types, "pipes_pipe") ? local.aws.pipes_pipe : null
  description = "EventBridge Pipes"
}

output "placement_group" {
  value       = contains(var.resource_types, "placement_group") ? local.aws.placement_group : null
  description = "Elastic Compute Cloud"
}

output "prometheus_alert_manager_definition" {
  value       = contains(var.resource_types, "prometheus_alert_manager_definition") ? local.aws.prometheus_alert_manager_definition : null
  description = "Managed Prometheus"
}

output "prometheus_rule_group_namespace" {
  value       = contains(var.resource_types, "prometheus_rule_group_namespace") ? local.aws.prometheus_rule_group_namespace : null
  description = "Managed Prometheus"
}

output "prometheus_scraper" {
  value       = contains(var.resource_types, "prometheus_scraper") ? local.aws.prometheus_scraper : null
  description = "Managed Prometheus"
}

output "prometheus_workspace" {
  value       = contains(var.resource_types, "prometheus_workspace") ? local.aws.prometheus_workspace : null
  description = "Managed Prometheus"
}

output "proxy_protocol_policy" {
  value       = contains(var.resource_types, "proxy_protocol_policy") ? local.aws.proxy_protocol_policy : null
  description = "ELB Classic"
}

output "qbusiness_application" {
  value       = contains(var.resource_types, "qbusiness_application") ? local.aws.qbusiness_application : null
  description = "Amazon Q Business"
}

output "qldb_ledger" {
  value       = contains(var.resource_types, "qldb_ledger") ? local.aws.qldb_ledger : null
  description = "Quantum Ledger Database"
}

output "qldb_stream" {
  value       = contains(var.resource_types, "qldb_stream") ? local.aws.qldb_stream : null
  description = "Quantum Ledger Database"
}

output "quicksight_account_subscription" {
  value       = contains(var.resource_types, "quicksight_account_subscription") ? local.aws.quicksight_account_subscription : null
  description = "QuickSight"
}

output "quicksight_analysis" {
  value       = contains(var.resource_types, "quicksight_analysis") ? local.aws.quicksight_analysis : null
  description = "QuickSight"
}

output "quicksight_dashboard" {
  value       = contains(var.resource_types, "quicksight_dashboard") ? local.aws.quicksight_dashboard : null
  description = "QuickSight"
}

output "quicksight_data_set" {
  value       = contains(var.resource_types, "quicksight_data_set") ? local.aws.quicksight_data_set : null
  description = "QuickSight"
}

output "quicksight_data_source" {
  value       = contains(var.resource_types, "quicksight_data_source") ? local.aws.quicksight_data_source : null
  description = "QuickSight"
}

output "quicksight_folder" {
  value       = contains(var.resource_types, "quicksight_folder") ? local.aws.quicksight_folder : null
  description = "QuickSight"
}

output "quicksight_folder_membership" {
  value       = contains(var.resource_types, "quicksight_folder_membership") ? local.aws.quicksight_folder_membership : null
  description = "QuickSight"
}

output "quicksight_group" {
  value       = contains(var.resource_types, "quicksight_group") ? local.aws.quicksight_group : null
  description = "QuickSight"
}

output "quicksight_group_membership" {
  value       = contains(var.resource_types, "quicksight_group_membership") ? local.aws.quicksight_group_membership : null
  description = "QuickSight"
}

output "quicksight_iam_policy_assignment" {
  value       = contains(var.resource_types, "quicksight_iam_policy_assignment") ? local.aws.quicksight_iam_policy_assignment : null
  description = "QuickSight"
}

output "quicksight_ingestion" {
  value       = contains(var.resource_types, "quicksight_ingestion") ? local.aws.quicksight_ingestion : null
  description = "QuickSight"
}

output "quicksight_namespace" {
  value       = contains(var.resource_types, "quicksight_namespace") ? local.aws.quicksight_namespace : null
  description = "QuickSight"
}

output "quicksight_refresh_schedule" {
  value       = contains(var.resource_types, "quicksight_refresh_schedule") ? local.aws.quicksight_refresh_schedule : null
  description = "QuickSight"
}

output "quicksight_role_membership" {
  value       = contains(var.resource_types, "quicksight_role_membership") ? local.aws.quicksight_role_membership : null
  description = "QuickSight"
}

output "quicksight_template" {
  value       = contains(var.resource_types, "quicksight_template") ? local.aws.quicksight_template : null
  description = "QuickSight"
}

output "quicksight_template_alias" {
  value       = contains(var.resource_types, "quicksight_template_alias") ? local.aws.quicksight_template_alias : null
  description = "QuickSight"
}

output "quicksight_theme" {
  value       = contains(var.resource_types, "quicksight_theme") ? local.aws.quicksight_theme : null
  description = "QuickSight"
}

output "quicksight_user" {
  value       = contains(var.resource_types, "quicksight_user") ? local.aws.quicksight_user : null
  description = "QuickSight"
}

output "quicksight_vpc_connection" {
  value       = contains(var.resource_types, "quicksight_vpc_connection") ? local.aws.quicksight_vpc_connection : null
  description = "QuickSight"
}

output "ram_principal_association" {
  value       = contains(var.resource_types, "ram_principal_association") ? local.aws.ram_principal_association : null
  description = "Resource Access Manager"
}

output "ram_resource_association" {
  value       = contains(var.resource_types, "ram_resource_association") ? local.aws.ram_resource_association : null
  description = "Resource Access Manager"
}

output "ram_resource_share" {
  value       = contains(var.resource_types, "ram_resource_share") ? local.aws.ram_resource_share : null
  description = "Resource Access Manager"
}

output "ram_resource_share_accepter" {
  value       = contains(var.resource_types, "ram_resource_share_accepter") ? local.aws.ram_resource_share_accepter : null
  description = "Resource Access Manager"
}

output "ram_sharing_with_organization" {
  value       = contains(var.resource_types, "ram_sharing_with_organization") ? local.aws.ram_sharing_with_organization : null
  description = "Resource Access Manager"
}

output "rbin_rule" {
  value       = contains(var.resource_types, "rbin_rule") ? local.aws.rbin_rule : null
  description = "RBin"
}

output "rds_certificate" {
  value       = contains(var.resource_types, "rds_certificate") ? local.aws.rds_certificate : null
  description = "Relational Database"
}

output "rds_cluster" {
  value       = contains(var.resource_types, "rds_cluster") ? local.aws.rds_cluster : null
  description = "Relational Database"
}

output "rds_cluster_activity_stream" {
  value       = contains(var.resource_types, "rds_cluster_activity_stream") ? local.aws.rds_cluster_activity_stream : null
  description = "Relational Database"
}

output "rds_cluster_endpoint" {
  value       = contains(var.resource_types, "rds_cluster_endpoint") ? local.aws.rds_cluster_endpoint : null
  description = "Relational Database"
}

output "rds_cluster_instance" {
  value       = contains(var.resource_types, "rds_cluster_instance") ? local.aws.rds_cluster_instance : null
  description = "Relational Database"
}

output "rds_cluster_parameter_group" {
  value       = contains(var.resource_types, "rds_cluster_parameter_group") ? local.aws.rds_cluster_parameter_group : null
  description = "Relational Database"
}

output "rds_cluster_role_association" {
  value       = contains(var.resource_types, "rds_cluster_role_association") ? local.aws.rds_cluster_role_association : null
  description = "Relational Database"
}

output "rds_cluster_snapshot_copy" {
  value       = contains(var.resource_types, "rds_cluster_snapshot_copy") ? local.aws.rds_cluster_snapshot_copy : null
  description = "Relational Database"
}

output "rds_custom_db_engine_version" {
  value       = contains(var.resource_types, "rds_custom_db_engine_version") ? local.aws.rds_custom_db_engine_version : null
  description = "Relational Database"
}

output "rds_export_task" {
  value       = contains(var.resource_types, "rds_export_task") ? local.aws.rds_export_task : null
  description = "Relational Database"
}

output "rds_global_cluster" {
  value       = contains(var.resource_types, "rds_global_cluster") ? local.aws.rds_global_cluster : null
  description = "Relational Database"
}

output "rds_instance_state" {
  value       = contains(var.resource_types, "rds_instance_state") ? local.aws.rds_instance_state : null
  description = "Relational Database"
}

output "rds_integration" {
  value       = contains(var.resource_types, "rds_integration") ? local.aws.rds_integration : null
  description = "Relational Database"
}

output "rds_reserved_instance" {
  value       = contains(var.resource_types, "rds_reserved_instance") ? local.aws.rds_reserved_instance : null
  description = "Relational Database"
}

output "rds_shard_group" {
  value       = contains(var.resource_types, "rds_shard_group") ? local.aws.rds_shard_group : null
  description = "Relational Database"
}

output "redshift_authentication_profile" {
  value       = contains(var.resource_types, "redshift_authentication_profile") ? local.aws.redshift_authentication_profile : null
  description = "Redshift"
}

output "redshift_cluster" {
  value       = contains(var.resource_types, "redshift_cluster") ? local.aws.redshift_cluster : null
  description = "Redshift"
}

output "redshift_cluster_iam_roles" {
  value       = contains(var.resource_types, "redshift_cluster_iam_roles") ? local.aws.redshift_cluster_iam_roles : null
  description = "Redshift"
}

output "redshift_cluster_snapshot" {
  value       = contains(var.resource_types, "redshift_cluster_snapshot") ? local.aws.redshift_cluster_snapshot : null
  description = "Redshift"
}

output "redshift_data_share_authorization" {
  value       = contains(var.resource_types, "redshift_data_share_authorization") ? local.aws.redshift_data_share_authorization : null
  description = "Redshift"
}

output "redshift_data_share_consumer_association" {
  value       = contains(var.resource_types, "redshift_data_share_consumer_association") ? local.aws.redshift_data_share_consumer_association : null
  description = "Redshift"
}

output "redshift_endpoint_access" {
  value       = contains(var.resource_types, "redshift_endpoint_access") ? local.aws.redshift_endpoint_access : null
  description = "Redshift"
}

output "redshift_endpoint_authorization" {
  value       = contains(var.resource_types, "redshift_endpoint_authorization") ? local.aws.redshift_endpoint_authorization : null
  description = "Redshift"
}

output "redshift_event_subscription" {
  value       = contains(var.resource_types, "redshift_event_subscription") ? local.aws.redshift_event_subscription : null
  description = "Redshift"
}

output "redshift_hsm_client_certificate" {
  value       = contains(var.resource_types, "redshift_hsm_client_certificate") ? local.aws.redshift_hsm_client_certificate : null
  description = "Redshift"
}

output "redshift_hsm_configuration" {
  value       = contains(var.resource_types, "redshift_hsm_configuration") ? local.aws.redshift_hsm_configuration : null
  description = "Redshift"
}

output "redshift_logging" {
  value       = contains(var.resource_types, "redshift_logging") ? local.aws.redshift_logging : null
  description = "Redshift"
}

output "redshift_parameter_group" {
  value       = contains(var.resource_types, "redshift_parameter_group") ? local.aws.redshift_parameter_group : null
  description = "Redshift"
}

output "redshift_partner" {
  value       = contains(var.resource_types, "redshift_partner") ? local.aws.redshift_partner : null
  description = "Redshift"
}

output "redshift_resource_policy" {
  value       = contains(var.resource_types, "redshift_resource_policy") ? local.aws.redshift_resource_policy : null
  description = "Redshift"
}

output "redshift_scheduled_action" {
  value       = contains(var.resource_types, "redshift_scheduled_action") ? local.aws.redshift_scheduled_action : null
  description = "Redshift"
}

output "redshift_snapshot_copy" {
  value       = contains(var.resource_types, "redshift_snapshot_copy") ? local.aws.redshift_snapshot_copy : null
  description = "Redshift"
}

output "redshift_snapshot_copy_grant" {
  value       = contains(var.resource_types, "redshift_snapshot_copy_grant") ? local.aws.redshift_snapshot_copy_grant : null
  description = "Redshift"
}

output "redshift_snapshot_schedule" {
  value       = contains(var.resource_types, "redshift_snapshot_schedule") ? local.aws.redshift_snapshot_schedule : null
  description = "Redshift"
}

output "redshift_snapshot_schedule_association" {
  value       = contains(var.resource_types, "redshift_snapshot_schedule_association") ? local.aws.redshift_snapshot_schedule_association : null
  description = "Redshift"
}

output "redshift_subnet_group" {
  value       = contains(var.resource_types, "redshift_subnet_group") ? local.aws.redshift_subnet_group : null
  description = "Redshift"
}

output "redshift_usage_limit" {
  value       = contains(var.resource_types, "redshift_usage_limit") ? local.aws.redshift_usage_limit : null
  description = "Redshift"
}

output "redshiftdata_statement" {
  value       = contains(var.resource_types, "redshiftdata_statement") ? local.aws.redshiftdata_statement : null
  description = "Redshift Data"
}

output "redshiftserverless_custom_domain_association" {
  value       = contains(var.resource_types, "redshiftserverless_custom_domain_association") ? local.aws.redshiftserverless_custom_domain_association : null
  description = "Redshift Serverless"
}

output "redshiftserverless_endpoint_access" {
  value       = contains(var.resource_types, "redshiftserverless_endpoint_access") ? local.aws.redshiftserverless_endpoint_access : null
  description = "Redshift Serverless"
}

output "redshiftserverless_namespace" {
  value       = contains(var.resource_types, "redshiftserverless_namespace") ? local.aws.redshiftserverless_namespace : null
  description = "Redshift Serverless"
}

output "redshiftserverless_resource_policy" {
  value       = contains(var.resource_types, "redshiftserverless_resource_policy") ? local.aws.redshiftserverless_resource_policy : null
  description = "Redshift Serverless"
}

output "redshiftserverless_snapshot" {
  value       = contains(var.resource_types, "redshiftserverless_snapshot") ? local.aws.redshiftserverless_snapshot : null
  description = "Redshift Serverless"
}

output "redshiftserverless_usage_limit" {
  value       = contains(var.resource_types, "redshiftserverless_usage_limit") ? local.aws.redshiftserverless_usage_limit : null
  description = "Redshift Serverless"
}

output "redshiftserverless_workgroup" {
  value       = contains(var.resource_types, "redshiftserverless_workgroup") ? local.aws.redshiftserverless_workgroup : null
  description = "Redshift Serverless"
}

output "rekognition_collection" {
  value       = contains(var.resource_types, "rekognition_collection") ? local.aws.rekognition_collection : null
  description = "Rekognition"
}

output "rekognition_project" {
  value       = contains(var.resource_types, "rekognition_project") ? local.aws.rekognition_project : null
  description = "Rekognition"
}

output "rekognition_stream_processor" {
  value       = contains(var.resource_types, "rekognition_stream_processor") ? local.aws.rekognition_stream_processor : null
  description = "Rekognition"
}

output "resiliencehub_resiliency_policy" {
  value       = contains(var.resource_types, "resiliencehub_resiliency_policy") ? local.aws.resiliencehub_resiliency_policy : null
  description = "Resilience Hub"
}

output "resourceexplorer2_index" {
  value       = contains(var.resource_types, "resourceexplorer2_index") ? local.aws.resourceexplorer2_index : null
  description = "Resource Explorer"
}

output "resourceexplorer2_view" {
  value       = contains(var.resource_types, "resourceexplorer2_view") ? local.aws.resourceexplorer2_view : null
  description = "Resource Explorer"
}

output "resourcegroups_group" {
  value       = contains(var.resource_types, "resourcegroups_group") ? local.aws.resourcegroups_group : null
  description = "Resource Groups"
}

output "resourcegroups_resource" {
  value       = contains(var.resource_types, "resourcegroups_resource") ? local.aws.resourcegroups_resource : null
  description = "Resource Groups"
}

output "rolesanywhere_profile" {
  value       = contains(var.resource_types, "rolesanywhere_profile") ? local.aws.rolesanywhere_profile : null
  description = "Roles Anywhere"
}

output "rolesanywhere_trust_anchor" {
  value       = contains(var.resource_types, "rolesanywhere_trust_anchor") ? local.aws.rolesanywhere_trust_anchor : null
  description = "Roles Anywhere"
}

output "route" {
  value       = contains(var.resource_types, "route") ? local.aws.route : null
  description = "Virtual Private Cloud"
}

output "route53_cidr_collection" {
  value       = contains(var.resource_types, "route53_cidr_collection") ? local.aws.route53_cidr_collection : null
  description = "Route 53"
}

output "route53_cidr_location" {
  value       = contains(var.resource_types, "route53_cidr_location") ? local.aws.route53_cidr_location : null
  description = "Route 53"
}

output "route53_delegation_set" {
  value       = contains(var.resource_types, "route53_delegation_set") ? local.aws.route53_delegation_set : null
  description = "Route 53"
}

output "route53_health_check" {
  value       = contains(var.resource_types, "route53_health_check") ? local.aws.route53_health_check : null
  description = "Route 53"
}

output "route53_hosted_zone_dnssec" {
  value       = contains(var.resource_types, "route53_hosted_zone_dnssec") ? local.aws.route53_hosted_zone_dnssec : null
  description = "Route 53"
}

output "route53_key_signing_key" {
  value       = contains(var.resource_types, "route53_key_signing_key") ? local.aws.route53_key_signing_key : null
  description = "Route 53"
}

output "route53_query_log" {
  value       = contains(var.resource_types, "route53_query_log") ? local.aws.route53_query_log : null
  description = "Route 53"
}

output "route53_record" {
  value       = contains(var.resource_types, "route53_record") ? local.aws.route53_record : null
  description = "Route 53"
}

output "route53_resolver_config" {
  value       = contains(var.resource_types, "route53_resolver_config") ? local.aws.route53_resolver_config : null
  description = "Route 53 Resolver"
}

output "route53_resolver_dnssec_config" {
  value       = contains(var.resource_types, "route53_resolver_dnssec_config") ? local.aws.route53_resolver_dnssec_config : null
  description = "Route 53 Resolver"
}

output "route53_resolver_endpoint" {
  value       = contains(var.resource_types, "route53_resolver_endpoint") ? local.aws.route53_resolver_endpoint : null
  description = "Route 53 Resolver"
}

output "route53_resolver_firewall_config" {
  value       = contains(var.resource_types, "route53_resolver_firewall_config") ? local.aws.route53_resolver_firewall_config : null
  description = "Route 53 Resolver"
}

output "route53_resolver_firewall_domain_list" {
  value       = contains(var.resource_types, "route53_resolver_firewall_domain_list") ? local.aws.route53_resolver_firewall_domain_list : null
  description = "Route 53 Resolver"
}

output "route53_resolver_firewall_rule" {
  value       = contains(var.resource_types, "route53_resolver_firewall_rule") ? local.aws.route53_resolver_firewall_rule : null
  description = "Route 53 Resolver"
}

output "route53_resolver_firewall_rule_group" {
  value       = contains(var.resource_types, "route53_resolver_firewall_rule_group") ? local.aws.route53_resolver_firewall_rule_group : null
  description = "Route 53 Resolver"
}

output "route53_resolver_firewall_rule_group_association" {
  value       = contains(var.resource_types, "route53_resolver_firewall_rule_group_association") ? local.aws.route53_resolver_firewall_rule_group_association : null
  description = "Route 53 Resolver"
}

output "route53_resolver_query_log_config" {
  value       = contains(var.resource_types, "route53_resolver_query_log_config") ? local.aws.route53_resolver_query_log_config : null
  description = "Route 53 Resolver"
}

output "route53_resolver_query_log_config_association" {
  value       = contains(var.resource_types, "route53_resolver_query_log_config_association") ? local.aws.route53_resolver_query_log_config_association : null
  description = "Route 53 Resolver"
}

output "route53_resolver_rule" {
  value       = contains(var.resource_types, "route53_resolver_rule") ? local.aws.route53_resolver_rule : null
  description = "Route 53 Resolver"
}

output "route53_resolver_rule_association" {
  value       = contains(var.resource_types, "route53_resolver_rule_association") ? local.aws.route53_resolver_rule_association : null
  description = "Route 53 Resolver"
}

output "route53_traffic_policy" {
  value       = contains(var.resource_types, "route53_traffic_policy") ? local.aws.route53_traffic_policy : null
  description = "Route 53"
}

output "route53_traffic_policy_instance" {
  value       = contains(var.resource_types, "route53_traffic_policy_instance") ? local.aws.route53_traffic_policy_instance : null
  description = "Route 53"
}

output "route53_vpc_association_authorization" {
  value       = contains(var.resource_types, "route53_vpc_association_authorization") ? local.aws.route53_vpc_association_authorization : null
  description = "Route 53"
}

output "route53_zone" {
  value       = contains(var.resource_types, "route53_zone") ? local.aws.route53_zone : null
  description = "Route 53"
}

output "route53_zone_association" {
  value       = contains(var.resource_types, "route53_zone_association") ? local.aws.route53_zone_association : null
  description = "Route 53"
}

output "route53domains_delegation_signer_record" {
  value       = contains(var.resource_types, "route53domains_delegation_signer_record") ? local.aws.route53domains_delegation_signer_record : null
  description = "Route 53 Domains"
}

output "route53domains_domain" {
  value       = contains(var.resource_types, "route53domains_domain") ? local.aws.route53domains_domain : null
  description = "Route 53 Domains"
}

output "route53domains_registered_domain" {
  value       = contains(var.resource_types, "route53domains_registered_domain") ? local.aws.route53domains_registered_domain : null
  description = "Route 53 Domains"
}

output "route53profiles_association" {
  value       = contains(var.resource_types, "route53profiles_association") ? local.aws.route53profiles_association : null
  description = "Route 53 Profiles"
}

output "route53profiles_profile" {
  value       = contains(var.resource_types, "route53profiles_profile") ? local.aws.route53profiles_profile : null
  description = "Route 53 Profiles"
}

output "route53profiles_resource_association" {
  value       = contains(var.resource_types, "route53profiles_resource_association") ? local.aws.route53profiles_resource_association : null
  description = "Route 53 Profiles"
}

output "route53recoverycontrolconfig_cluster" {
  value       = contains(var.resource_types, "route53recoverycontrolconfig_cluster") ? local.aws.route53recoverycontrolconfig_cluster : null
  description = "Route 53 Recovery Control Config"
}

output "route53recoverycontrolconfig_control_panel" {
  value       = contains(var.resource_types, "route53recoverycontrolconfig_control_panel") ? local.aws.route53recoverycontrolconfig_control_panel : null
  description = "Route 53 Recovery Control Config"
}

output "route53recoverycontrolconfig_routing_control" {
  value       = contains(var.resource_types, "route53recoverycontrolconfig_routing_control") ? local.aws.route53recoverycontrolconfig_routing_control : null
  description = "Route 53 Recovery Control Config"
}

output "route53recoverycontrolconfig_safety_rule" {
  value       = contains(var.resource_types, "route53recoverycontrolconfig_safety_rule") ? local.aws.route53recoverycontrolconfig_safety_rule : null
  description = "Route 53 Recovery Control Config"
}

output "route53recoveryreadiness_cell" {
  value       = contains(var.resource_types, "route53recoveryreadiness_cell") ? local.aws.route53recoveryreadiness_cell : null
  description = "Route 53 Recovery Readiness"
}

output "route53recoveryreadiness_readiness_check" {
  value       = contains(var.resource_types, "route53recoveryreadiness_readiness_check") ? local.aws.route53recoveryreadiness_readiness_check : null
  description = "Route 53 Recovery Readiness"
}

output "route53recoveryreadiness_recovery_group" {
  value       = contains(var.resource_types, "route53recoveryreadiness_recovery_group") ? local.aws.route53recoveryreadiness_recovery_group : null
  description = "Route 53 Recovery Readiness"
}

output "route53recoveryreadiness_resource_set" {
  value       = contains(var.resource_types, "route53recoveryreadiness_resource_set") ? local.aws.route53recoveryreadiness_resource_set : null
  description = "Route 53 Recovery Readiness"
}

output "route_table" {
  value       = contains(var.resource_types, "route_table") ? local.aws.route_table : null
  description = "Virtual Private Cloud"
}

output "route_table_association" {
  value       = contains(var.resource_types, "route_table_association") ? local.aws.route_table_association : null
  description = "Virtual Private Cloud"
}

output "rum_app_monitor" {
  value       = contains(var.resource_types, "rum_app_monitor") ? local.aws.rum_app_monitor : null
  description = "CloudWatch RUM"
}

output "rum_metrics_destination" {
  value       = contains(var.resource_types, "rum_metrics_destination") ? local.aws.rum_metrics_destination : null
  description = "CloudWatch RUM"
}

output "s3_access_point" {
  value       = contains(var.resource_types, "s3_access_point") ? local.aws.s3_access_point : null
  description = "S3 Control"
}

output "s3_account_public_access_block" {
  value       = contains(var.resource_types, "s3_account_public_access_block") ? local.aws.s3_account_public_access_block : null
  description = "S3 Control"
}

output "s3_bucket" {
  value       = contains(var.resource_types, "s3_bucket") ? local.aws.s3_bucket : null
  description = "Simple Storage"
}

output "s3_bucket_accelerate_configuration" {
  value       = contains(var.resource_types, "s3_bucket_accelerate_configuration") ? local.aws.s3_bucket_accelerate_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_acl" {
  value       = contains(var.resource_types, "s3_bucket_acl") ? local.aws.s3_bucket_acl : null
  description = "Simple Storage"
}

output "s3_bucket_analytics_configuration" {
  value       = contains(var.resource_types, "s3_bucket_analytics_configuration") ? local.aws.s3_bucket_analytics_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_cors_configuration" {
  value       = contains(var.resource_types, "s3_bucket_cors_configuration") ? local.aws.s3_bucket_cors_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_intelligent_tiering_configuration" {
  value       = contains(var.resource_types, "s3_bucket_intelligent_tiering_configuration") ? local.aws.s3_bucket_intelligent_tiering_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_inventory" {
  value       = contains(var.resource_types, "s3_bucket_inventory") ? local.aws.s3_bucket_inventory : null
  description = "Simple Storage"
}

output "s3_bucket_lifecycle_configuration" {
  value       = contains(var.resource_types, "s3_bucket_lifecycle_configuration") ? local.aws.s3_bucket_lifecycle_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_logging" {
  value       = contains(var.resource_types, "s3_bucket_logging") ? local.aws.s3_bucket_logging : null
  description = "Simple Storage"
}

output "s3_bucket_metric" {
  value       = contains(var.resource_types, "s3_bucket_metric") ? local.aws.s3_bucket_metric : null
  description = "Simple Storage"
}

output "s3_bucket_notification" {
  value       = contains(var.resource_types, "s3_bucket_notification") ? local.aws.s3_bucket_notification : null
  description = "Simple Storage"
}

output "s3_bucket_object" {
  value       = contains(var.resource_types, "s3_bucket_object") ? local.aws.s3_bucket_object : null
  description = "Simple Storage"
}

output "s3_bucket_object_lock_configuration" {
  value       = contains(var.resource_types, "s3_bucket_object_lock_configuration") ? local.aws.s3_bucket_object_lock_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_ownership_controls" {
  value       = contains(var.resource_types, "s3_bucket_ownership_controls") ? local.aws.s3_bucket_ownership_controls : null
  description = "Simple Storage"
}

output "s3_bucket_policy" {
  value       = contains(var.resource_types, "s3_bucket_policy") ? local.aws.s3_bucket_policy : null
  description = "Simple Storage"
}

output "s3_bucket_public_access_block" {
  value       = contains(var.resource_types, "s3_bucket_public_access_block") ? local.aws.s3_bucket_public_access_block : null
  description = "Simple Storage"
}

output "s3_bucket_replication_configuration" {
  value       = contains(var.resource_types, "s3_bucket_replication_configuration") ? local.aws.s3_bucket_replication_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_request_payment_configuration" {
  value       = contains(var.resource_types, "s3_bucket_request_payment_configuration") ? local.aws.s3_bucket_request_payment_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_server_side_encryption_configuration" {
  value       = contains(var.resource_types, "s3_bucket_server_side_encryption_configuration") ? local.aws.s3_bucket_server_side_encryption_configuration : null
  description = "Simple Storage"
}

output "s3_bucket_versioning" {
  value       = contains(var.resource_types, "s3_bucket_versioning") ? local.aws.s3_bucket_versioning : null
  description = "Simple Storage"
}

output "s3_bucket_website_configuration" {
  value       = contains(var.resource_types, "s3_bucket_website_configuration") ? local.aws.s3_bucket_website_configuration : null
  description = "Simple Storage"
}

output "s3_directory_bucket" {
  value       = contains(var.resource_types, "s3_directory_bucket") ? local.aws.s3_directory_bucket : null
  description = "Simple Storage"
}

output "s3_object" {
  value       = contains(var.resource_types, "s3_object") ? local.aws.s3_object : null
  description = "Simple Storage"
}

output "s3_object_copy" {
  value       = contains(var.resource_types, "s3_object_copy") ? local.aws.s3_object_copy : null
  description = "Simple Storage"
}

output "s3control_access_grant" {
  value       = contains(var.resource_types, "s3control_access_grant") ? local.aws.s3control_access_grant : null
  description = "S3 Control"
}

output "s3control_access_grants_instance" {
  value       = contains(var.resource_types, "s3control_access_grants_instance") ? local.aws.s3control_access_grants_instance : null
  description = "S3 Control"
}

output "s3control_access_grants_instance_resource_policy" {
  value       = contains(var.resource_types, "s3control_access_grants_instance_resource_policy") ? local.aws.s3control_access_grants_instance_resource_policy : null
  description = "S3 Control"
}

output "s3control_access_grants_location" {
  value       = contains(var.resource_types, "s3control_access_grants_location") ? local.aws.s3control_access_grants_location : null
  description = "S3 Control"
}

output "s3control_access_point_policy" {
  value       = contains(var.resource_types, "s3control_access_point_policy") ? local.aws.s3control_access_point_policy : null
  description = "S3 Control"
}

output "s3control_bucket" {
  value       = contains(var.resource_types, "s3control_bucket") ? local.aws.s3control_bucket : null
  description = "S3 Control"
}

output "s3control_bucket_lifecycle_configuration" {
  value       = contains(var.resource_types, "s3control_bucket_lifecycle_configuration") ? local.aws.s3control_bucket_lifecycle_configuration : null
  description = "S3 Control"
}

output "s3control_bucket_policy" {
  value       = contains(var.resource_types, "s3control_bucket_policy") ? local.aws.s3control_bucket_policy : null
  description = "S3 Control"
}

output "s3control_multi_region_access_point" {
  value       = contains(var.resource_types, "s3control_multi_region_access_point") ? local.aws.s3control_multi_region_access_point : null
  description = "S3 Control"
}

output "s3control_multi_region_access_point_policy" {
  value       = contains(var.resource_types, "s3control_multi_region_access_point_policy") ? local.aws.s3control_multi_region_access_point_policy : null
  description = "S3 Control"
}

output "s3control_object_lambda_access_point" {
  value       = contains(var.resource_types, "s3control_object_lambda_access_point") ? local.aws.s3control_object_lambda_access_point : null
  description = "S3 Control"
}

output "s3control_object_lambda_access_point_policy" {
  value       = contains(var.resource_types, "s3control_object_lambda_access_point_policy") ? local.aws.s3control_object_lambda_access_point_policy : null
  description = "S3 Control"
}

output "s3control_storage_lens_configuration" {
  value       = contains(var.resource_types, "s3control_storage_lens_configuration") ? local.aws.s3control_storage_lens_configuration : null
  description = "S3 Control"
}

output "s3outposts_endpoint" {
  value       = contains(var.resource_types, "s3outposts_endpoint") ? local.aws.s3outposts_endpoint : null
  description = "S3 on Outposts"
}

output "s3tables_namespace" {
  value       = contains(var.resource_types, "s3tables_namespace") ? local.aws.s3tables_namespace : null
  description = "S3 Tables"
}

output "s3tables_table" {
  value       = contains(var.resource_types, "s3tables_table") ? local.aws.s3tables_table : null
  description = "S3 Tables"
}

output "s3tables_table_bucket" {
  value       = contains(var.resource_types, "s3tables_table_bucket") ? local.aws.s3tables_table_bucket : null
  description = "S3 Tables"
}

output "s3tables_table_bucket_policy" {
  value       = contains(var.resource_types, "s3tables_table_bucket_policy") ? local.aws.s3tables_table_bucket_policy : null
  description = "S3 Tables"
}

output "s3tables_table_policy" {
  value       = contains(var.resource_types, "s3tables_table_policy") ? local.aws.s3tables_table_policy : null
  description = "S3 Tables"
}

output "sagemaker_app" {
  value       = contains(var.resource_types, "sagemaker_app") ? local.aws.sagemaker_app : null
  description = "SageMaker AI"
}

output "sagemaker_app_image_config" {
  value       = contains(var.resource_types, "sagemaker_app_image_config") ? local.aws.sagemaker_app_image_config : null
  description = "SageMaker AI"
}

output "sagemaker_code_repository" {
  value       = contains(var.resource_types, "sagemaker_code_repository") ? local.aws.sagemaker_code_repository : null
  description = "SageMaker AI"
}

output "sagemaker_data_quality_job_definition" {
  value       = contains(var.resource_types, "sagemaker_data_quality_job_definition") ? local.aws.sagemaker_data_quality_job_definition : null
  description = "SageMaker AI"
}

output "sagemaker_device" {
  value       = contains(var.resource_types, "sagemaker_device") ? local.aws.sagemaker_device : null
  description = "SageMaker AI"
}

output "sagemaker_device_fleet" {
  value       = contains(var.resource_types, "sagemaker_device_fleet") ? local.aws.sagemaker_device_fleet : null
  description = "SageMaker AI"
}

output "sagemaker_domain" {
  value       = contains(var.resource_types, "sagemaker_domain") ? local.aws.sagemaker_domain : null
  description = "SageMaker AI"
}

output "sagemaker_endpoint" {
  value       = contains(var.resource_types, "sagemaker_endpoint") ? local.aws.sagemaker_endpoint : null
  description = "SageMaker AI"
}

output "sagemaker_endpoint_configuration" {
  value       = contains(var.resource_types, "sagemaker_endpoint_configuration") ? local.aws.sagemaker_endpoint_configuration : null
  description = "SageMaker AI"
}

output "sagemaker_feature_group" {
  value       = contains(var.resource_types, "sagemaker_feature_group") ? local.aws.sagemaker_feature_group : null
  description = "SageMaker AI"
}

output "sagemaker_flow_definition" {
  value       = contains(var.resource_types, "sagemaker_flow_definition") ? local.aws.sagemaker_flow_definition : null
  description = "SageMaker AI"
}

output "sagemaker_hub" {
  value       = contains(var.resource_types, "sagemaker_hub") ? local.aws.sagemaker_hub : null
  description = "SageMaker AI"
}

output "sagemaker_human_task_ui" {
  value       = contains(var.resource_types, "sagemaker_human_task_ui") ? local.aws.sagemaker_human_task_ui : null
  description = "SageMaker AI"
}

output "sagemaker_image" {
  value       = contains(var.resource_types, "sagemaker_image") ? local.aws.sagemaker_image : null
  description = "SageMaker AI"
}

output "sagemaker_image_version" {
  value       = contains(var.resource_types, "sagemaker_image_version") ? local.aws.sagemaker_image_version : null
  description = "SageMaker AI"
}

output "sagemaker_mlflow_tracking_server" {
  value       = contains(var.resource_types, "sagemaker_mlflow_tracking_server") ? local.aws.sagemaker_mlflow_tracking_server : null
  description = "SageMaker AI"
}

output "sagemaker_model" {
  value       = contains(var.resource_types, "sagemaker_model") ? local.aws.sagemaker_model : null
  description = "SageMaker AI"
}

output "sagemaker_model_package_group" {
  value       = contains(var.resource_types, "sagemaker_model_package_group") ? local.aws.sagemaker_model_package_group : null
  description = "SageMaker AI"
}

output "sagemaker_model_package_group_policy" {
  value       = contains(var.resource_types, "sagemaker_model_package_group_policy") ? local.aws.sagemaker_model_package_group_policy : null
  description = "SageMaker AI"
}

output "sagemaker_monitoring_schedule" {
  value       = contains(var.resource_types, "sagemaker_monitoring_schedule") ? local.aws.sagemaker_monitoring_schedule : null
  description = "SageMaker AI"
}

output "sagemaker_notebook_instance" {
  value       = contains(var.resource_types, "sagemaker_notebook_instance") ? local.aws.sagemaker_notebook_instance : null
  description = "SageMaker AI"
}

output "sagemaker_notebook_instance_lifecycle_configuration" {
  value       = contains(var.resource_types, "sagemaker_notebook_instance_lifecycle_configuration") ? local.aws.sagemaker_notebook_instance_lifecycle_configuration : null
  description = "SageMaker AI"
}

output "sagemaker_pipeline" {
  value       = contains(var.resource_types, "sagemaker_pipeline") ? local.aws.sagemaker_pipeline : null
  description = "SageMaker AI"
}

output "sagemaker_project" {
  value       = contains(var.resource_types, "sagemaker_project") ? local.aws.sagemaker_project : null
  description = "SageMaker AI"
}

output "sagemaker_servicecatalog_portfolio_status" {
  value       = contains(var.resource_types, "sagemaker_servicecatalog_portfolio_status") ? local.aws.sagemaker_servicecatalog_portfolio_status : null
  description = "SageMaker AI"
}

output "sagemaker_space" {
  value       = contains(var.resource_types, "sagemaker_space") ? local.aws.sagemaker_space : null
  description = "SageMaker AI"
}

output "sagemaker_studio_lifecycle_config" {
  value       = contains(var.resource_types, "sagemaker_studio_lifecycle_config") ? local.aws.sagemaker_studio_lifecycle_config : null
  description = "SageMaker AI"
}

output "sagemaker_user_profile" {
  value       = contains(var.resource_types, "sagemaker_user_profile") ? local.aws.sagemaker_user_profile : null
  description = "SageMaker AI"
}

output "sagemaker_workforce" {
  value       = contains(var.resource_types, "sagemaker_workforce") ? local.aws.sagemaker_workforce : null
  description = "SageMaker AI"
}

output "sagemaker_workteam" {
  value       = contains(var.resource_types, "sagemaker_workteam") ? local.aws.sagemaker_workteam : null
  description = "SageMaker AI"
}

output "scheduler_schedule" {
  value       = contains(var.resource_types, "scheduler_schedule") ? local.aws.scheduler_schedule : null
  description = "EventBridge Scheduler"
}

output "scheduler_schedule_group" {
  value       = contains(var.resource_types, "scheduler_schedule_group") ? local.aws.scheduler_schedule_group : null
  description = "EventBridge Scheduler"
}

output "schemas_discoverer" {
  value       = contains(var.resource_types, "schemas_discoverer") ? local.aws.schemas_discoverer : null
  description = "EventBridge Schemas"
}

output "schemas_registry" {
  value       = contains(var.resource_types, "schemas_registry") ? local.aws.schemas_registry : null
  description = "EventBridge Schemas"
}

output "schemas_registry_policy" {
  value       = contains(var.resource_types, "schemas_registry_policy") ? local.aws.schemas_registry_policy : null
  description = "EventBridge Schemas"
}

output "schemas_schema" {
  value       = contains(var.resource_types, "schemas_schema") ? local.aws.schemas_schema : null
  description = "EventBridge Schemas"
}

output "secretsmanager_secret" {
  value       = contains(var.resource_types, "secretsmanager_secret") ? local.aws.secretsmanager_secret : null
  description = "Secrets Manager"
}

output "secretsmanager_secret_policy" {
  value       = contains(var.resource_types, "secretsmanager_secret_policy") ? local.aws.secretsmanager_secret_policy : null
  description = "Secrets Manager"
}

output "secretsmanager_secret_rotation" {
  value       = contains(var.resource_types, "secretsmanager_secret_rotation") ? local.aws.secretsmanager_secret_rotation : null
  description = "Secrets Manager"
}

output "secretsmanager_secret_version" {
  value       = contains(var.resource_types, "secretsmanager_secret_version") ? local.aws.secretsmanager_secret_version : null
  description = "Secrets Manager"
}

output "security_group" {
  value       = contains(var.resource_types, "security_group") ? local.aws.security_group : null
  description = "Virtual Private Cloud"
}

output "security_group_rule" {
  value       = contains(var.resource_types, "security_group_rule") ? local.aws.security_group_rule : null
  description = "Virtual Private Cloud"
}

output "securityhub_account" {
  value       = contains(var.resource_types, "securityhub_account") ? local.aws.securityhub_account : null
  description = "Security Hub"
}

output "securityhub_action_target" {
  value       = contains(var.resource_types, "securityhub_action_target") ? local.aws.securityhub_action_target : null
  description = "Security Hub"
}

output "securityhub_automation_rule" {
  value       = contains(var.resource_types, "securityhub_automation_rule") ? local.aws.securityhub_automation_rule : null
  description = "Security Hub"
}

output "securityhub_configuration_policy" {
  value       = contains(var.resource_types, "securityhub_configuration_policy") ? local.aws.securityhub_configuration_policy : null
  description = "Security Hub"
}

output "securityhub_configuration_policy_association" {
  value       = contains(var.resource_types, "securityhub_configuration_policy_association") ? local.aws.securityhub_configuration_policy_association : null
  description = "Security Hub"
}

output "securityhub_finding_aggregator" {
  value       = contains(var.resource_types, "securityhub_finding_aggregator") ? local.aws.securityhub_finding_aggregator : null
  description = "Security Hub"
}

output "securityhub_insight" {
  value       = contains(var.resource_types, "securityhub_insight") ? local.aws.securityhub_insight : null
  description = "Security Hub"
}

output "securityhub_invite_accepter" {
  value       = contains(var.resource_types, "securityhub_invite_accepter") ? local.aws.securityhub_invite_accepter : null
  description = "Security Hub"
}

output "securityhub_member" {
  value       = contains(var.resource_types, "securityhub_member") ? local.aws.securityhub_member : null
  description = "Security Hub"
}

output "securityhub_organization_admin_account" {
  value       = contains(var.resource_types, "securityhub_organization_admin_account") ? local.aws.securityhub_organization_admin_account : null
  description = "Security Hub"
}

output "securityhub_organization_configuration" {
  value       = contains(var.resource_types, "securityhub_organization_configuration") ? local.aws.securityhub_organization_configuration : null
  description = "Security Hub"
}

output "securityhub_product_subscription" {
  value       = contains(var.resource_types, "securityhub_product_subscription") ? local.aws.securityhub_product_subscription : null
  description = "Security Hub"
}

output "securityhub_standards_control" {
  value       = contains(var.resource_types, "securityhub_standards_control") ? local.aws.securityhub_standards_control : null
  description = "Security Hub"
}

output "securityhub_standards_control_association" {
  value       = contains(var.resource_types, "securityhub_standards_control_association") ? local.aws.securityhub_standards_control_association : null
  description = "Security Hub"
}

output "securityhub_standards_subscription" {
  value       = contains(var.resource_types, "securityhub_standards_subscription") ? local.aws.securityhub_standards_subscription : null
  description = "Security Hub"
}

output "securitylake_aws_log_source" {
  value       = contains(var.resource_types, "securitylake_aws_log_source") ? local.aws.securitylake_aws_log_source : null
  description = "Security Lake"
}

output "securitylake_custom_log_source" {
  value       = contains(var.resource_types, "securitylake_custom_log_source") ? local.aws.securitylake_custom_log_source : null
  description = "Security Lake"
}

output "securitylake_data_lake" {
  value       = contains(var.resource_types, "securitylake_data_lake") ? local.aws.securitylake_data_lake : null
  description = "Security Lake"
}

output "securitylake_subscriber" {
  value       = contains(var.resource_types, "securitylake_subscriber") ? local.aws.securitylake_subscriber : null
  description = "Security Lake"
}

output "securitylake_subscriber_notification" {
  value       = contains(var.resource_types, "securitylake_subscriber_notification") ? local.aws.securitylake_subscriber_notification : null
  description = "Security Lake"
}

output "serverlessapplicationrepository_cloudformation_stack" {
  value       = contains(var.resource_types, "serverlessapplicationrepository_cloudformation_stack") ? local.aws.serverlessapplicationrepository_cloudformation_stack : null
  description = "Serverless Application Repository"
}

output "service_discovery_http_namespace" {
  value       = contains(var.resource_types, "service_discovery_http_namespace") ? local.aws.service_discovery_http_namespace : null
  description = "Cloud Map"
}

output "service_discovery_instance" {
  value       = contains(var.resource_types, "service_discovery_instance") ? local.aws.service_discovery_instance : null
  description = "Cloud Map"
}

output "service_discovery_private_dns_namespace" {
  value       = contains(var.resource_types, "service_discovery_private_dns_namespace") ? local.aws.service_discovery_private_dns_namespace : null
  description = "Cloud Map"
}

output "service_discovery_public_dns_namespace" {
  value       = contains(var.resource_types, "service_discovery_public_dns_namespace") ? local.aws.service_discovery_public_dns_namespace : null
  description = "Cloud Map"
}

output "service_discovery_service" {
  value       = contains(var.resource_types, "service_discovery_service") ? local.aws.service_discovery_service : null
  description = "Cloud Map"
}

output "servicecatalog_budget_resource_association" {
  value       = contains(var.resource_types, "servicecatalog_budget_resource_association") ? local.aws.servicecatalog_budget_resource_association : null
  description = "Service Catalog"
}

output "servicecatalog_constraint" {
  value       = contains(var.resource_types, "servicecatalog_constraint") ? local.aws.servicecatalog_constraint : null
  description = "Service Catalog"
}

output "servicecatalog_organizations_access" {
  value       = contains(var.resource_types, "servicecatalog_organizations_access") ? local.aws.servicecatalog_organizations_access : null
  description = "Service Catalog"
}

output "servicecatalog_portfolio" {
  value       = contains(var.resource_types, "servicecatalog_portfolio") ? local.aws.servicecatalog_portfolio : null
  description = "Service Catalog"
}

output "servicecatalog_portfolio_share" {
  value       = contains(var.resource_types, "servicecatalog_portfolio_share") ? local.aws.servicecatalog_portfolio_share : null
  description = "Service Catalog"
}

output "servicecatalog_principal_portfolio_association" {
  value       = contains(var.resource_types, "servicecatalog_principal_portfolio_association") ? local.aws.servicecatalog_principal_portfolio_association : null
  description = "Service Catalog"
}

output "servicecatalog_product" {
  value       = contains(var.resource_types, "servicecatalog_product") ? local.aws.servicecatalog_product : null
  description = "Service Catalog"
}

output "servicecatalog_product_portfolio_association" {
  value       = contains(var.resource_types, "servicecatalog_product_portfolio_association") ? local.aws.servicecatalog_product_portfolio_association : null
  description = "Service Catalog"
}

output "servicecatalog_provisioned_product" {
  value       = contains(var.resource_types, "servicecatalog_provisioned_product") ? local.aws.servicecatalog_provisioned_product : null
  description = "Service Catalog"
}

output "servicecatalog_provisioning_artifact" {
  value       = contains(var.resource_types, "servicecatalog_provisioning_artifact") ? local.aws.servicecatalog_provisioning_artifact : null
  description = "Service Catalog"
}

output "servicecatalog_service_action" {
  value       = contains(var.resource_types, "servicecatalog_service_action") ? local.aws.servicecatalog_service_action : null
  description = "Service Catalog"
}

output "servicecatalog_tag_option" {
  value       = contains(var.resource_types, "servicecatalog_tag_option") ? local.aws.servicecatalog_tag_option : null
  description = "Service Catalog"
}

output "servicecatalog_tag_option_resource_association" {
  value       = contains(var.resource_types, "servicecatalog_tag_option_resource_association") ? local.aws.servicecatalog_tag_option_resource_association : null
  description = "Service Catalog"
}

output "servicecatalogappregistry_application" {
  value       = contains(var.resource_types, "servicecatalogappregistry_application") ? local.aws.servicecatalogappregistry_application : null
  description = "Service Catalog AppRegistry"
}

output "servicecatalogappregistry_attribute_group" {
  value       = contains(var.resource_types, "servicecatalogappregistry_attribute_group") ? local.aws.servicecatalogappregistry_attribute_group : null
  description = "Service Catalog AppRegistry"
}

output "servicecatalogappregistry_attribute_group_association" {
  value       = contains(var.resource_types, "servicecatalogappregistry_attribute_group_association") ? local.aws.servicecatalogappregistry_attribute_group_association : null
  description = "Service Catalog AppRegistry"
}

output "servicequotas_service_quota" {
  value       = contains(var.resource_types, "servicequotas_service_quota") ? local.aws.servicequotas_service_quota : null
  description = "Service Quotas"
}

output "servicequotas_template" {
  value       = contains(var.resource_types, "servicequotas_template") ? local.aws.servicequotas_template : null
  description = "Service Quotas"
}

output "servicequotas_template_association" {
  value       = contains(var.resource_types, "servicequotas_template_association") ? local.aws.servicequotas_template_association : null
  description = "Service Quotas"
}

output "ses_active_receipt_rule_set" {
  value       = contains(var.resource_types, "ses_active_receipt_rule_set") ? local.aws.ses_active_receipt_rule_set : null
  description = "Simple Email"
}

output "ses_configuration_set" {
  value       = contains(var.resource_types, "ses_configuration_set") ? local.aws.ses_configuration_set : null
  description = "Simple Email"
}

output "ses_domain_dkim" {
  value       = contains(var.resource_types, "ses_domain_dkim") ? local.aws.ses_domain_dkim : null
  description = "Simple Email"
}

output "ses_domain_identity" {
  value       = contains(var.resource_types, "ses_domain_identity") ? local.aws.ses_domain_identity : null
  description = "Simple Email"
}

output "ses_domain_identity_verification" {
  value       = contains(var.resource_types, "ses_domain_identity_verification") ? local.aws.ses_domain_identity_verification : null
  description = "Simple Email"
}

output "ses_domain_mail_from" {
  value       = contains(var.resource_types, "ses_domain_mail_from") ? local.aws.ses_domain_mail_from : null
  description = "Simple Email"
}

output "ses_email_identity" {
  value       = contains(var.resource_types, "ses_email_identity") ? local.aws.ses_email_identity : null
  description = "Simple Email"
}

output "ses_event_destination" {
  value       = contains(var.resource_types, "ses_event_destination") ? local.aws.ses_event_destination : null
  description = "Simple Email"
}

output "ses_identity_notification_topic" {
  value       = contains(var.resource_types, "ses_identity_notification_topic") ? local.aws.ses_identity_notification_topic : null
  description = "Simple Email"
}

output "ses_identity_policy" {
  value       = contains(var.resource_types, "ses_identity_policy") ? local.aws.ses_identity_policy : null
  description = "Simple Email"
}

output "ses_receipt_filter" {
  value       = contains(var.resource_types, "ses_receipt_filter") ? local.aws.ses_receipt_filter : null
  description = "Simple Email"
}

output "ses_receipt_rule" {
  value       = contains(var.resource_types, "ses_receipt_rule") ? local.aws.ses_receipt_rule : null
  description = "Simple Email"
}

output "ses_receipt_rule_set" {
  value       = contains(var.resource_types, "ses_receipt_rule_set") ? local.aws.ses_receipt_rule_set : null
  description = "Simple Email"
}

output "ses_template" {
  value       = contains(var.resource_types, "ses_template") ? local.aws.ses_template : null
  description = "Simple Email"
}

output "sesv2_account_suppression_attributes" {
  value       = contains(var.resource_types, "sesv2_account_suppression_attributes") ? local.aws.sesv2_account_suppression_attributes : null
  description = "Simple Email V2"
}

output "sesv2_account_vdm_attributes" {
  value       = contains(var.resource_types, "sesv2_account_vdm_attributes") ? local.aws.sesv2_account_vdm_attributes : null
  description = "Simple Email V2"
}

output "sesv2_configuration_set" {
  value       = contains(var.resource_types, "sesv2_configuration_set") ? local.aws.sesv2_configuration_set : null
  description = "Simple Email V2"
}

output "sesv2_configuration_set_event_destination" {
  value       = contains(var.resource_types, "sesv2_configuration_set_event_destination") ? local.aws.sesv2_configuration_set_event_destination : null
  description = "Simple Email V2"
}

output "sesv2_contact_list" {
  value       = contains(var.resource_types, "sesv2_contact_list") ? local.aws.sesv2_contact_list : null
  description = "Simple Email V2"
}

output "sesv2_dedicated_ip_assignment" {
  value       = contains(var.resource_types, "sesv2_dedicated_ip_assignment") ? local.aws.sesv2_dedicated_ip_assignment : null
  description = "Simple Email V2"
}

output "sesv2_dedicated_ip_pool" {
  value       = contains(var.resource_types, "sesv2_dedicated_ip_pool") ? local.aws.sesv2_dedicated_ip_pool : null
  description = "Simple Email V2"
}

output "sesv2_email_identity" {
  value       = contains(var.resource_types, "sesv2_email_identity") ? local.aws.sesv2_email_identity : null
  description = "Simple Email V2"
}

output "sesv2_email_identity_feedback_attributes" {
  value       = contains(var.resource_types, "sesv2_email_identity_feedback_attributes") ? local.aws.sesv2_email_identity_feedback_attributes : null
  description = "Simple Email V2"
}

output "sesv2_email_identity_mail_from_attributes" {
  value       = contains(var.resource_types, "sesv2_email_identity_mail_from_attributes") ? local.aws.sesv2_email_identity_mail_from_attributes : null
  description = "Simple Email V2"
}

output "sesv2_email_identity_policy" {
  value       = contains(var.resource_types, "sesv2_email_identity_policy") ? local.aws.sesv2_email_identity_policy : null
  description = "Simple Email V2"
}

output "sfn_activity" {
  value       = contains(var.resource_types, "sfn_activity") ? local.aws.sfn_activity : null
  description = "Step Functions"
}

output "sfn_alias" {
  value       = contains(var.resource_types, "sfn_alias") ? local.aws.sfn_alias : null
  description = "Step Functions"
}

output "sfn_state_machine" {
  value       = contains(var.resource_types, "sfn_state_machine") ? local.aws.sfn_state_machine : null
  description = "Step Functions"
}

output "shield_application_layer_automatic_response" {
  value       = contains(var.resource_types, "shield_application_layer_automatic_response") ? local.aws.shield_application_layer_automatic_response : null
  description = "Shield"
}

output "shield_drt_access_log_bucket_association" {
  value       = contains(var.resource_types, "shield_drt_access_log_bucket_association") ? local.aws.shield_drt_access_log_bucket_association : null
  description = "Shield"
}

output "shield_drt_access_role_arn_association" {
  value       = contains(var.resource_types, "shield_drt_access_role_arn_association") ? local.aws.shield_drt_access_role_arn_association : null
  description = "Shield"
}

output "shield_proactive_engagement" {
  value       = contains(var.resource_types, "shield_proactive_engagement") ? local.aws.shield_proactive_engagement : null
  description = "Shield"
}

output "shield_protection" {
  value       = contains(var.resource_types, "shield_protection") ? local.aws.shield_protection : null
  description = "Shield"
}

output "shield_protection_group" {
  value       = contains(var.resource_types, "shield_protection_group") ? local.aws.shield_protection_group : null
  description = "Shield"
}

output "shield_protection_health_check_association" {
  value       = contains(var.resource_types, "shield_protection_health_check_association") ? local.aws.shield_protection_health_check_association : null
  description = "Shield"
}

output "shield_subscription" {
  value       = contains(var.resource_types, "shield_subscription") ? local.aws.shield_subscription : null
  description = "Shield"
}

output "signer_signing_job" {
  value       = contains(var.resource_types, "signer_signing_job") ? local.aws.signer_signing_job : null
  description = "Signer"
}

output "signer_signing_profile" {
  value       = contains(var.resource_types, "signer_signing_profile") ? local.aws.signer_signing_profile : null
  description = "Signer"
}

output "signer_signing_profile_permission" {
  value       = contains(var.resource_types, "signer_signing_profile_permission") ? local.aws.signer_signing_profile_permission : null
  description = "Signer"
}

output "simpledb_domain" {
  value       = contains(var.resource_types, "simpledb_domain") ? local.aws.simpledb_domain : null
  description = "SimpleDB"
}

output "snapshot_create_volume_permission" {
  value       = contains(var.resource_types, "snapshot_create_volume_permission") ? local.aws.snapshot_create_volume_permission : null
  description = "EC2"
}

output "sns_platform_application" {
  value       = contains(var.resource_types, "sns_platform_application") ? local.aws.sns_platform_application : null
  description = "Simple Notification"
}

output "sns_sms_preferences" {
  value       = contains(var.resource_types, "sns_sms_preferences") ? local.aws.sns_sms_preferences : null
  description = "Simple Notification"
}

output "sns_topic" {
  value       = contains(var.resource_types, "sns_topic") ? local.aws.sns_topic : null
  description = "Simple Notification"
}

output "sns_topic_data_protection_policy" {
  value       = contains(var.resource_types, "sns_topic_data_protection_policy") ? local.aws.sns_topic_data_protection_policy : null
  description = "Simple Notification"
}

output "sns_topic_policy" {
  value       = contains(var.resource_types, "sns_topic_policy") ? local.aws.sns_topic_policy : null
  description = "Simple Notification"
}

output "sns_topic_subscription" {
  value       = contains(var.resource_types, "sns_topic_subscription") ? local.aws.sns_topic_subscription : null
  description = "Simple Notification"
}

output "spot_datafeed_subscription" {
  value       = contains(var.resource_types, "spot_datafeed_subscription") ? local.aws.spot_datafeed_subscription : null
  description = "Elastic Compute Cloud"
}

output "spot_fleet_request" {
  value       = contains(var.resource_types, "spot_fleet_request") ? local.aws.spot_fleet_request : null
  description = "Elastic Compute Cloud"
}

output "spot_instance_request" {
  value       = contains(var.resource_types, "spot_instance_request") ? local.aws.spot_instance_request : null
  description = "Elastic Compute Cloud"
}

output "sqs_queue" {
  value       = contains(var.resource_types, "sqs_queue") ? local.aws.sqs_queue : null
  description = "Simple Queue"
}

output "sqs_queue_policy" {
  value       = contains(var.resource_types, "sqs_queue_policy") ? local.aws.sqs_queue_policy : null
  description = "Simple Queue"
}

output "sqs_queue_redrive_allow_policy" {
  value       = contains(var.resource_types, "sqs_queue_redrive_allow_policy") ? local.aws.sqs_queue_redrive_allow_policy : null
  description = "Simple Queue"
}

output "sqs_queue_redrive_policy" {
  value       = contains(var.resource_types, "sqs_queue_redrive_policy") ? local.aws.sqs_queue_redrive_policy : null
  description = "Simple Queue"
}

output "ssm_activation" {
  value       = contains(var.resource_types, "ssm_activation") ? local.aws.ssm_activation : null
  description = "Systems Manager"
}

output "ssm_association" {
  value       = contains(var.resource_types, "ssm_association") ? local.aws.ssm_association : null
  description = "Systems Manager"
}

output "ssm_default_patch_baseline" {
  value       = contains(var.resource_types, "ssm_default_patch_baseline") ? local.aws.ssm_default_patch_baseline : null
  description = "Systems Manager"
}

output "ssm_document" {
  value       = contains(var.resource_types, "ssm_document") ? local.aws.ssm_document : null
  description = "Systems Manager"
}

output "ssm_maintenance_window" {
  value       = contains(var.resource_types, "ssm_maintenance_window") ? local.aws.ssm_maintenance_window : null
  description = "Systems Manager"
}

output "ssm_maintenance_window_target" {
  value       = contains(var.resource_types, "ssm_maintenance_window_target") ? local.aws.ssm_maintenance_window_target : null
  description = "Systems Manager"
}

output "ssm_maintenance_window_task" {
  value       = contains(var.resource_types, "ssm_maintenance_window_task") ? local.aws.ssm_maintenance_window_task : null
  description = "Systems Manager"
}

output "ssm_parameter" {
  value       = contains(var.resource_types, "ssm_parameter") ? local.aws.ssm_parameter : null
  description = "Systems Manager"
}

output "ssm_patch_baseline" {
  value       = contains(var.resource_types, "ssm_patch_baseline") ? local.aws.ssm_patch_baseline : null
  description = "Systems Manager"
}

output "ssm_patch_group" {
  value       = contains(var.resource_types, "ssm_patch_group") ? local.aws.ssm_patch_group : null
  description = "Systems Manager"
}

output "ssm_resource_data_sync" {
  value       = contains(var.resource_types, "ssm_resource_data_sync") ? local.aws.ssm_resource_data_sync : null
  description = "Systems Manager"
}

output "ssm_service_setting" {
  value       = contains(var.resource_types, "ssm_service_setting") ? local.aws.ssm_service_setting : null
  description = "Systems Manager"
}

output "ssmcontacts_contact" {
  value       = contains(var.resource_types, "ssmcontacts_contact") ? local.aws.ssmcontacts_contact : null
  description = "SSM Contacts"
}

output "ssmcontacts_contact_channel" {
  value       = contains(var.resource_types, "ssmcontacts_contact_channel") ? local.aws.ssmcontacts_contact_channel : null
  description = "SSM Contacts"
}

output "ssmcontacts_plan" {
  value       = contains(var.resource_types, "ssmcontacts_plan") ? local.aws.ssmcontacts_plan : null
  description = "SSM Contacts"
}

output "ssmcontacts_rotation" {
  value       = contains(var.resource_types, "ssmcontacts_rotation") ? local.aws.ssmcontacts_rotation : null
  description = "SSM Contacts"
}

output "ssmincidents_replication_set" {
  value       = contains(var.resource_types, "ssmincidents_replication_set") ? local.aws.ssmincidents_replication_set : null
  description = "SSM Incident Manager Incidents"
}

output "ssmincidents_response_plan" {
  value       = contains(var.resource_types, "ssmincidents_response_plan") ? local.aws.ssmincidents_response_plan : null
  description = "SSM Incident Manager Incidents"
}

output "ssmquicksetup_configuration_manager" {
  value       = contains(var.resource_types, "ssmquicksetup_configuration_manager") ? local.aws.ssmquicksetup_configuration_manager : null
  description = "SSM Quick Setup"
}

output "ssoadmin_account_assignment" {
  value       = contains(var.resource_types, "ssoadmin_account_assignment") ? local.aws.ssoadmin_account_assignment : null
  description = "SSO Admin"
}

output "ssoadmin_application" {
  value       = contains(var.resource_types, "ssoadmin_application") ? local.aws.ssoadmin_application : null
  description = "SSO Admin"
}

output "ssoadmin_application_access_scope" {
  value       = contains(var.resource_types, "ssoadmin_application_access_scope") ? local.aws.ssoadmin_application_access_scope : null
  description = "SSO Admin"
}

output "ssoadmin_application_assignment" {
  value       = contains(var.resource_types, "ssoadmin_application_assignment") ? local.aws.ssoadmin_application_assignment : null
  description = "SSO Admin"
}

output "ssoadmin_application_assignment_configuration" {
  value       = contains(var.resource_types, "ssoadmin_application_assignment_configuration") ? local.aws.ssoadmin_application_assignment_configuration : null
  description = "SSO Admin"
}

output "ssoadmin_customer_managed_policy_attachment" {
  value       = contains(var.resource_types, "ssoadmin_customer_managed_policy_attachment") ? local.aws.ssoadmin_customer_managed_policy_attachment : null
  description = "SSO Admin"
}

output "ssoadmin_instance_access_control_attributes" {
  value       = contains(var.resource_types, "ssoadmin_instance_access_control_attributes") ? local.aws.ssoadmin_instance_access_control_attributes : null
  description = "SSO Admin"
}

output "ssoadmin_managed_policy_attachment" {
  value       = contains(var.resource_types, "ssoadmin_managed_policy_attachment") ? local.aws.ssoadmin_managed_policy_attachment : null
  description = "SSO Admin"
}

output "ssoadmin_permission_set" {
  value       = contains(var.resource_types, "ssoadmin_permission_set") ? local.aws.ssoadmin_permission_set : null
  description = "SSO Admin"
}

output "ssoadmin_permission_set_inline_policy" {
  value       = contains(var.resource_types, "ssoadmin_permission_set_inline_policy") ? local.aws.ssoadmin_permission_set_inline_policy : null
  description = "SSO Admin"
}

output "ssoadmin_permissions_boundary_attachment" {
  value       = contains(var.resource_types, "ssoadmin_permissions_boundary_attachment") ? local.aws.ssoadmin_permissions_boundary_attachment : null
  description = "SSO Admin"
}

output "ssoadmin_trusted_token_issuer" {
  value       = contains(var.resource_types, "ssoadmin_trusted_token_issuer") ? local.aws.ssoadmin_trusted_token_issuer : null
  description = "SSO Admin"
}

output "storagegateway_cache" {
  value       = contains(var.resource_types, "storagegateway_cache") ? local.aws.storagegateway_cache : null
  description = "Storage Gateway"
}

output "storagegateway_cached_iscsi_volume" {
  value       = contains(var.resource_types, "storagegateway_cached_iscsi_volume") ? local.aws.storagegateway_cached_iscsi_volume : null
  description = "Storage Gateway"
}

output "storagegateway_file_system_association" {
  value       = contains(var.resource_types, "storagegateway_file_system_association") ? local.aws.storagegateway_file_system_association : null
  description = "Storage Gateway"
}

output "storagegateway_gateway" {
  value       = contains(var.resource_types, "storagegateway_gateway") ? local.aws.storagegateway_gateway : null
  description = "Storage Gateway"
}

output "storagegateway_nfs_file_share" {
  value       = contains(var.resource_types, "storagegateway_nfs_file_share") ? local.aws.storagegateway_nfs_file_share : null
  description = "Storage Gateway"
}

output "storagegateway_smb_file_share" {
  value       = contains(var.resource_types, "storagegateway_smb_file_share") ? local.aws.storagegateway_smb_file_share : null
  description = "Storage Gateway"
}

output "storagegateway_stored_iscsi_volume" {
  value       = contains(var.resource_types, "storagegateway_stored_iscsi_volume") ? local.aws.storagegateway_stored_iscsi_volume : null
  description = "Storage Gateway"
}

output "storagegateway_tape_pool" {
  value       = contains(var.resource_types, "storagegateway_tape_pool") ? local.aws.storagegateway_tape_pool : null
  description = "Storage Gateway"
}

output "storagegateway_upload_buffer" {
  value       = contains(var.resource_types, "storagegateway_upload_buffer") ? local.aws.storagegateway_upload_buffer : null
  description = "Storage Gateway"
}

output "storagegateway_working_storage" {
  value       = contains(var.resource_types, "storagegateway_working_storage") ? local.aws.storagegateway_working_storage : null
  description = "Storage Gateway"
}

output "subnet" {
  value       = contains(var.resource_types, "subnet") ? local.aws.subnet : null
  description = "Virtual Private Cloud"
}

output "swf_domain" {
  value       = contains(var.resource_types, "swf_domain") ? local.aws.swf_domain : null
  description = "Simple Workflow"
}

output "synthetics_canary" {
  value       = contains(var.resource_types, "synthetics_canary") ? local.aws.synthetics_canary : null
  description = "CloudWatch Synthetics"
}

output "synthetics_group" {
  value       = contains(var.resource_types, "synthetics_group") ? local.aws.synthetics_group : null
  description = "CloudWatch Synthetics"
}

output "synthetics_group_association" {
  value       = contains(var.resource_types, "synthetics_group_association") ? local.aws.synthetics_group_association : null
  description = "CloudWatch Synthetics"
}

output "timestreaminfluxdb_db_instance" {
  value       = contains(var.resource_types, "timestreaminfluxdb_db_instance") ? local.aws.timestreaminfluxdb_db_instance : null
  description = "Timestream for InfluxDB"
}

output "timestreamquery_scheduled_query" {
  value       = contains(var.resource_types, "timestreamquery_scheduled_query") ? local.aws.timestreamquery_scheduled_query : null
  description = "Timestream Query"
}

output "timestreamwrite_database" {
  value       = contains(var.resource_types, "timestreamwrite_database") ? local.aws.timestreamwrite_database : null
  description = "Timestream Write"
}

output "timestreamwrite_table" {
  value       = contains(var.resource_types, "timestreamwrite_table") ? local.aws.timestreamwrite_table : null
  description = "Timestream Write"
}

output "transcribe_language_model" {
  value       = contains(var.resource_types, "transcribe_language_model") ? local.aws.transcribe_language_model : null
  description = "Transcribe"
}

output "transcribe_medical_vocabulary" {
  value       = contains(var.resource_types, "transcribe_medical_vocabulary") ? local.aws.transcribe_medical_vocabulary : null
  description = "Transcribe"
}

output "transcribe_vocabulary" {
  value       = contains(var.resource_types, "transcribe_vocabulary") ? local.aws.transcribe_vocabulary : null
  description = "Transcribe"
}

output "transcribe_vocabulary_filter" {
  value       = contains(var.resource_types, "transcribe_vocabulary_filter") ? local.aws.transcribe_vocabulary_filter : null
  description = "Transcribe"
}

output "transfer_access" {
  value       = contains(var.resource_types, "transfer_access") ? local.aws.transfer_access : null
  description = "Transfer Family"
}

output "transfer_agreement" {
  value       = contains(var.resource_types, "transfer_agreement") ? local.aws.transfer_agreement : null
  description = "Transfer Family"
}

output "transfer_certificate" {
  value       = contains(var.resource_types, "transfer_certificate") ? local.aws.transfer_certificate : null
  description = "Transfer Family"
}

output "transfer_connector" {
  value       = contains(var.resource_types, "transfer_connector") ? local.aws.transfer_connector : null
  description = "Transfer Family"
}

output "transfer_profile" {
  value       = contains(var.resource_types, "transfer_profile") ? local.aws.transfer_profile : null
  description = "Transfer Family"
}

output "transfer_server" {
  value       = contains(var.resource_types, "transfer_server") ? local.aws.transfer_server : null
  description = "Transfer Family"
}

output "transfer_ssh_key" {
  value       = contains(var.resource_types, "transfer_ssh_key") ? local.aws.transfer_ssh_key : null
  description = "Transfer Family"
}

output "transfer_tag" {
  value       = contains(var.resource_types, "transfer_tag") ? local.aws.transfer_tag : null
  description = "Transfer Family"
}

output "transfer_user" {
  value       = contains(var.resource_types, "transfer_user") ? local.aws.transfer_user : null
  description = "Transfer Family"
}

output "transfer_workflow" {
  value       = contains(var.resource_types, "transfer_workflow") ? local.aws.transfer_workflow : null
  description = "Transfer Family"
}

output "verifiedaccess_endpoint" {
  value       = contains(var.resource_types, "verifiedaccess_endpoint") ? local.aws.verifiedaccess_endpoint : null
  description = "Verified Access"
}

output "verifiedaccess_group" {
  value       = contains(var.resource_types, "verifiedaccess_group") ? local.aws.verifiedaccess_group : null
  description = "Verified Access"
}

output "verifiedaccess_instance" {
  value       = contains(var.resource_types, "verifiedaccess_instance") ? local.aws.verifiedaccess_instance : null
  description = "Verified Access"
}

output "verifiedaccess_instance_logging_configuration" {
  value       = contains(var.resource_types, "verifiedaccess_instance_logging_configuration") ? local.aws.verifiedaccess_instance_logging_configuration : null
  description = "Verified Access"
}

output "verifiedaccess_instance_trust_provider_attachment" {
  value       = contains(var.resource_types, "verifiedaccess_instance_trust_provider_attachment") ? local.aws.verifiedaccess_instance_trust_provider_attachment : null
  description = "Verified Access"
}

output "verifiedaccess_trust_provider" {
  value       = contains(var.resource_types, "verifiedaccess_trust_provider") ? local.aws.verifiedaccess_trust_provider : null
  description = "Verified Access"
}

output "verifiedpermissions_identity_source" {
  value       = contains(var.resource_types, "verifiedpermissions_identity_source") ? local.aws.verifiedpermissions_identity_source : null
  description = "Verified Permissions"
}

output "verifiedpermissions_policy" {
  value       = contains(var.resource_types, "verifiedpermissions_policy") ? local.aws.verifiedpermissions_policy : null
  description = "Verified Permissions"
}

output "verifiedpermissions_policy_store" {
  value       = contains(var.resource_types, "verifiedpermissions_policy_store") ? local.aws.verifiedpermissions_policy_store : null
  description = "Verified Permissions"
}

output "verifiedpermissions_policy_template" {
  value       = contains(var.resource_types, "verifiedpermissions_policy_template") ? local.aws.verifiedpermissions_policy_template : null
  description = "Verified Permissions"
}

output "verifiedpermissions_schema" {
  value       = contains(var.resource_types, "verifiedpermissions_schema") ? local.aws.verifiedpermissions_schema : null
  description = "Verified Permissions"
}

output "volume_attachment" {
  value       = contains(var.resource_types, "volume_attachment") ? local.aws.volume_attachment : null
  description = "EC2"
}

output "vpc" {
  value       = contains(var.resource_types, "vpc") ? local.aws.vpc : null
  description = "Virtual Private Cloud"
}

output "vpc_block_public_access_exclusion" {
  value       = contains(var.resource_types, "vpc_block_public_access_exclusion") ? local.aws.vpc_block_public_access_exclusion : null
  description = "Virtual Private Cloud"
}

output "vpc_block_public_access_options" {
  value       = contains(var.resource_types, "vpc_block_public_access_options") ? local.aws.vpc_block_public_access_options : null
  description = "Virtual Private Cloud"
}

output "vpc_dhcp_options" {
  value       = contains(var.resource_types, "vpc_dhcp_options") ? local.aws.vpc_dhcp_options : null
  description = "Virtual Private Cloud"
}

output "vpc_dhcp_options_association" {
  value       = contains(var.resource_types, "vpc_dhcp_options_association") ? local.aws.vpc_dhcp_options_association : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint" {
  value       = contains(var.resource_types, "vpc_endpoint") ? local.aws.vpc_endpoint : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_connection_accepter" {
  value       = contains(var.resource_types, "vpc_endpoint_connection_accepter") ? local.aws.vpc_endpoint_connection_accepter : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_connection_notification" {
  value       = contains(var.resource_types, "vpc_endpoint_connection_notification") ? local.aws.vpc_endpoint_connection_notification : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_policy" {
  value       = contains(var.resource_types, "vpc_endpoint_policy") ? local.aws.vpc_endpoint_policy : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_private_dns" {
  value       = contains(var.resource_types, "vpc_endpoint_private_dns") ? local.aws.vpc_endpoint_private_dns : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_route_table_association" {
  value       = contains(var.resource_types, "vpc_endpoint_route_table_association") ? local.aws.vpc_endpoint_route_table_association : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_security_group_association" {
  value       = contains(var.resource_types, "vpc_endpoint_security_group_association") ? local.aws.vpc_endpoint_security_group_association : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_service" {
  value       = contains(var.resource_types, "vpc_endpoint_service") ? local.aws.vpc_endpoint_service : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_service_allowed_principal" {
  value       = contains(var.resource_types, "vpc_endpoint_service_allowed_principal") ? local.aws.vpc_endpoint_service_allowed_principal : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_service_private_dns_verification" {
  value       = contains(var.resource_types, "vpc_endpoint_service_private_dns_verification") ? local.aws.vpc_endpoint_service_private_dns_verification : null
  description = "Virtual Private Cloud"
}

output "vpc_endpoint_subnet_association" {
  value       = contains(var.resource_types, "vpc_endpoint_subnet_association") ? local.aws.vpc_endpoint_subnet_association : null
  description = "Virtual Private Cloud"
}

output "vpc_ipam" {
  value       = contains(var.resource_types, "vpc_ipam") ? local.aws.vpc_ipam : null
  description = "IP Address Manager"
}

output "vpc_ipam_organization_admin_account" {
  value       = contains(var.resource_types, "vpc_ipam_organization_admin_account") ? local.aws.vpc_ipam_organization_admin_account : null
  description = "IP Address Manager"
}

output "vpc_ipam_pool" {
  value       = contains(var.resource_types, "vpc_ipam_pool") ? local.aws.vpc_ipam_pool : null
  description = "IP Address Manager"
}

output "vpc_ipam_pool_cidr" {
  value       = contains(var.resource_types, "vpc_ipam_pool_cidr") ? local.aws.vpc_ipam_pool_cidr : null
  description = "IP Address Manager"
}

output "vpc_ipam_pool_cidr_allocation" {
  value       = contains(var.resource_types, "vpc_ipam_pool_cidr_allocation") ? local.aws.vpc_ipam_pool_cidr_allocation : null
  description = "IP Address Manager"
}

output "vpc_ipam_preview_next_cidr" {
  value       = contains(var.resource_types, "vpc_ipam_preview_next_cidr") ? local.aws.vpc_ipam_preview_next_cidr : null
  description = "IP Address Manager"
}

output "vpc_ipam_resource_discovery" {
  value       = contains(var.resource_types, "vpc_ipam_resource_discovery") ? local.aws.vpc_ipam_resource_discovery : null
  description = "IP Address Manager"
}

output "vpc_ipam_resource_discovery_association" {
  value       = contains(var.resource_types, "vpc_ipam_resource_discovery_association") ? local.aws.vpc_ipam_resource_discovery_association : null
  description = "IP Address Manager"
}

output "vpc_ipam_scope" {
  value       = contains(var.resource_types, "vpc_ipam_scope") ? local.aws.vpc_ipam_scope : null
  description = "IP Address Manager"
}

output "vpc_ipv4_cidr_block_association" {
  value       = contains(var.resource_types, "vpc_ipv4_cidr_block_association") ? local.aws.vpc_ipv4_cidr_block_association : null
  description = "Virtual Private Cloud"
}

output "vpc_ipv6_cidr_block_association" {
  value       = contains(var.resource_types, "vpc_ipv6_cidr_block_association") ? local.aws.vpc_ipv6_cidr_block_association : null
  description = "Virtual Private Cloud"
}

output "vpc_network_performance_metric_subscription" {
  value       = contains(var.resource_types, "vpc_network_performance_metric_subscription") ? local.aws.vpc_network_performance_metric_subscription : null
  description = "Virtual Private Cloud"
}

output "vpc_peering_connection" {
  value       = contains(var.resource_types, "vpc_peering_connection") ? local.aws.vpc_peering_connection : null
  description = "Virtual Private Cloud"
}

output "vpc_peering_connection_accepter" {
  value       = contains(var.resource_types, "vpc_peering_connection_accepter") ? local.aws.vpc_peering_connection_accepter : null
  description = "Virtual Private Cloud"
}

output "vpc_peering_connection_options" {
  value       = contains(var.resource_types, "vpc_peering_connection_options") ? local.aws.vpc_peering_connection_options : null
  description = "Virtual Private Cloud"
}

output "vpc_security_group_egress_rule" {
  value       = contains(var.resource_types, "vpc_security_group_egress_rule") ? local.aws.vpc_security_group_egress_rule : null
  description = "Virtual Private Cloud"
}

output "vpc_security_group_ingress_rule" {
  value       = contains(var.resource_types, "vpc_security_group_ingress_rule") ? local.aws.vpc_security_group_ingress_rule : null
  description = "Virtual Private Cloud"
}

output "vpc_security_group_vpc_association" {
  value       = contains(var.resource_types, "vpc_security_group_vpc_association") ? local.aws.vpc_security_group_vpc_association : null
  description = "Virtual Private Cloud"
}

output "vpclattice_access_log_subscription" {
  value       = contains(var.resource_types, "vpclattice_access_log_subscription") ? local.aws.vpclattice_access_log_subscription : null
  description = "VPC Lattice"
}

output "vpclattice_auth_policy" {
  value       = contains(var.resource_types, "vpclattice_auth_policy") ? local.aws.vpclattice_auth_policy : null
  description = "VPC Lattice"
}

output "vpclattice_listener" {
  value       = contains(var.resource_types, "vpclattice_listener") ? local.aws.vpclattice_listener : null
  description = "VPC Lattice"
}

output "vpclattice_listener_rule" {
  value       = contains(var.resource_types, "vpclattice_listener_rule") ? local.aws.vpclattice_listener_rule : null
  description = "VPC Lattice"
}

output "vpclattice_resource_configuration" {
  value       = contains(var.resource_types, "vpclattice_resource_configuration") ? local.aws.vpclattice_resource_configuration : null
  description = "VPC Lattice"
}

output "vpclattice_resource_gateway" {
  value       = contains(var.resource_types, "vpclattice_resource_gateway") ? local.aws.vpclattice_resource_gateway : null
  description = "VPC Lattice"
}

output "vpclattice_resource_policy" {
  value       = contains(var.resource_types, "vpclattice_resource_policy") ? local.aws.vpclattice_resource_policy : null
  description = "VPC Lattice"
}

output "vpclattice_service" {
  value       = contains(var.resource_types, "vpclattice_service") ? local.aws.vpclattice_service : null
  description = "VPC Lattice"
}

output "vpclattice_service_network" {
  value       = contains(var.resource_types, "vpclattice_service_network") ? local.aws.vpclattice_service_network : null
  description = "VPC Lattice"
}

output "vpclattice_service_network_resource_association" {
  value       = contains(var.resource_types, "vpclattice_service_network_resource_association") ? local.aws.vpclattice_service_network_resource_association : null
  description = "VPC Lattice"
}

output "vpclattice_service_network_service_association" {
  value       = contains(var.resource_types, "vpclattice_service_network_service_association") ? local.aws.vpclattice_service_network_service_association : null
  description = "VPC Lattice"
}

output "vpclattice_service_network_vpc_association" {
  value       = contains(var.resource_types, "vpclattice_service_network_vpc_association") ? local.aws.vpclattice_service_network_vpc_association : null
  description = "VPC Lattice"
}

output "vpclattice_target_group" {
  value       = contains(var.resource_types, "vpclattice_target_group") ? local.aws.vpclattice_target_group : null
  description = "VPC Lattice"
}

output "vpclattice_target_group_attachment" {
  value       = contains(var.resource_types, "vpclattice_target_group_attachment") ? local.aws.vpclattice_target_group_attachment : null
  description = "VPC Lattice"
}

output "vpn_connection" {
  value       = contains(var.resource_types, "vpn_connection") ? local.aws.vpn_connection : null
  description = "Site-to-Site"
}

output "vpn_connection_route" {
  value       = contains(var.resource_types, "vpn_connection_route") ? local.aws.vpn_connection_route : null
  description = "Site-to-Site"
}

output "vpn_gateway" {
  value       = contains(var.resource_types, "vpn_gateway") ? local.aws.vpn_gateway : null
  description = "Site-to-Site"
}

output "vpn_gateway_attachment" {
  value       = contains(var.resource_types, "vpn_gateway_attachment") ? local.aws.vpn_gateway_attachment : null
  description = "Site-to-Site"
}

output "vpn_gateway_route_propagation" {
  value       = contains(var.resource_types, "vpn_gateway_route_propagation") ? local.aws.vpn_gateway_route_propagation : null
  description = "Site-to-Site"
}

output "waf_byte_match_set" {
  value       = contains(var.resource_types, "waf_byte_match_set") ? local.aws.waf_byte_match_set : null
  description = "WAF Classic"
}

output "waf_geo_match_set" {
  value       = contains(var.resource_types, "waf_geo_match_set") ? local.aws.waf_geo_match_set : null
  description = "WAF Classic"
}

output "waf_ipset" {
  value       = contains(var.resource_types, "waf_ipset") ? local.aws.waf_ipset : null
  description = "WAF Classic"
}

output "waf_rate_based_rule" {
  value       = contains(var.resource_types, "waf_rate_based_rule") ? local.aws.waf_rate_based_rule : null
  description = "WAF Classic"
}

output "waf_regex_match_set" {
  value       = contains(var.resource_types, "waf_regex_match_set") ? local.aws.waf_regex_match_set : null
  description = "WAF Classic"
}

output "waf_regex_pattern_set" {
  value       = contains(var.resource_types, "waf_regex_pattern_set") ? local.aws.waf_regex_pattern_set : null
  description = "WAF Classic"
}

output "waf_rule" {
  value       = contains(var.resource_types, "waf_rule") ? local.aws.waf_rule : null
  description = "WAF Classic"
}

output "waf_rule_group" {
  value       = contains(var.resource_types, "waf_rule_group") ? local.aws.waf_rule_group : null
  description = "WAF Classic"
}

output "waf_size_constraint_set" {
  value       = contains(var.resource_types, "waf_size_constraint_set") ? local.aws.waf_size_constraint_set : null
  description = "WAF Classic"
}

output "waf_sql_injection_match_set" {
  value       = contains(var.resource_types, "waf_sql_injection_match_set") ? local.aws.waf_sql_injection_match_set : null
  description = "WAF Classic"
}

output "waf_web_acl" {
  value       = contains(var.resource_types, "waf_web_acl") ? local.aws.waf_web_acl : null
  description = "WAF Classic"
}

output "waf_xss_match_set" {
  value       = contains(var.resource_types, "waf_xss_match_set") ? local.aws.waf_xss_match_set : null
  description = "WAF Classic"
}

output "wafregional_byte_match_set" {
  value       = contains(var.resource_types, "wafregional_byte_match_set") ? local.aws.wafregional_byte_match_set : null
  description = "WAF Classic Regional"
}

output "wafregional_geo_match_set" {
  value       = contains(var.resource_types, "wafregional_geo_match_set") ? local.aws.wafregional_geo_match_set : null
  description = "WAF Classic Regional"
}

output "wafregional_ipset" {
  value       = contains(var.resource_types, "wafregional_ipset") ? local.aws.wafregional_ipset : null
  description = "WAF Classic Regional"
}

output "wafregional_rate_based_rule" {
  value       = contains(var.resource_types, "wafregional_rate_based_rule") ? local.aws.wafregional_rate_based_rule : null
  description = "WAF Classic Regional"
}

output "wafregional_regex_match_set" {
  value       = contains(var.resource_types, "wafregional_regex_match_set") ? local.aws.wafregional_regex_match_set : null
  description = "WAF Classic Regional"
}

output "wafregional_regex_pattern_set" {
  value       = contains(var.resource_types, "wafregional_regex_pattern_set") ? local.aws.wafregional_regex_pattern_set : null
  description = "WAF Classic Regional"
}

output "wafregional_rule" {
  value       = contains(var.resource_types, "wafregional_rule") ? local.aws.wafregional_rule : null
  description = "WAF Classic Regional"
}

output "wafregional_rule_group" {
  value       = contains(var.resource_types, "wafregional_rule_group") ? local.aws.wafregional_rule_group : null
  description = "WAF Classic Regional"
}

output "wafregional_size_constraint_set" {
  value       = contains(var.resource_types, "wafregional_size_constraint_set") ? local.aws.wafregional_size_constraint_set : null
  description = "WAF Classic Regional"
}

output "wafregional_sql_injection_match_set" {
  value       = contains(var.resource_types, "wafregional_sql_injection_match_set") ? local.aws.wafregional_sql_injection_match_set : null
  description = "WAF Classic Regional"
}

output "wafregional_web_acl" {
  value       = contains(var.resource_types, "wafregional_web_acl") ? local.aws.wafregional_web_acl : null
  description = "WAF Classic Regional"
}

output "wafregional_web_acl_association" {
  value       = contains(var.resource_types, "wafregional_web_acl_association") ? local.aws.wafregional_web_acl_association : null
  description = "WAF Classic Regional"
}

output "wafregional_xss_match_set" {
  value       = contains(var.resource_types, "wafregional_xss_match_set") ? local.aws.wafregional_xss_match_set : null
  description = "WAF Classic Regional"
}

output "wafv2_ip_set" {
  value       = contains(var.resource_types, "wafv2_ip_set") ? local.aws.wafv2_ip_set : null
  description = "WAF"
}

output "wafv2_regex_pattern_set" {
  value       = contains(var.resource_types, "wafv2_regex_pattern_set") ? local.aws.wafv2_regex_pattern_set : null
  description = "WAF"
}

output "wafv2_rule_group" {
  value       = contains(var.resource_types, "wafv2_rule_group") ? local.aws.wafv2_rule_group : null
  description = "WAF"
}

output "wafv2_web_acl" {
  value       = contains(var.resource_types, "wafv2_web_acl") ? local.aws.wafv2_web_acl : null
  description = "WAF"
}

output "wafv2_web_acl_association" {
  value       = contains(var.resource_types, "wafv2_web_acl_association") ? local.aws.wafv2_web_acl_association : null
  description = "WAF"
}

output "wafv2_web_acl_logging_configuration" {
  value       = contains(var.resource_types, "wafv2_web_acl_logging_configuration") ? local.aws.wafv2_web_acl_logging_configuration : null
  description = "WAF"
}

output "worklink_fleet" {
  value       = contains(var.resource_types, "worklink_fleet") ? local.aws.worklink_fleet : null
  description = "WorkLink"
}

output "worklink_website_certificate_authority_association" {
  value       = contains(var.resource_types, "worklink_website_certificate_authority_association") ? local.aws.worklink_website_certificate_authority_association : null
  description = "WorkLink"
}

output "workspaces_connection_alias" {
  value       = contains(var.resource_types, "workspaces_connection_alias") ? local.aws.workspaces_connection_alias : null
  description = "WorkSpaces"
}

output "workspaces_directory" {
  value       = contains(var.resource_types, "workspaces_directory") ? local.aws.workspaces_directory : null
  description = "WorkSpaces"
}

output "workspaces_ip_group" {
  value       = contains(var.resource_types, "workspaces_ip_group") ? local.aws.workspaces_ip_group : null
  description = "WorkSpaces"
}

output "workspaces_workspace" {
  value       = contains(var.resource_types, "workspaces_workspace") ? local.aws.workspaces_workspace : null
  description = "WorkSpaces"
}

output "xray_encryption_config" {
  value       = contains(var.resource_types, "xray_encryption_config") ? local.aws.xray_encryption_config : null
  description = "X-Ray"
}

output "xray_group" {
  value       = contains(var.resource_types, "xray_group") ? local.aws.xray_group : null
  description = "X-Ray"
}

output "xray_resource_policy" {
  value       = contains(var.resource_types, "xray_resource_policy") ? local.aws.xray_resource_policy : null
  description = "X-Ray"
}

output "xray_sampling_rule" {
  value       = contains(var.resource_types, "xray_sampling_rule") ? local.aws.xray_sampling_rule : null
  description = "X-Ray"
}
