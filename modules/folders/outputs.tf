output "folders" {
  value = concat(
    [for i, j in google_folder.lvl_1 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_2 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_3 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_4 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_5 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_6 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_7 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_8 : merge(j, { path = i })],
    [for i, j in google_folder.lvl_9 : merge(j, { path = i })]
  )
}
