{
  "Id": "Policy1429136655940",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1429136633762",
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${target_bucket}${aws_account}/${target_prefix}/AWSLogs/${aws_account_id}/*",
      "Principal": {
        "AWS": [
          "${aws_account_number}"
        ]
      }
    }
  ]
}