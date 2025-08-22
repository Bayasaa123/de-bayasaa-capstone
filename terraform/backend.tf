terraform {
  backend "s3" {
    bucket         = "de-bootcamp-bayasaa"
    key            = "tfstate/dev.tfstate"
    region         = "ap-southeast-2"
    # dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}