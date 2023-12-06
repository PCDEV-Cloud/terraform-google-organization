provider "google" {}

module "google_folders" {
  source = "../../modules/folders"

  parent = "organizations/123456789123"

  folders = [
    {
      display_name = "Security"
      folders = [
        { display_name = "Prod" },
        { display_name = "SDLC" }
      ]
    },
    {
      display_name = "Infrastructure"
      folders = [
        { display_name = "Prod" },
        { display_name = "SDLC" }
      ]
    },
    { display_name = "Projects" }
  ]
}