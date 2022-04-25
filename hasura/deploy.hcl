metadata {
  path = "hasura"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ZqjNAo8Gapql0uWGPB6sM2hp040dkVCGaFXYq+81/Og="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "hasura/terraform"
  target  = "hasura/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ZqjNAo8Gapql0uWGPB6sM2hp040dkVCGaFXYq+81/Og="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "hasura"
  target  = "hasura/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "hasura",
  ]

  sha     = "h1:ZqjNAo8Gapql0uWGPB6sM2hp040dkVCGaFXYq+81/Og="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "hasura"
  target  = "hasura/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e94b16c6be94a70c85507227dd10d5865aa6a0fb2538c7d54b7a7388a4ff5a64"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "hasura"
  target  = "hasura/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "hasura",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "hasura"
  target  = "hasura/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "hasura",
  ]

  sha     = "h1:XTbmM3muLK3iyOwNSeiJvyiJJjEDkplogUWOwO/NV7I="
  retries = 1
  verbose = false
}
