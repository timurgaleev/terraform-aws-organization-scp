resource "aws_organizations_policy" "generated" {
  name        = "general-scp-${var.target.name}-policy"
  description = "${var.target.name} environment SCP generated"
  content     = var.deny_all ? data.aws_iam_policy_document.deny_all_access.json : data.aws_iam_policy_document.combined_policy_block.json

  tags = var.tags
}

resource "aws_organizations_policy_attachment" "generated" {
  policy_id = aws_organizations_policy.generated.id
  target_id = var.target.id
}
