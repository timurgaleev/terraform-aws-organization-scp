locals {
  # Each policy variable is set to a bool, defaulting to false (not included).
  # Include a policy by setting a policy variable to `true`, passing the hard-coded "Deny" statment
  # into the combined policy block.

  # Exclude a policy from the combined policy by omitting the policy variable in the module call.
  # This results in the default setting of `false`, and
  # the dynamic `for_each` statement will return an array with an empty string,
  # and the statement will not be included.

  deny_leaving_orgs_statement                = var.deny_leaving_orgs ? [""] : []
  deny_creating_iam_users_statement          = var.deny_creating_iam_users ? [""] : []
  deny_deleting_kms_keys_statement           = var.deny_deleting_kms_keys ? [""] : []
  deny_deleting_route53_zones_statement      = var.deny_deleting_route53_zones ? [""] : []
  deny_deleting_cloudwatch_logs_statement    = var.deny_deleting_cloudwatch_logs ? [""] : []
  deny_root_account_statement                = var.deny_root_account ? [""] : []
  protect_s3_buckets_statement               = var.protect_s3_buckets ? [""] : []
  deny_s3_buckets_public_access_statement    = var.deny_s3_buckets_public_access ? [""] : []
  protect_iam_roles_statement                = var.protect_iam_roles ? [""] : []
  limit_ec2_instance_types                   = var.limit_ec2_instance_types ? [""] : []
  limit_regions_statement                    = var.limit_regions ? [""] : []
  deny_unencrypted_object_uploads_statement  = var.require_s3_encryption ? [""] : []
  deny_incorrect_encryption_header_statement = var.require_s3_encryption ? [""] : []
  require_mfa_delete_statement               = var.require_mfa_delete ? [""] : []
  deny_non_tls_s3_requests_statement         = var.deny_non_tls_s3_requests ? [""] : []
  require_MFA_statement                      = var.require_MFA ? [""] : []
  deny_cloudtrail_manipulation_statement     = var.deny_cloudtrail_manipulation ? [""] : []
}
