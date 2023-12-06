provider "google" {}

module "organization" {
  source = "../../"

  organization = "organizations/174829227356"

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