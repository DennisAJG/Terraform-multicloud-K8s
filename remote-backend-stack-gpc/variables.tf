variable "project_id" {
  type = string
  default = "dog-app-devops"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "remote_backend" {
  type = object({
    bucket_name = string
    location    = string
  })

  default = {
    bucket_name = "devops-workshop-foodzip-state-lock-table"
    location    = "us-central1"
  }
}
