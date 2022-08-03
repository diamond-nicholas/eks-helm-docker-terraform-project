### Deploy eks cluster on terraform to use helm chart

## Run terraform as container

` docker run -it hashicorp/terraform:latest --version`

## Install awscli

`docker-compose run --rm aws --version`

## Authenticate terraform to aws

`docker-compose run --rm aws configure --profile terraform-operator`

## Run terraform via docker-compose

`docker-compose run --rm terraform init`

`docker-compose run --rm terraform plan`

`docker-compose run --rm terraform apply`
