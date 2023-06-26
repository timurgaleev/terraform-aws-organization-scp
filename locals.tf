locals {

  accounts = {
    dev = {
      name  = "dev",
      owner = "dev@example.com"
    },
    # staging = {
    #   name  = "staging",
    #   owner = "staging@example.com"
    # },
    # prod = {
    #   name  = "prod",
    #   owner = "prod@example.com"
    # }
  }

  ous = {
    "sandbox" = aws_organizations_organizational_unit.sandbox
    # "stage"   = aws_organizations_organizational_unit.staging
    # "prod"    = aws_organizations_organizational_unit.prod
  }
}
