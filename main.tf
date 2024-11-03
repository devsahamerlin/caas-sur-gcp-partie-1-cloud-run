resource "google_service_account" "terraform_sa" {
  project      = var.gcp_project_id
  for_each     = local.services_account
  account_id   = each.value["account_id"]
  display_name = each.value["display_name"]
}

resource "google_project_iam_member" "terraform_sa_roles" {
  depends_on = [google_service_account.terraform_sa]
  for_each   = { for idx, sa in local.sa_flattened : "${sa["account_id"]}_${sa["role"]}" => sa }
  project    = var.gcp_project_id
  role       = each.value["role"]
  member     = "serviceAccount:${each.value["account_id"]}@${var.gcp_project_id}.iam.gserviceaccount.com"
}

module "repository" {
  source                 = "./modules/gcp/artifact-registry"
  repository_location    = var.gcp_location
  repository_id          = "${var.name_prefix}-repository"
  repository_description = "${var.gcp_location} system common repositories"
  repository_format      = "DOCKER"
  project_id             = var.gcp_project_id
}

##### GCP #######

######## Cloud Run #########

module "cloud-run-app" {
  depends_on = [ google_project_iam_member.terraform_sa_roles ]
  source = "./modules/gcp/cloud-run"
  gcp_region           = var.gcp_location
  image                = var.gcp_cloud_run_image
  ingress              = "INGRESS_TRAFFIC_ALL"
  maxScale             = var.gcp_cloud_run_max_scale
  minScale             = var.gcp_cloud_run_min_scale
  name                 = "app"
  project_id           = var.gcp_project_id
  service_account_name = "cloud-run-sa@${var.gcp_project_id}.iam.gserviceaccount.com"
}

module "app-load-balancer" {
  source = "./modules/gcp/cloud-run-load-balancer"
  cloud_run_service = module.cloud-run-app.name
  name = module.cloud-run-app.name
  region = var.gcp_location
  gcp_project = var.gcp_project_id
}