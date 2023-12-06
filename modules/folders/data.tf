data "google_folder" "parent" {
  count               = startswith(var.parent, "folders/") ? 1 : 0
  folder              = var.parent
  lookup_organization = true
}

data "google_folders" "lvl_1" {
  for_each  = startswith(var.parent, "folders/") ? local.organization : {}
  parent_id = each.value
}

data "google_folders" "lvl_2" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_1 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_3" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_2 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_4" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_3 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_5" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_4 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_6" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_5 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_7" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_6 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_8" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_7 : {}
  parent_id = each.value["name"]
}

data "google_folders" "lvl_9" {
  for_each  = startswith(var.parent, "folders/") ? local.data_lvl_8 : {}
  parent_id = each.value["name"]
}
