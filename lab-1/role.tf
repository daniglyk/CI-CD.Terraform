#resource "aws_iam_role_policy" "AdminRole" {
#  name = "AdminRole"
#  role = aws_iam_role.Test_Role.id
#
 # policy = jsonencode({
 #   Version = "2012-10-17"
 #   Statement = [
 #     {
 #       Action = [
 #         "*",
 #       ]
 #       Effect   = "Allow"
 #       Resource = "arn:aws:iam::aws:policy/AdministratorAccess"
 #     },
 #   ]
 # })
#}

#resource "aws_iam_role" "Test_Role" {
#  name = "Test_Role"

#  assume_role_policy = jsonencode({
 #   Version = "2012-10-17"
  #  Statement = [
   #   {
    #    Action = "*"
     #  
      #  Effect = "Allow"
       # Sid    = ""
       # Principal = {
        #  Service = "ec2.amazonaws.com"
       # }
     # },
   # ]
 # })
#}
