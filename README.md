# Terraform starter: AWS + GCP

This folder configures Terraform to use:

- AWS credentials from the AWS CLI profile named in `aws_profile`.
- GCP Application Default Credentials from `gcloud auth application-default login`.

## First run

Copy the example variables file:

```sh
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` and set your real `gcp_project_id`.

Then run:

```sh
terraform init
terraform plan
```

## Authentication

AWS:

```sh
aws configure
aws sts get-caller-identity
```

GCP:

```sh
gcloud auth login
gcloud auth application-default login
gcloud config set project YOUR_GCP_PROJECT_ID
```

## Notes

Do not commit `terraform.tfvars`, state files, credentials, or service account keys.

