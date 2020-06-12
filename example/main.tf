data "aws_iam_policy_document" "resource_full_access" {
  statement {
    sid       = "FullAccess"
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucketname/path/*"]

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:GetBucketLocation",
      "s3:AbortMultipartUpload"
    ]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    sid       = "BaseAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}
data "aws_iam_policy_document" "base_f" {
  statement {
    sid       = "BaseAccessf"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}
data "aws_iam_policy_document" "base_s" {
  statement {
    sid       = "BaseAccesss"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}
data "aws_iam_policy_document" "base_th" {
  statement {
    sid       = "BaseAccessth"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}
module "aggregated_policy" {
  source = "../"

  policies_documents = [
    data.aws_iam_policy_document.base.json,
    data.aws_iam_policy_document.resource_full_access.json,
    data.aws_iam_policy_document.base_f.json,
    data.aws_iam_policy_document.base_s.json,
    data.aws_iam_policy_document.base_th.json
  ]
}
output "doc" {
  value = module.aggregated_policy.policies_result_document
}
