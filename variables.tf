variable "organization" {
  type        = string
  description = "The organization's ID, including 'organizations/' prefix."
}

variable "folders" {
  default     = []
  description = "A list of folders with their subfolders. Maximum nesting is limited to 9 levels."
}

variable "projects" {
  default     = []
  description = "A list of projects with settings."
}
