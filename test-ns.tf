resource "kubernetes_namespace" "test-ns" {
  metadata {
    
    labels = {
      mylabel = "demo"
    }

    name = var.test-ns
  }
  
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/neuvector/manifests/main/kubernetes/crd-k8s-1.19.yaml"
  }
 
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/devseclabs/nv-deployment/main/crd/test-rules.yml"
  }
}
