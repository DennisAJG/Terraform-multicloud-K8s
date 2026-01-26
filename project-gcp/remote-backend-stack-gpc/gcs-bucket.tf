resource "google_storage_bucket" "tfstate" {
  name                        = var.remote_backend.bucket_name
  location                    = var.remote_backend.location
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  labels = {
  project     = "foodzip"
  environment = "development"
}


  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition { num_newer_versions = 10 }
    action    { type = "Delete" }
  }
}
