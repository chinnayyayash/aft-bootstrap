module "aft_pipeline" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  # Required Variables
  ct_management_account_id  = "757059999038"
  log_archive_account_id    = "052150106600"
  audit_account_id          = "842747873591"
  aft_management_account_id = "983491056145"
  ct_home_region            = "us-east-1"

  # Terraform variables
  terraform_version      = "1.6.0"
  terraform_distribution = "oss"

  # VCS Vars
  vcs_provider                                  = "github"
  account_request_repo_name                     = "chinnayyayash/aft-account-request"
  global_customizations_repo_name               = "chinnayyayash/aft-global-customizations"
  account_customizations_repo_name              = "chinnayyayash/aft-account-customizations"
  account_provisioning_customizations_repo_name = "chinnayyayash/aft-account-provisioning-customizations"

  # AFT Feature flags
  aft_feature_cloudtrail_data_events      = false
  aft_feature_enterprise_support          = false
  aft_feature_delete_default_vpcs_enabled = true

  # AFT Additional Configurations
  aft_enable_vpc                            = true
  backup_recovery_point_retention           = 1
  log_archive_bucket_object_expiration_days = 1
}