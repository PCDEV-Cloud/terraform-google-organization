# folders

Creates folders in the GCP organization or any other folder.

## Usage

```hcl
module "google_folders" {
  source = "github.com/PCDEV-Cloud/terraform-google-organization//modules/folders"

  parent = "<PARENT-ID-HERE>"

  folders = [
    {
      name = "Security"
      folders = [
        { name = "Prod" },
        { name = "SDLC" }
      ]
    },
    {
      name = "Infrastructure"
      folders = [
        { name = "Prod" },
        { name = "SDLC" }
      ]
    }
  ]
}
```

## Examples

- [folders](https://github.com/PCDEV-Cloud/terraform-google-organization/tree/main/examples/folders) - Creates folders
