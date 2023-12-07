resource "random_string" "project_id" {
  count = var.randomize_project_id ? 1 : 0

  length  = 6
  numeric = true
  lower   = false
  upper   = false
  special = false

  keepers = {
    project_id = var.project_id
  }
}

resource "google_project" "this" {
  name       = var.name
  project_id = var.randomize_project_id ? join("-", [random_string.project_id[0].keepers.project_id, random_string.project_id[0].id]) : var.project_id

  org_id    = startswith(var.parent, "organizations/") ? trimprefix(var.parent, "organizations/") : null
  folder_id = startswith(var.parent, "folders/") ? var.parent : null

  billing_account     = var.billing_account
  skip_delete         = var.skip_delete
  labels              = var.labels
  auto_create_network = var.create_default_network
}
