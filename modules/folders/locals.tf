locals {
  organization = {
    name = startswith(var.parent, "organizations/") ? var.parent : data.google_folder.parent[0].organization
  }

  data_lvl_1_list = flatten([for i in data.google_folders.lvl_1 : [for j in i.folders : merge(j, { level = 1, path = "/${j.display_name}" })]])
  data_lvl_2_list = flatten([for i in data.google_folders.lvl_2 : [for j in i.folders : merge(j, { level = 2, path = "${local.data_lvl_1[j.parent].path}/${j.display_name}" })]])
  data_lvl_3_list = flatten([for i in data.google_folders.lvl_3 : [for j in i.folders : merge(j, { level = 3, path = "${local.data_lvl_2[j.parent].path}/${j.display_name}" })]])
  data_lvl_4_list = flatten([for i in data.google_folders.lvl_4 : [for j in i.folders : merge(j, { level = 4, path = "${local.data_lvl_3[j.parent].path}/${j.display_name}" })]])
  data_lvl_5_list = flatten([for i in data.google_folders.lvl_5 : [for j in i.folders : merge(j, { level = 5, path = "${local.data_lvl_4[j.parent].path}/${j.display_name}" })]])
  data_lvl_6_list = flatten([for i in data.google_folders.lvl_6 : [for j in i.folders : merge(j, { level = 6, path = "${local.data_lvl_5[j.parent].path}/${j.display_name}" })]])
  data_lvl_7_list = flatten([for i in data.google_folders.lvl_7 : [for j in i.folders : merge(j, { level = 7, path = "${local.data_lvl_6[j.parent].path}/${j.display_name}" })]])
  data_lvl_8_list = flatten([for i in data.google_folders.lvl_8 : [for j in i.folders : merge(j, { level = 8, path = "${local.data_lvl_7[j.parent].path}/${j.display_name}" })]])
  data_lvl_9_list = flatten([for i in data.google_folders.lvl_9 : [for j in i.folders : merge(j, { level = 9, path = "${local.data_lvl_8[j.parent].path}/${j.display_name}" })]])

  # From list to map
  data_lvl_1 = { for i in local.data_lvl_1_list : i.name => i }
  data_lvl_2 = { for i in local.data_lvl_2_list : i.name => i }
  data_lvl_3 = { for i in local.data_lvl_3_list : i.name => i }
  data_lvl_4 = { for i in local.data_lvl_4_list : i.name => i }
  data_lvl_5 = { for i in local.data_lvl_5_list : i.name => i }
  data_lvl_6 = { for i in local.data_lvl_6_list : i.name => i }
  data_lvl_7 = { for i in local.data_lvl_7_list : i.name => i }
  data_lvl_8 = { for i in local.data_lvl_8_list : i.name => i }
  data_lvl_9 = { for i in local.data_lvl_9_list : i.name => i }

  data_folders = merge(local.data_lvl_1, local.data_lvl_2, local.data_lvl_3, local.data_lvl_4, local.data_lvl_5, local.data_lvl_6, local.data_lvl_7, local.data_lvl_8, local.data_lvl_9)

  parent_path = startswith(var.parent, "folders/") ? "${local.data_folders[var.parent].path}" : "/"
  parent_lvl  = startswith(var.parent, "folders/") ? local.data_folders[var.parent].level : 0

  folders = [for i in var.folders : { display_name = i.display_name, folders = try(i.folders, []), parent = var.parent, path = replace("${local.parent_path}/${i.display_name}", "//{2,}/", "/") }]

  lvl_2_list_p1 = local.parent_lvl == 1 ? local.folders : []
  lvl_3_list_p1 = local.parent_lvl == 2 ? local.folders : []
  lvl_4_list_p1 = local.parent_lvl == 3 ? local.folders : []
  lvl_5_list_p1 = local.parent_lvl == 4 ? local.folders : []
  lvl_6_list_p1 = local.parent_lvl == 5 ? local.folders : []
  lvl_7_list_p1 = local.parent_lvl == 6 ? local.folders : []
  lvl_8_list_p1 = local.parent_lvl == 7 ? local.folders : []
  lvl_9_list_p1 = local.parent_lvl == 8 ? local.folders : []

  lvl_2_list_p2 = local.parent_lvl == 1 ? [] : flatten([for i in local.lvl_1_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_1[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_3_list_p2 = local.parent_lvl == 2 ? [] : flatten([for i in local.lvl_2_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_2[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_4_list_p2 = local.parent_lvl == 3 ? [] : flatten([for i in local.lvl_3_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_3[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_5_list_p2 = local.parent_lvl == 4 ? [] : flatten([for i in local.lvl_4_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_4[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_6_list_p2 = local.parent_lvl == 5 ? [] : flatten([for i in local.lvl_5_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_5[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_7_list_p2 = local.parent_lvl == 6 ? [] : flatten([for i in local.lvl_6_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_6[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_8_list_p2 = local.parent_lvl == 7 ? [] : flatten([for i in local.lvl_7_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_7[i.path].id, path = "${i.path}/${j.display_name}" }]])
  lvl_9_list_p2 = local.parent_lvl == 8 ? [] : flatten([for i in local.lvl_8_list : [for j in i.folders : { display_name = j.display_name, folders = try(j.folders, []), parent = google_folder.lvl_8[i.path].id, path = "${i.path}/${j.display_name}" }]])

  lvl_1_list = local.parent_lvl == 0 ? local.folders : []
  lvl_2_list = concat(local.lvl_2_list_p1, local.lvl_2_list_p2)
  lvl_3_list = concat(local.lvl_3_list_p1, local.lvl_3_list_p2)
  lvl_4_list = concat(local.lvl_4_list_p1, local.lvl_4_list_p2)
  lvl_5_list = concat(local.lvl_5_list_p1, local.lvl_5_list_p2)
  lvl_6_list = concat(local.lvl_6_list_p1, local.lvl_6_list_p2)
  lvl_7_list = concat(local.lvl_7_list_p1, local.lvl_7_list_p2)
  lvl_8_list = concat(local.lvl_8_list_p1, local.lvl_8_list_p2)
  lvl_9_list = concat(local.lvl_9_list_p1, local.lvl_9_list_p2)

  # From list to map
  lvl_1 = { for i in local.lvl_1_list : i.path => i }
  lvl_2 = { for i in local.lvl_2_list : i.path => i }
  lvl_3 = { for i in local.lvl_3_list : i.path => i }
  lvl_4 = { for i in local.lvl_4_list : i.path => i }
  lvl_5 = { for i in local.lvl_5_list : i.path => i }
  lvl_6 = { for i in local.lvl_6_list : i.path => i }
  lvl_7 = { for i in local.lvl_7_list : i.path => i }
  lvl_8 = { for i in local.lvl_8_list : i.path => i }
  lvl_9 = { for i in local.lvl_9_list : i.path => i }
}
