# Provision EKS Cluster on Terraform and Deploy with Helm Chart

### N.B

You can either run the application via container with the docker-compose file or run it on your machine.

If you wish to run on docker-compose, go to setup.md and follow the instructions

## Check awscli

`aws --version`

## Authenticate terraform to aws

`aws configure --profile terraform-operator`

## Run terraform

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply`

## Run kubectl of all namespace

`kubectl get all --all-namespaces`

## Check worker nodes

`kubectl get nodes`

## Deploy helm chart

`kubectl create ns nshellon` this creates the namespace

`helm install myapp hello-chart --namespace nshellon`

## check current ns app

`helm list --namespace nshellon`

## View Pod

`echo $POD_NAME`

## Forward helm-chart pods

`kubectl --namespace nshellon port-forward $POD_NAME 8090:80 --address 0.0.0.0`

## Upgrade Helm Chart

`helm upgrade myapp hello-chartn --namespace nshellon`

## Install ingress charts

`helm repo add nginx-stable https://helm.nginx.com/stable`
` helm repo update`
`helm install ingress nginx-stable/nginx-ingress --namespace kube-system -f charts/nginx-ingress/values.yaml`

## Install JEnkins via helm

`helm repo add jenkins https://charts.jenkins.io`

`helm repo update`

`helm upgrade --install -f charts/jenkins/values.yaml myjenkins jenkins/jenkins`

## Get ur admin password by running this

`kubectl exec --namespace default -it svc/myjenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo`

## Get url

`kubectl get svc --namespace default myjenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}"`
