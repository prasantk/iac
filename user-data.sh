#!/bin/bash
echo "<html><p style=\"text-align:center;\"><img src=\"${image_url}\" alt=\"Infrastructure As Code\" /></p></html>" > index.html
nohup busybox httpd -f -p "${server_port}" &