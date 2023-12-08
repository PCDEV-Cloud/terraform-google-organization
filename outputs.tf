output "folders" {
  value = module.folders.folders
}

output "projects" {
  value = [for i in module.project : i]
}
