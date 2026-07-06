# AWS VPC Peering with Terraform

This repository contains a modular, production-grade Terraform configuration to set up a private, bidirectional **VPC Peering Connection** between two isolated Virtual Private Clouds (VPCs) in AWS. It automates network isolation, secure connection handshakes, and dynamically updates route tables for seamless private communication.

## Architecture Diagram

The architecture provisions two completely non-overlapping IP networks connected via a private AWS Peering Connection interface, bypassing the public internet entirely:

```text
+------------------------------------+       +------------------------------------+
|  VPC A (Requester)                 |       |  VPC B (Accepter)                  |
|  CIDR: 10.1.0.0/16                 |       |  CIDR: 10.2.0.0/16                 |
|                                    |       |                                    |
|   +----------------------------+   |       |   +----------------------------+   |
|   | Subnet A (10.1.1.0/24)     |   |       |   | Subnet B (10.2.1.0/24)     |   |
|   +--------------+-------------+   |       |   +--------------+-------------+   |
|                  |                 |       |                  |                 |
|                  v                 |       |                  v                 |
|   +----------------------------+   |       |   +----------------------------+   |
|   | Route Table A              |   |       |   | Route Table B              |   |
|   | Destination -> Target      |   |       |   | Destination -> Target      |   |
|   | 10.1.0.0/16 -> local       |   |       |   | 10.2.0.0/16 -> local       |   |
|   | 10.2.0.0/16 -> pcx-xxxx ---+---+-------+---> 10.1.0.0/16 -> pcx-xxxx    |   |
|   +----------------------------+   |       |   +----------------------------+   |
|                                    |       |                                    |
+------------------------------------+       +------------------------------------+
                                 ^               ^
                                 |   VPC Peer    |
                                 +---------------+├── provider.tf
Project Structure
This configuration follows Infrastructure as Code (IaC) layout best practices, separating concerns into dedicated infrastructure files:


├── provider.tf        # Configures the core HashiCorp AWS provider and region settings
├── vpc.tf             # Defines the main Requester and Accepter VPC network boundaries
├── subnet.tf          # Carves out the isolated neighborhood networks inside each VPC
├── routetable.tf      # Creates and binds the foundational route tables to the subnets
├── peering.tf         # Establishes the core VPC Peering link and handles account handshake
├── networkroutes.tf   # Writes custom rules instructing the route tables to use the peering tunnel
├── .gitignore         # Prevents heavy plugin folders (.terraform/) and text state keys from uploading
└── README.md          # Project overview, architecture flow, and deployment steps

How It Works:
Isolation: vpc.tf and subnet.tf stand up your private cloud slices completely isolated from one another.

The Guard: routetable.tf attaches a packet-handling route table to the subnets.

The Tunnel: peering.tf spins up the physical connection link between VPC A and VPC B with auto_accept = true.

The Navigation: networkroutes.tf edits the route tables to ensure cross-network destinations match and exit smoothly via the peering link interface.

Deployment Steps:
Execute the following lifecycle steps inside your terminal to safely stand up the architecture:

# 1. Initialize the project (Downloads cloud provider dependencies)
terraform init

# 2. Confirm syntactic accuracy
terraform validate

# 3. Preview execution plan layout changes safely
terraform plan

# 4. Deploy resources onto AWS
terraform apply

Teardown & Cleanup:
To avoid incurring ongoing maintenance and resource fees on your active AWS account, tear down the environment when testing is finalized:


terraform destroy

---

### Push the Full Code up to GitHub

Now that everything is fully split out into your modular files and the README is written, run these terminal commands to stage, commit, and sync the finalized structure to your repository:


# 1. Stage all your new .tf files and the modified README.md
git add .

# 2. Make sure it's clean (this shows you what's ready to go up)
git status

# 3. Create a clean save point
git commit -m "Complete modular VPC peering deployment structure with markdown documentation"

# 4. Push it live!
git push origin main
