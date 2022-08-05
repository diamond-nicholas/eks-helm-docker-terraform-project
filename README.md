### Deploy eks cluster on terraform to use helm chart

## Run terraform as container

` docker run -it hashicorp/terraform:latest --version`

## Install awscli

`docker-compose run --rm aws --version`

## Authenticate terraform to aws

`docker-compose run --rm aws configure --profile terraform-operator`

## Run terraform via docker-compose

`docker-compose run --rm terraform init`

`docker-compose run --rm terraform validate`

`docker-compose run --rm terraform plan`

`docker-compose run --rm terraform apply`

## Run kubectl of all namespace

`docker-compose run --rm kubectl get all --all-namespaces`

## Check worker nodes

`docker-compose run --rm kubectl get nodes`

`docker-compose run --rm kubectl apply -f /code/config-map-aws-auth_awesome.yaml`

## Create deployment with kubectl view yaml

` kubectl create deployment hello-world --image=nginx --dry-run -o yaml`

## Create deployment with kubectl

`kubectl create deployment hello-world --image=nginx`

## expose port via port forward

` kubectl port-forward hello-world-5d569666ff-x7tc5 8090:80`

## Create first helm-chart

`helm create hello-chart`

## Deploy helm chart

`kubectl create ns nshello`

`helm install myapp hello-chart --namespace nshello`

## check current ns app

`helm list --namespace nshello`

## View Pod

`echo $POD_NAME`

## Forward helm-chart pods

`kubectl --namespace nshello port-forward $POD_NAME 8090:80 --address 0.0.0.0`

## Upgrade Helm Chart

`helm upgrade myapp hello-chart --namespace nshell`
