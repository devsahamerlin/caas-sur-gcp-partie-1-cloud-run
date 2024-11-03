## Serie: CaaS On GCP with Cloud Run, GKE(Public and Private, Autopilot and Standard), Anthos Multi-cloud on GCP and AWS using Terraform
### Partie 1 - Cloud Run : video https://youtu.be/tWC18tWmGOo

### Prerequisites
#### GCP

```shell
git clone https://github.com/devsahamerlin/caas-sur-gcp-partie-1-cloud-run.git
cd ~/caas-sur-gcp-partie-1-cloud-run

export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
export GCP_LOCATION=us-east4
export GCP_ARTIFACT_REGISTRY_NAME=drag0524sm-repository
export DOCKER_IMAGE=summarizer-genai-web-app
export BUCKET_SUFFIX=drag0524sm

sudo chmod +x requirements.sh
./requirements.sh
```

## Deploy on Cloud Run

![Cloud-Run-GenAI.svg](images%2FCloud-Run-GenAI.svg)

## For IaC demo with external HTTP(S) Application Load Balancer

```shell

terraform init
terraform plan -var-file=terraform-demo.tfvars
terraform apply -var-file=terraform-demo.tfvars --auto-approve

cd ~/caas-sur-gcp-partie-1-cloud-run/summarizer-genAI-web-app

chmod +x deploy.sh
./deploy.sh

cd ~/caas-sur-gcp-partie-1-cloud-run
```

## Follow youtube video for console demo
https://youtu.be/tWC18tWmGOo