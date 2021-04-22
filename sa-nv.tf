resource "kubernetes_service_account" "example" {
  metadata {
    name = "neuvector"
    namespace = var.ns
  }
}
