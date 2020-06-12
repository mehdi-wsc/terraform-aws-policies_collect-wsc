locals {
  source_documents = concat(["null"], var.policies_documents)

  policies = [
    length(local.source_documents) > 1 ? element(local.source_documents, 1) : data.aws_iam_policy_document.empty.json,
    length(local.source_documents) > 2 ? element(local.source_documents, 2) : data.aws_iam_policy_document.empty.json,
    length(local.source_documents) > 3 ? element(local.source_documents, 3) : data.aws_iam_policy_document.empty.json,
    length(local.source_documents) > 4 ? element(local.source_documents, 4) : data.aws_iam_policy_document.empty.json,
    length(local.source_documents) > 5 ? element(local.source_documents, 5) : data.aws_iam_policy_document.empty.json,
  ]
}


data "aws_iam_policy_document" "empty" {
}

data "aws_iam_policy_document" "first" {
  source_json   = data.aws_iam_policy_document.empty.json
  override_json = element(local.policies, 0)
}
data "aws_iam_policy_document" "second" {
  source_json   = data.aws_iam_policy_document.first.json
  override_json = element(local.policies, 1)
}
data "aws_iam_policy_document" "third" {
  source_json   = data.aws_iam_policy_document.second.json
  override_json = element(local.policies, 2)
}
data "aws_iam_policy_document" "fourth" {
  source_json   = data.aws_iam_policy_document.third.json
  override_json = element(local.policies, 3)
}
data "aws_iam_policy_document" "fifth" {
  source_json   = data.aws_iam_policy_document.fourth.json
  override_json = element(local.policies, 4)
}
data "aws_iam_policy_document" "sixth" {
  source_json   = data.aws_iam_policy_document.fifth.json
  override_json = element(local.policies,5)
}

data "aws_iam_policy_document" "default" {
  source_json = data.aws_iam_policy_document.sixth.json
}