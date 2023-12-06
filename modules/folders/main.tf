resource "google_folder" "lvl_1" {
  for_each     = local.lvl_1
  display_name = each.value["display_name"]
  parent       = each.value["parent"]
}

resource "google_folder" "lvl_2" {
  for_each     = local.lvl_2
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_1]
}

resource "google_folder" "lvl_3" {
  for_each     = local.lvl_3
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_2]
}

resource "google_folder" "lvl_4" {
  for_each     = local.lvl_4
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_3]
}

resource "google_folder" "lvl_5" {
  for_each     = local.lvl_5
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_4]
}

resource "google_folder" "lvl_6" {
  for_each     = local.lvl_6
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_5]
}

resource "google_folder" "lvl_7" {
  for_each     = local.lvl_7
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_6]
}

resource "google_folder" "lvl_8" {
  for_each     = local.lvl_8
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_7]
}

resource "google_folder" "lvl_9" {
  for_each     = local.lvl_9
  display_name = each.value["display_name"]
  parent       = each.value["parent"]

  depends_on = [google_folder.lvl_8]
}
