output "master_public_ip" {
  description = "Master node Public IP"
  value       = module.vms["master"].public_ip
}


output "worker_public_ips" {
  description = "Worker nodes Public IPs"
  value = {
    for k, v in module.vms : k => v.public_ip
    if k != "master"
  }
}
