variable "default_tags" {
  type = object({
    Project     = string
    Environment = string
  })
  default = {
    Project     = "foodzip"
    Environment = "development"
  }

}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::282681675072:role/foodzip-role"
    region = "us-east-1"
  }
}


variable "remote_backend" {
  type = object({
    dynamobd_table_name          = string
    dynamobd_table_biling_mode   = string
    dynamobd_table_hash_key      = string
    dynamobd_table_hash_key_type = string
    bucket_name                  = string
  })

  default = {
    dynamobd_table_name          = "devops-workshop-foodzip-state-lock-table"
    dynamobd_table_biling_mode   = "PAY_PER_REQUEST"
    dynamobd_table_hash_key      = "LockID"
    dynamobd_table_hash_key_type = "S"
    bucket_name                  = "devops-workshop-foodzip-remote-backend"
  }
}