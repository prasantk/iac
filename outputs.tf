/*output "address_web1" {
    value = "${digitalocean_droplet.www-1.ipv4_address}"
}*/

/*output "address_web2" {
    value = "${digitalocean_droplet.www-2.ipv4_address}"
}*/

output "address_lb" {
    value = "${digitalocean_loadbalancer.public.ip}"
}