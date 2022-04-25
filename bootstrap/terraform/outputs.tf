output "cluster" {
	value = module.gcp-bootstrap.cluster
	sensitive = true
}


output "vpc_network" {
	value = module.gcp-bootstrap.vpc_network
	sensitive = true
}


