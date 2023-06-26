resource "aws_organizations_organization" "organization" {
  feature_set = "ALL"
  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
  ]
  aws_service_access_principals = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
  ]
}

resource "aws_organizations_organizational_unit" "sandbox" {
  name      = "sandbox"
  parent_id = aws_organizations_organization.organization.roots[0].id
}

resource "aws_organizations_account" "dev" {
  name      = local.accounts["dev"]["name"]
  email     = local.accounts["dev"]["owner"]
  parent_id = aws_organizations_organizational_unit.sandbox.id
  role_name = "Admin"

  lifecycle {
    ignore_changes = [role_name]
  }
}
