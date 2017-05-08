provider "digitalocean" {
}

resource "digitalocean_droplet" "www-1" {
    image = "${var.do_image}"
    name = "www-1"
    region = "${var.do_region}"
    size = "${var.do_image_size}"
    ssh_keys = ["${var.do_ssh_ids}"]
    private_networking = true

    user_data = "${data.template_file.user_data1.rendered}"
}

resource "digitalocean_droplet" "www-2" {
    image = "${var.do_image}"
    name = "www-2"
    region = "${var.do_region}"
    size = "${var.do_image_size}"
    ssh_keys = ["${var.do_ssh_ids}"]
    private_networking = true

    user_data = "${data.template_file.user_data2.rendered}"
}

data "template_file" "user_data1" {
    template = "${file("user-data.sh")}"

    vars {
        image_url = "${var.image_url}/iac-blue.png"
        server_port = "${var.server_port}"
    }
}

data "template_file" "user_data2" {
    template = "${file("user-data.sh")}"

    vars {
        image_url = "${var.image_url}/iac-orange.png"
        server_port = "${var.server_port}"
    }
}

resource "digitalocean_loadbalancer" "public" {
    name = "loadbalancer"
    region = "${var.do_region}"

    forwarding_rule {
        entry_port = 80
        entry_protocol = "http"

        target_port = 80
        target_protocol = "http"
    }
    healthcheck {
        port = 22
        protocol = "tcp"
    }

    droplet_ids = ["${digitalocean_droplet.www-1.id}", "${digitalocean_droplet.www-2.id}"]
}