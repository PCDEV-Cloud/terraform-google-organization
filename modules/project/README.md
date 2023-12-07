# project

Creates project in the GCP organization or parent folder.

## Usage

```hcl
module "google_project" {
  source = "github.com/PCDEV-Cloud/terraform-google-organization//modules/project"

  name            = "Example-Project"
  project_id      = "example-project"
  parent          = "organizations/174829227356"
  billing_account = "<BILLING-ACCOUNT-ID-HERE>"
}
```

## Examples

- [project](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/project) - Creates project
