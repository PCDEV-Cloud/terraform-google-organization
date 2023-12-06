# Google Organization Terraform module

## Requirements
1. Google organization must be created.

## Usage

```hcl
module "google_organization" {
  source = "github.com/PCDEV-Cloud/terraform-google-organization"

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
```

## Examples

- [complete](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/complete) - Creates a set of folders and projects
- [folders](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/folders) - Creates folders
