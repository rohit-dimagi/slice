terraform {
    backend "s3" {
        bucket = "terraformbackend-gency"
        key = "terraform/demo"
        region = "us-east-2"
    }

} 
