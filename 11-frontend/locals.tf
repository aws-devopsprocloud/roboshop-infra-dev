locals {
  name = "${var.project}-${var.environment}"
  timestamp = formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())
}