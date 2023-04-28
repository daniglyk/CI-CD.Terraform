resource "aws_iam_user" "iam_user" {
	name = "developer__2"
}

resource "aws_iam_access_key" "iam_access_key" {
	user = aws_iam_user.iam_user.name
}

data "aws_iam_policy_document" "s3_Read_Only" {
	statement {
	 actions = [
                "s3:Get*",
                "s3:List*",
                "s3-object-lambda:Get*",
                "s3-object-lambda:List*"
            ]

	resources = [
	   "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
	]
      }
}


resource "aws_iam_user_policy" "s3_Read_Only" {
	name = "s3_Read_Only"
	user = aws_iam_user.iam_user.name
	policy = data.aws_iam_policy_document.s3_Read_Only.json
}



resource "aws_iam_role_policy" "admin_policy" {
  name = "admin_policy"
  role = aws_iam_role.admin_role.id

    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:iam::aws:policy/AdministratorAccess"
      },
    ]
  })
}

resource "aws_iam_role" "admin_role" {
  name = "admin_role"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}
