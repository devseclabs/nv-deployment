provider "kubernetes" {
  config_path    = "~/.kube/config"
  # UPDATE YOUR CONTEXT
  config_context = var.context
}
