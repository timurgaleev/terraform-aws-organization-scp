module "scp_ou" {
  for_each = local.ous
  source   = "./modules/scp"
  target   = each.value

  # Don't allow any access at all
  deny_all = false

  # Deny the ability to remove an account from the AWS Organization it is assigned to
  deny_leaving_orgs = true

  # Deny deleting KMS keys
  deny_deleting_kms_keys = true

  # Deny manipulation of CloudTrail
  deny_cloudtrail_manipulation = true

  # Applies to accounts that are not managing IAM users
  deny_creating_iam_users = true

  # Deny deleting Route53 zones
  deny_deleting_route53_zones = false

  # Deny deleting CloudWatch logs
  deny_deleting_cloudwatch_logs = false

  # Restrict EC2 instance types
  limit_ec2_instance_types   = false
  allowed_ec2_instance_types = ["t2.medium"]

  # Restrict the regions where AWS non-global services can be created
  limit_regions   = true
  allowed_regions = ["eu-west-1", "eu-west-2", "eu-west-3", "eu-north-1", "eu-central-1", "us-east-1", "us-east-2", "us-west-1", "us-west-2"]

  # Deny public access to buckets
  deny_s3_buckets_public_access          = false
  deny_s3_bucket_public_access_resources = ["arn:aws:s3:::*/*"]

  # Require S3 Objects to be Encrypted (Encryption at rest)
  require_s3_encryption = false

  # Require MFA S3 Delete
  require_mfa_delete = false

  # Deny Unsecure SSL Requests to S3
  deny_non_tls_s3_requests = false

  # Require MFA to perform an API Action
  require_MFA = false

  # SCP policy tags
  tags = {
    managed_by = "managed by Terraform"
  }
}
