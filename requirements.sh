export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
export GCP_LOCATION=us-east4
export GCP_ARTIFACT_REGISTRY_NAME=drag0524sm-repository
export DOCKER_IMAGE=summarizer-genai-web-app
export BUCKET_SUFFIX=drag0524sm


#gcloud config set auth/impersonate_service_account gcp-multi-cloud-sa@${PROJECT_ID}.iam.gserviceacccount.com # Most have the role: roles/iam.serviceAccountTokenCreator
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token)

gcloud config set project "${PROJECT_ID}"
#gcloud auth application-default login --no-launch-browser

gcloud --project="${PROJECT_ID}" services enable \
    cloudresourcemanager.googleapis.com \
    iamcredentials.googleapis.com \
    container.googleapis.com \
    artifactregistry.googleapis.com \
    compute.googleapis.com \
    logging.googleapis.com \
    monitoring.googleapis.com \
    stackdriver.googleapis.com

gcloud --project="${PROJECT_ID}" services enable \
    storage-api.googleapis.com \
    storage-component.googleapis.com \
    securetoken.googleapis.com \
    iap.googleapis.com \
    run.googleapis.com \
    aiplatform.googleapis.com \
    cloudbuild.googleapis.com