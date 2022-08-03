### Deploy eks cluster on terraform to use helm chart

## Run terraform as container

` docker run -it hashicorp/terraform:latest --version`

## Authenticate terraform to aws

`docker-compose run --rm aws --version`
`docker-compose run --rm aws configure --profile terraform-operator`
