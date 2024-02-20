module "gke_cluster" {
  source = "./modules/gke_cluster"

  region      = var.region
  clusterName = var.clusterName
  diskSize    = var.diskSize
  minNode     = var.minNode
  maxNode     = var.maxNode
  machineType = var.machineType
}

module "gke_nginx_app" {
  source = "./modules/gke_nginx_app"
}