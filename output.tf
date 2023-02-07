output "public-dns" {
  value = module.publicload.dnsload
}
output "private-dns" {
  value = module.privateload.dnsload
}
