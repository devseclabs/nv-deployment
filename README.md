# NV-Deployment
Terraform Neuvector Deployment with License Key and Test Pods

### How to deploy

1. Clone the project
2. Adjust your values in   ```terraform.tfvars.tpl```
    - configure your dockerhub crendentials
    - add your license key 
3. Rename the file to `terraform.tfvars`
4. Deploy and Manage your deployment using terraform:
    - init your plugins  - ```terraform init```
    - plan your deployment - ```terraform plan```
    - apply the changes in your cluster ```terraform apply```

### Clean Up
1. destroy your deployment: ```terraform destroy```

