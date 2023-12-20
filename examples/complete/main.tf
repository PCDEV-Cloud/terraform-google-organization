provider "google" {}

data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}

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

  projects = [
    {
      name                     = "SecurityToolingProd"
      project_id               = "security-tooling-prod"
      parent                   = "/Security/Prod"
      billing_account          = data.google_billing_account.acct.id
      randomize_project_id     = true
      enable_apis_and_services = true
    },
    {
      name                 = "LogArchiveProd"
      project_id           = "log-archive-prod"
      parent               = "/Security/Prod"
      billing_account      = data.google_billing_account.acct.id
      randomize_project_id = true
    }
  ]
}