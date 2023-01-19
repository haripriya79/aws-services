provider "aws" { 

region = "ap-south-1" 
    access_key = "access key"
    secret_key = "secret key"

} 

 

resource "aws_s3_bucket" "test-axiomio-bucket-2" { 

  bucket = "test-axiomio-bucket-12" 

  acl    = "private" 

 

  tags = { 

    Name        = "test-bucket" 

    Environment = "Dev" 

  } 

} 

 

 

resource "aws_iam_user" "test-S3-user" { 

  name = "S3_user_test"  

  

} 

 

resource "aws_iam_access_key" "test-S3-user" { 

  user = aws_iam_user.test-S3-user.arn

} 




 
resource "aws_s3_bucket_policy" "allow_access_only_iam_user" {
  bucket = aws_s3_bucket.test-axiomio-bucket-2.bucket
  policy  = data.aws_iam_policy_document.allow_access_only_iam_user.json
}

data "aws_iam_policy_document" "allow_access_only_iam_user" {
    version = "2012-10-17"
  statement {
    not_principals{
      type        = "AWS"
      identifiers = [aws_iam_user.test-S3-user.arn,"820808902823"]
    }

    actions = [
      "s3:*",
      
    ]
    effect = "Deny"

    resources = [
      aws_s3_bucket.test-axiomio-bucket-2.arn,
      "${aws_s3_bucket.test-axiomio-bucket-2.arn}/*",
    ]
  }
}


