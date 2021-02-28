resource "kubernetes_config_map" "nv-conf" {
  metadata {
    name = "nv-conf"
    namespace = var.ns
  }

  data = {
    #license_key = var.license
    "initcfg.yaml" = file("config/initcfg.yaml")
  }

}