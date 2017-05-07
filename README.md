# iac
Infrastructure as Code(IaC) with DigitalOcean and Terraform

# setup instructions
1. clone the repo
2. Add the following environment variables in your bash:
   - export DIGITALOCEAN_TOKEN="your digitalocean token"
   - export TF_VAR_do_ssh_ids='[your digitalocean ssh id]'
3. Run terraform apply
4. In few minutes, you'll have a single loadbalancer and 2 droplet instances up and running in your digitalocean account. 
