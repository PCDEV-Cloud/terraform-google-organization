variable "organization" {
  type        = string
  description = "The organization's ID, including 'organizations/' prefix."
}

variable "folders" {
  description = "A list of folders with their subfolders. Maximum nesting is limited to 9 levels."
}
