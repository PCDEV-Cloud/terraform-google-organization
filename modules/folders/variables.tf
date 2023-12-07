variable "parent" {
  type        = string
  description = "The parent's ID, including 'organizations/' or 'folders/' prefix, where folders to be created."

  validation {
    condition     = startswith(var.parent, "organizations/") || startswith(var.parent, "folders/")
    error_message = "The parent must starts with 'organizations/' or 'folders/'."
  }
}

variable "folders" {
  type = list(object(
    { # lvl 1
      display_name = string
      folders = optional(list(object(
        { # lvl 2
          display_name = string
          folders = optional(list(object(
            { # lvl 3
              display_name = string
              folders = optional(list(object(
                { # lvl 4
                  display_name = string
                  folders = optional(list(object(
                    { # lvl 5
                      display_name = string
                      folders = optional(list(object(
                        { # lvl 6
                          display_name = string
                          folders = optional(list(object(
                            { # lvl 7
                              display_name = string
                              folders = optional(list(object(
                                { # lvl 8
                                  display_name = string
                                  folders = optional(list(object(
                                    { # lvl 9
                                      display_name = string
                                    }
                                  )), [])
                                }
                              )), [])
                            }
                          )), [])
                        }
                      )), [])
                    }
                  )), [])
                }
              )), [])
            }
          )), [])
        }
      )), [])
    }
  ))
  description = "A list of folders with their subfolders. Maximum nesting is limited to 9 levels."
}
