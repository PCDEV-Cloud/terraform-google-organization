module "folders" {
  source = "./modules/folders"

  parent  = var.organization
  folders = var.folders
}
