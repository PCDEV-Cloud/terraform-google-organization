variable "name" {
  type        = string
  description = "The display name of the project."
}

variable "project_id" {
  type        = string
  description = "The project ID. Changing this forces a new project to be created."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.project_id))
    error_message = "The project_id must be 6 to 30 characters in length. Can only contain lowercase letters, numbers, and hyphens. Must start with a letter and cannot end with a hyphen."
  }

  validation {
    condition     = !can(regex("^.*--.*$", var.project_id))
    error_message = "Hyphens cannot appear next to each other."
  }
}

variable "randomize_project_id" {
  type        = bool
  default     = false
  description = "If true, adds a 6-digit random string preceded by a dash. The 'project_id' variable cannot then be longer than 23 characters."
}

variable "parent" {
  type        = string
  description = "The parent's ID, including 'organizations/' or 'folders/' prefix, where project to be created."

  validation {
    condition     = startswith(var.parent, "organizations/") || startswith(var.parent, "folders/")
    error_message = "The parent must starts with 'organizations/' or 'folders/'."
  }
}

variable "billing_account" {
  type        = string
  default     = null
  description = "The alphanumeric ID of the billing account this project belongs to."
}

variable "skip_delete" {
  type        = bool
  default     = false
  description = "If true, the Terraform resource can be deleted without deleting the project."
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "A map of key/value label pairs to assign to the project."
}

variable "create_default_network" {
  type        = bool
  default     = true
  description = "Controls whether the 'default' network exists on the project. If false, the default network will still be created by GCP but will be deleted immediately by Terraform."
}
