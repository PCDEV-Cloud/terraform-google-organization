provider "google" {}

data "google_organization" "org" {
  domain = "pcdev.pl"
}

data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}

module "google_project" {
  source = "../../modules/project"

  name            = "Example-Project"
  project_id      = "example-project"
  parent          = data.google_organization.org.name
  billing_account = data.google_billing_account.acct.id
}
