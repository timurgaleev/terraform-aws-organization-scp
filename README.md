## AWS Organizations Service Control Policies (SCP) by Accounts


Policy options are:

* Deny All Acces (DenyAllAccess)
* Deny leaving AWS Organizations (DenyLeavingOrgs)
* Deny deleting KMS Keys (DenyDeletingKMSKeys)
* Deny manipulation of CloudTrail (DenyCloudTrailActions)
* Deny creating IAM users or access keys (DenyCreatingIAMUsers)
* Protect IAM Roles (ProtectIAMRoles)
* Deny deleting Route53 Hosted Zones (DenyDeletingRoute53Zones)
* Deny deleting Cloudwatch logs (DenyDeletingCloudwatchLogs)
* Deny root account (DenyRootAccount)
* Restrict EC2 Instance Types (LimitEC2InstanceTypes)
* Restrict Regional Operations (LimitRegions)
* Deny S3 Buckets Public Access (DenyS3BucketsPublicAccess)
* Require S3 encryption (DenyIncorrectEncryptionHeader + DenyUnEncryptedObjectUploads)
* Protect S3 Buckets (ProtectS3Buckets)
* Require MFA S3 Delete (RequireMFAS3Delete)
* Deny Unsecure SSL Requests to S3 (DenyNoTLSRequests)
* Require MFA to perform an API Action (RequireMFAS3Delete)


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.4.6 |
| aws | >= 5.4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 5.4.0 |
