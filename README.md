# NV-Deployment
Terraform Neuvector Deployment with License Key and Test Pods

## Versions

| Name | Version |
|------|---------|
| terraform | >= 0.14
| kubernetes provider| >= 2.0 |

### How to deploy

1. Clone the project
2. Adjust your values in   ```terraform.tfvars.tpl```
    - configure your dockerhub crendentials
    - configure your k8s context to deploy (default path: ~/.kube/config)
    - add your license key 
3. Rename the file to `terraform.tfvars`
4. Deploy and Manage your deployment using terraform:
    - init your plugins  - ```terraform init```
    - plan your deployment - ```terraform plan```
    - apply the changes in your cluster ```terraform apply```

### Clean Up
1. destroy your deployment: ```terraform destroy```

