provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

module "s3" {
    source = ".\\s3\\"
    bucket_name = "de-atilla-on-youtube-raw-useast1-dev"
}

module "glue" {
    source = ".\\glue\\"
    catalog_name = "de-on-youtube-raw-glue-catalog-1"
    database_name = "raw-statiscts-reference-data.de-youtube-raw"
    role_name = "de-on-yotube-glue-s3-role"
}