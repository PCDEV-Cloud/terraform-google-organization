variable "name" {
  type        = string
  description = ""
}

variable "project_id" {
  type        = string
  description = ""

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
  default     = true
  description = ""
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
  description = ""
}

variable "skip_delete" {
  type        = bool
  default     = false
  description = ""
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = ""
}

variable "effective_labels" {
  type        = map(string)
  default     = {}
  description = ""
}

variable "create_default_network" {
  type        = bool
  default     = true
  description = ""
}
