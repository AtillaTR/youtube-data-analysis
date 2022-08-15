resource "aws_glue_crawler" "de-youtube-raw" {
  database_name = "${var.database_name}"
  name          = "${var.catalog_name}"
  role         = "${var.role_name}"

  s3_target {
    path = "s3://de-atilla-on-youtube-raw-useast1-dev/youtube/raw_statistics_reference_data"
  }
}

