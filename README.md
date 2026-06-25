# Terraform Cloud LAB

A Terraform configuration for deploying and managing cloud infrastructure.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Outputs](#outputs)
- [Cleanup](#cleanup)
- [Best Practices](#best-practices)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v1.0 or later)
- AWS account with appropriate credentials configured
- AWS CLI (optional, but recommended)

## Project Structure

```
.
├── main.tf              # Main Terraform configuration
├── variables.tf         # Variable definitions
├── output.tf            # Output definitions
├── provider.tf          # Provider configuration
├── terraform.tfvars     # Variable values (excluded from git)
├── userdata.sh          # User data script for instances
├── .gitignore          # Git ignore rules
└── README.md           # This file
```

### File Descriptions

- **main.tf**: Contains the primary resource definitions for your infrastructure
- **variables.tf**: Defines all input variables used in the configuration
- **output.tf**: Defines outputs that will be displayed after applying the configuration
- **provider.tf**: Configures the cloud provider (AWS, Azure, GCP, etc.)
- **terraform.tfvars**: Contains the actual values for variables (gitignored for security)
- **userdata.sh**: Script executed on instance startup

## Getting Started

### 1. Initialize Terraform

```bash
terraform init
```

This command initializes the Terraform working directory and downloads necessary provider plugins.

### 2. Configure Variables

Edit `terraform.tfvars` with your specific configuration values:

```hcl
# Example terraform.tfvars
region = "us-east-1"
instance_type = "t2.micro"
# Add other variables as needed
```

### 3. Plan Deployment

```bash
terraform plan
```

This command shows what resources will be created, modified, or destroyed.

### 4. Apply Configuration

```bash
terraform apply
```

Review the plan and type `yes` to confirm and apply the configuration.

## Configuration

### Variables

See `variables.tf` for all available variables. Common variables include:

- `region`: AWS region for resource deployment
- `instance_type`: EC2 instance type
- `environment`: Environment name (dev, staging, prod)

### Customize User Data

Edit `userdata.sh` to customize instance initialization:

```bash
#!/bin/bash
# Add your setup commands here
```

## Deployment

### Apply Changes

```bash
terraform apply
```

### Plan-only Deployment

To see changes without applying:

```bash
terraform plan -out=tfplan
terraform apply tfplan
```

### Targeted Deployment

To deploy specific resources:

```bash
terraform apply -target=resource_type.resource_name
```

## Outputs

After successful deployment, Terraform will display outputs defined in `output.tf`. These typically include:

- Instance IDs
- IP addresses
- DNS names
- Load balancer endpoints

View outputs anytime with:

```bash
terraform output
```

## Cleanup

To destroy all resources created by this configuration:

```bash
terraform destroy
```

Type `yes` to confirm destruction.

**Warning**: This will delete all resources managed by this Terraform configuration.

## Best Practices

### State Management

- **Never commit `terraform.tfstate` files to version control** (excluded by `.gitignore`)
- Store state files remotely using Terraform Cloud or S3 backend
- Enable state locking to prevent concurrent modifications

### Security

- Keep `terraform.tfvars` out of version control (excluded by `.gitignore`)
- Use AWS IAM roles instead of hardcoded credentials
- Use Terraform Cloud/Enterprise for sensitive variable management
- Consider using AWS Secrets Manager for sensitive data

### Code Organization

- Use consistent naming conventions
- Add descriptions to variables and outputs
- Use `terraform fmt` to maintain consistent formatting
- Use `terraform validate` to check configuration syntax

### Useful Commands

```bash
# Format Terraform files
terraform fmt

# Validate configuration
terraform validate

# Show current state
terraform show

# Check for syntax errors
terraform console

# Refresh state without applying
terraform refresh

# Lock provider versions
terraform lock
```

### Version Control

- Commit `main.tf`, `variables.tf`, `output.tf`, `provider.tf`
- Commit `userdata.sh` if it's generic
- Never commit `terraform.tfstate` or `terraform.tfvars`
- Use `.gitignore` to exclude sensitive files

## Support

For Terraform documentation and additional resources:
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
