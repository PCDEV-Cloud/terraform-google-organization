module "folders" {
  source = "./modules/folders"

  parent  = var.organization
  folders = var.folders
}

module "project" {
  source   = "./modules/project"
  for_each = local.projects

  name                     = each.value["name"]
  project_id               = each.value["project_id"]
  randomize_project_id     = try(each.value["randomize_project_id"], false)
  parent                   = can(regex("^(\\/[0-9A-Za-z_-]{3,30}){1,9}$", each.value["parent"])) ? local.folders_by_path[each.value["parent"]].name : each.value["parent"]
  billing_account          = try(each.value["billing_account"], null)
  skip_delete              = try(each.value["skip_delete"], false)
  labels                   = try(each.value["labels"], {})
  create_default_network   = try(each.value["create_default_network"], true)
  enable_apis_and_services = try(each.value["enable_apis_and_services"], false)
  apis_and_services        = try(each.value["apis_and_services"], null)

  depends_on = [
    module.folders
  ]
}
