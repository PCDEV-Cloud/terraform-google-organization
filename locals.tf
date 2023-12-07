locals {
  folders_by_path = { for i in module.folders.folders : i.path => i }
  projects        = { for i in var.projects : i.project_id => i }
}
