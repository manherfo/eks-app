# eks-app

This project will guide you through the process of creating the infrastructure in AWS for a web app with EKS and Terraform.

## Prerequisites

Before you begin, you will need to have the following tools installed on your local machine:

- kubectl
- AWS CLI
- Terraform
- Docker

Also you will need to create an s3 bucket to store the terraform state and put the name of this bucket in the `terraform/terraform.tf`

![Architecture](images/eks-architecture.png
)

## Creating the Infrastructure

1. Navigate to the `terraform` directory and run `terraform init` to initialize the Terraform project.

2. Run `terraform plan` to view the resources that will be created.

3. Run `terraform apply` to create the infrastructure in AWS.

## Building and Pushing the Docker Image

1. Navigate to the root directory of the project.

2. Run `aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin <AWS-ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com` to log in to your ECR repository.

3. Run `docker build -t my-app .` to build the Docker image.

4. Run `docker tag my-app <AWS-ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/blocks57:latest` to tag the Docker image.

5. Run `docker push <AWS-ACCOUNT>.dkr.ecr.us-east-2.amazonaws.com/blocks57:latest` to push the Docker image to the registry.

## Applying the kubernetes manifest

1. Navigate to the `kubernetes` directory.

2. Run `kubectl apply -f deployment.yaml` ¡

## Pipeline

This project includes a GitHub Actions pipeline that performs the following steps:

1. Runs `terraform init`, `terraform plan`, and `terraform apply` to create the infrastructure in AWS.

2. Builds the Docker image and pushes it to the ECR repository.

3. Applies the kubernetes manifests to deploy the web app to the EKS cluster.

To use the pipeline, create a new GitHub Actions workflow and reference the provided `pipeline.yml` file. Make sure to set the necessary environment variables in the workflow. (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY)
