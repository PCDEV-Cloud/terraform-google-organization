output "id" {
  value       = google_project.this.id
  description = "An identifier for the resource with format 'projects/<ID>'."
}

output "number" {
  value       = google_project.this.number
  description = "The numeric identifier of the project."
}
