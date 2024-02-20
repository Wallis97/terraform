provider "google" {
  credentials = file("/home/adamwallis/terraform/gcp/tf-gke-project/containerized-app-gke-7927a34dda92.json")
  project     = "containerized-app-gke"
  region      = "europe-central2"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "null_resource" "update_kubeconfig" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials tf-cluster --region europe-central2 --project containerized-app-gke"
  }
  depends_on = [module.gke_cluster]
}