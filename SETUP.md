### Run terraform as container

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

`docker-compose run --rm kubectl create deployment hello-world --image=nginx --dry-run -o yaml`

## Create deployment with kubectl

`docker-compose run --rm kubectl create deployment hello-world --image=nginx`

## expose port via port forward

`docker-compose run --rm kubectl port-forward hello-world-5d569666ff-x7tc5 8090:80`

## Create first helm-chart

`docker-compose run --rm helm create hello-chart`

## Deploy helm chart

`docker-compose run --rm kubectl create ns nshello`

`docker-compose run --rm helm install myapp hello-chart --namespace nshello`

## check current ns app

`docker-compose run --rm helm list --namespace nshello`

## View Pod

`docker-compose run --rm echo $POD_NAME`

## Forward helm-chart pods

`docker-compose run --rm kubectl --namespace nshellon port-forward $POD_NAME 8090:80 --address 0.0.0.0`

## Upgrade Helm Chart

`docker-compose run --rm helm upgrade myapp hello-chartn --namespace nshellon`

## Install metric/server

`docker-compose run --rm helm repo add bitnami https://charts.bitnami.com/bitnami `

`docker-compose run --rm helm install metrics-server bitnami/metrics-server --namespace kube-system -f charts/metrics-server/values.yaml`

`docker-compose run --rm helm upgrade --namespace kube-system metrics-server bitnami/metrics-server --set apiService.create=true `

## Install cluster-autoscaler

`docker-compose run --rm helm repo add stable https://charts.helm.sh/stable`

`docker-compose run --rm helm install cluster-autoscaler stable/cluster-autoscaler --namespace kube-system -f charts/cluster-autoscaler/values.yaml`

## Check cluster logs

`docker-compose run --rm kubectl -n kube-system logs -f cluster-autoscaler-aws-cluster-autoscaler-6499df5c6d-7pjc4`

## Install ingress charts

`docker-compose run --rm helm repo add nginx-stable https://helm.nginx.com/stable`
`docker-compose run --rm helm repo update`
`docker-compose run --rm helm install ingress nginx-stable/nginx-ingress --namespace kube-system -f charts/nginx-ingress/values.yaml`

## Install JEnkins via helm

`docker-compose run --rm helm repo add jenkins https://charts.jenkins.io`

`docker-compose run --rm helm repo update`

`docker-compose run --rm helm upgrade --install myjenkins jenkins/jenkins`

`docker-compose run --rm helm upgrade --install -f charts/jenkins/values.yaml myjenkins jenkins/jenkins`

## Get ur admin password by running this

`docker-compose run --rm kubectl exec --namespace default -it svc/myjenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo`

## Forward port

`docker-compose run --rm kubectl --namespace default port-forward svc/myjenkins 8080:8080`
