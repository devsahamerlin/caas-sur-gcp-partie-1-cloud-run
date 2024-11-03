## Deploy on Cloud Run
gcloud auth configure-docker ${GCP_LOCATION}-docker.pkg.dev

#docker build -t ${DOCKER_IMAGE} -f Dockerfile .
#
#docker tag ${DOCKER_IMAGE} ${GCP_LOCATION}-docker.pkg.dev/${PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}/${DOCKER_IMAGE}:latest
#docker images
#
#docker push ${REGION}-docker.pkg.dev/${PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}/${DOCKER_IMAGE}:latest

gcloud builds submit --tag "$GCP_LOCATION-docker.pkg.dev/${PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}/${DOCKER_IMAGE}:latest"

gcloud -q run deploy app --region $GCP_LOCATION \
--image "$GCP_LOCATION-docker.pkg.dev/${PROJECT_ID}/${GCP_ARTIFACT_REGISTRY_NAME}/${DOCKER_IMAGE}:latest" \
--set-env-vars=PROJECT_ID=${PROJECT_ID},GCP_LOCATION=${GCP_LOCATION} \
--allow-unauthenticated \
--execution-environment=gen2 \
--region=${GCP_LOCATION} \
--port=8080