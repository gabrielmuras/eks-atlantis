
# EKS Atlantis

The project was developed aiming to create a vpc, eks, load balancer controller and deploy atlantis using a single terraform command. The challenge was to execute everything in a single command and not use major modules.

Created Modules:

- VPC
- Load Ballancer Controller
- EKS
- Atlantis

Link to the PR with Demo: https://github.com/gabrielmuras/eks-atlantis/pull/3

## Usage

### Backend and Provider

You should create a S3 bucket to storage the state and update the backend.tf file. Also edit the provider with your preferred method. 

### Atlantis

Optional if you want that atlantis actually executes instead of dummy deployment

- Recommended to create a different AWS token exclusively for atlantis but you can use your own for testing

- Follow https://www.runatlantis.io/docs/installation-guide.html to setup the github repo


### Variables

This project was created aiming the [terraform.workspace] variables because as this is an EKS cluster that aims to be the first one in a account. And is responsible to create other infrastructure components it will be mainly executed locally and dealing with tfvars ou vars files can cause environment mistakes. Like applying staging vars on production for example. But to simplify the apply now it is using default values.

- Edit the vars.tf to add your atlantis settings and other possible settings that you would like to change

```hcl
variable "atlantis" {
  default = {
    orgAllowlist                   = ""
    ingress_annotations_class      = "alb"
    ingress_annotations_type       = "internet-facing"
    github_user                    = "dummyUser"
    github_token                   = "dummyToken"
    github_webhook_secret          = "dummySecret"
    atlantis_aws_secret_access_key = ""
    atlantis_aws_access_key_id     = ""
  }
}
```

- Init terraform

```bash
terraform init
```

- Create your workspace 

```bash
terraform workspace new <your-workspace>
```

- Terraform Plan

```bash
terraform plan
```

- Terraform Apply


```bash
terraform apply
```

You can checkout the resources created on the atlantis namespace using kubectl and retrieve the ingress name to finish the atlantis setup.


## Considerations

Some decisions were made based on the requirements and to try to stay as much as possible in the AWS Free Tier.
I don't think that using terraform is the best approach to apply kubernetes/helm manifests as we have much more robust solutions out there and different ways to do that. But it was the easiest solution to not need any manual intervention (like a pipeline approve) or other major overengineering solutions.

## Screenshots

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/5d70d49c-3052-473e-a585-a302cdba1356)

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/72ab5981-9e12-4052-b4aa-540f89c987cb)

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/b2f5fea5-f279-4561-95ca-ac98aa737b72)

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/37413dd1-9a06-464b-9bd7-1180a0f089fe)

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/19d3ca66-8171-4104-beac-24d817a23da2)

![image](https://github.com/gabrielmuras/eks-atlantis/assets/62755656/59507e37-98f4-4986-9f7b-74e4d066cc1f)

