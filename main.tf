module "aft_pipeline" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  # Required Variables
  ct_management_account_id  = "235494779082"
  log_archive_account_id    = "256085988340"
  audit_account_id          = "917604508187"
  aft_management_account_id = "110427924370"
  ct_home_region            = "ca-central-1"

  # Terraform variables
  terraform_version      = "1.6.0"
  terraform_distribution = "oss"

  # VCS Vars
  vcs_provider                                  = "github"
  account_request_repo_name                     = "chinnayyachintha/aft-account-request"
  global_customizations_repo_name               = "chinnayyachintha/aft-global-customizations"
  account_customizations_repo_name              = "chinnayyachintha/aft-account-customizations"
  account_provisioning_customizations_repo_name = "chinnayyachintha/aft-account-provisioning-customizations"

  # AFT Feature flags
  aft_feature_cloudtrail_data_events      = false
  aft_feature_enterprise_support          = false
  aft_feature_delete_default_vpcs_enabled = true

  # AFT Additional Configurations
  aft_enable_vpc                            = true
  backup_recovery_point_retention           = 1
  log_archive_bucket_object_expiration_days = 1
}