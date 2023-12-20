# Google Organization Terraform module

## Requirements
1. Google organization must be created.
2. IAM Service Account Credentials API must be enabled.

## Usage

```hcl
module "google_organization" {
  source = "github.com/PCDEV-Cloud/terraform-google-organization"

  organization = "<ORGANIZATION-ID-HERE>"

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
      name                 = "SecurityToolingProd"
      project_id           = "security-tooling-prod"
      parent               = "/Security/Prod"
      billing_account      = "<BILLING-ACCOUNT-ID-HERE>"
      randomize_project_id = true
    },
    {
      name                 = "LogArchiveProd"
      project_id           = "log-archive-prod"
      parent               = "/Security/Prod"
      billing_account      = "<BILLING-ACCOUNT-ID-HERE>"
      randomize_project_id = true
    }
  ]
}
```

## Examples

- [complete](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/complete) - Creates a set of folders and projects
- [folders](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/folders) - Creates folders
- [project](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/project) - Creates project
