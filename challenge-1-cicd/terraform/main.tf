provider "google" {
    project = var.projectid
    region = "us-east1"
}

terraform {
  backend "gcs" {
    bucket = var.terraform_bucket
  }
}

resource "google_storage_bucket" "cf_source_code_4_challenge-1-cicd" {
    
    name = var.source_code_bucket
    location = "us-east1"
}

resource "google_storage_bucket_object" "cf_code_object_4_challenge-1-cicd" {
    name = "main.zip"
    bucket = google_storage_bucket.cf_source_code_4_challenge-1-cicd.name
    source = "../code/main.zip"
}

resource "google_storage_bucket" "cf_source_bucket_4_challenge-1-cicd" {
    
    name = var.source_bucket
    location = "us-east1"
}
 
resource "google_storage_bucket" "cf_target_bucket_4_challenge-1-cicd" {
    
    name = var.target_bucket
    location = "us-east1"
}

resource "google_cloudfunctions_function" "cf_4_challenge-1-cicd" {

    name = "cf_4_challenge-1-cicd"
    entry_point = "publish_file"
    runtime = "python310"
    source_archive_bucket = google_storage_bucket.cf_source_code_4_challenge-1-cicd.name
    source_archive_object = google_storage_bucket_object.cf_code_object_4_challenge-1-cicd.name
 
    event_trigger {
      event_type = "google.storage.object.finalize"
      resource = google_storage_bucket.cf_source_bucket_4_challenge-1-cicd.name
    }

    environment_variables = {
    target_bucket_var = var.target_bucket
    }
    service_account_email = var.sa
}

#comment
