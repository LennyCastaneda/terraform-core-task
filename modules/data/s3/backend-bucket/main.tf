##################################################################################
# S3 BUCKET MODULE
##################################################################################

resource "aws_s3_bucket" "s3" {
	bucket = "${var.s3_bucket}${var.aws_account}"
	policy = var.bucket_policy

	tags = "${merge(
		local.common_tags,
		map(
			"Owner", var.owner,
			"Environment", var.environment
		)
	)}"

	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm     = "AES256"
			}
		}
	}

	versioning {
		enabled = true
	}

	lifecycle {
		prevent_destroy = true
	}
}

resource "aws_s3_bucket_public_access_block" "s3" {
	bucket 									= "${aws_s3_bucket.s3.id}"
	restrict_public_buckets = true
	ignore_public_acls      = true
	block_public_acls       = true
	block_public_policy     = true
}