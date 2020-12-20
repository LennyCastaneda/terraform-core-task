##################################################################################
# S3 BUCKET MODULE
##################################################################################

resource "aws_s3_bucket" "lb_logs" {
	bucket 				= "${var.target_bucket}${var.aws_account}"
	policy 				= "${data.template_file.lb_log_policy.rendered}"
	acl						= "log-delivery-write"
	force_destroy	= var.force_destroy

	tags = "${merge(
		local.common_tags,
		map(
			"Owner", var.owner,
			"Environment", var.environment
		)
	)}"

	versioning {
		enabled = true
	}
}

resource "aws_s3_bucket_public_access_block" "s3" {
	bucket = "${aws_s3_bucket.lb_logs.id}"
	restrict_public_buckets = true
	ignore_public_acls      = true
	block_public_acls       = true
	block_public_policy     = true
}

##################################################################################
# BUCKET POLICY
##################################################################################

data "template_file" "lb_log_policy" {
	template = file("${path.module}/templates/lb_log_bucket_policy.tpl")

	vars = {
		target_bucket		= var.target_bucket
		target_prefix		= var.target_prefix
		aws_account 		= var.aws_account   
		aws_account_id	= var.aws_account_id
	}
}