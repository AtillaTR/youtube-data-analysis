resource "aws_s3_bucket" "youtube-project" {
    bucket = "${var.bucket_name}"
}
resource "aws_s3_bucket" "athena" {
    bucket = "de-atilla-on-youtube-athena"
}
resource "aws_s3_bucket_public_access_block" "public-access-block" {
  bucket = aws_s3_bucket.youtube-project.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.youtube-project.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "${var.encrypt}"
    }
  }
}

resource "aws_s3_object" "create-folder" {
  bucket = aws_s3_bucket.youtube-project.id
  key    = "${var.base_folder}/"
  
}

resource "aws_s3_object" "json-data" {
  bucket = aws_s3_bucket.youtube-project.id
  for_each = fileset("${var.data_path}","*.json")
  key    = "${var.base_folder}/${var.named_folder}/${each.value}"
  source = "${var.data_path}/${each.value}"
  server_side_encryption = "${var.encrypt}"
  etag = filemd5("${var.data_path}/${each.value}")
}

resource "aws_s3_object" "csv-data" {
  bucket = aws_s3_bucket.youtube-project.id
  for_each = fileset("${var.data_path}","**/*.csv")
  key    = "${var.base_folder}/raw_statistics/${each.value}"
  source = "${var.data_path}/${each.value}"
  server_side_encryption = "${var.encrypt}"
  etag = filemd5("${var.data_path}/${each.value}")
}

