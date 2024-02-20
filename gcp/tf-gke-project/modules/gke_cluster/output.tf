output "cluster_endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}

output "cluster_dependency" {
  value = google_container_cluster.gke_cluster
}