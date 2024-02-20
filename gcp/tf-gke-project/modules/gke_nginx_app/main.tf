resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name = "nginx-demo"
    labels = {
      app = "nginx"
    }
  }

spec {
    replicas = 3
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx-service"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      protocol = "TCP"
      port     = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}