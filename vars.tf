variable "do_region" {
  default = "blr1"
}

variable "do_image" {
  default = "ubuntu-16-04-x64"
}

variable "do_image_size" {
  default = "512mb"
}

variable "do_private_key" {
  default = "~/.ssh/digitalocean_id_rsa"
}

variable "do_ssh_ids" {
  type = "list"
}