metadata {
  name = "hasura"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/hasura"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "354016358abed0991eb625f4471ac729e577198fcd2fd915e802c9027fa80325"
    retries = 0
    verbose = false
  }
}
