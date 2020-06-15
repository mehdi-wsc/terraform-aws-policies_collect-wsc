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
module "aggregated_policy" {
 source  = "mehdi-wsc/policies_collect-wsc/aws"
  version = "0.0.1"

  policies_documents = [
    data.aws_iam_policy_document.base.json,
    data.aws_iam_policy_document.resource_full_access.json
  ]
}
output "doc" {
  value = module.aggregated_policy.policies_result_document
}



