# Overview

All the range of services from IaaS, via PaaS to SaaS.
* CPUs, Memory, Disks, Interfaces
* Servers, VM instances
* Clusters, Cluster management
* Serverless, Autoscaling

## Compute services
* Compute engine
* Google Kubernetes Engine
* App Engine
* Cloud Functions

## Interaction with GCP
GCP Console, Cloud SDK, Cloud Shell
GC Client libraries

# Virtual Private Cloud

GCP backbone consists of 
* Regions
* Edge point of presence (PoP)
* Networks

## VPC Objects
* Projects
* Networks
  * Default
  * auto mode
  * custom mode
* Subnetworks
* Regions
* Zones
* IP addresses
  * Internal
  * External
  * Range
* VMs
* Routes
* Firewall rules

## Projects, networks, and subnetworks

**Project**
* Associates objects and services with billing
* Contains networks (up to 5) that can be shared/peered (with other projects)

**Network**
* Has no IP address range
* Is global and spans all available regions
* Contains subnetworks
* Is available as default, auto or custom (like in region)

### 3 VPC network types
* Default
  * Every project
  * One subnet for region
  * Default firewall rules
* Auto Mode
  * Default network
  * One subnet per region
  * Regional IP allocation
  * Fixed /20 subnetwork per region
  * Expandable up to /16
* Custom Mode
  * No default subnets created
  * Full control of IP ranges
  * Regional IP allocation
  * Expandable to any RFC 1918 size

**Auto -> Custom one way convertion allowed**

### Expand  subnets without re-creatin instances
* Cannot overlap with other subnets
* Must be inside the RFC 1918 address spaces
* Can expand but not shrink
* Auto mode can be expanded from /20 to /16
* Avoid large subnets

## IP addresses

VMs can have internal and external addresses

### Internal IP
* Allocated from subnet range to VMs by DHCP
* Lease renewed every 24 hours
* VM name + IP is registered with network-scoped DNS

### External
* Assigned from pool (ephemeral)
* Reseved (static)
* Billed when not attached to a running VM
* VM does not know external IP - it is mapped to the internal IP

## DNS resolution

### DNS resolution for internal addresses
FQDN is [nostname].[zone].c.[project-id].internal
Internal DNS resolver as part of Compute Engine (169.254.169.254) - provides answer for internal and external addresses

### DNS resolution for External addresses
Public DNS records are not published automatically
DNS zones can be hosted using Cloud DNS

### Cloud DNS
100% uptime SLA
UI, CLI, or API

Set alias IP ranges to VM's NIC

## Routes and Firewall

Route table is created when subnet is created. Traffic delivered is it matches firewall rules.
Route tables support VM instance tag. Not tagged records apply to all the instances.

Firewall
* VPC acts like a disrtibuted firewall. 
* Rules apply to the network as a whole. 
* Connections are allowed or denied on the instance level. 
* Firewall rules are stateful.
* Implied deny all ingress and allow all egress. (if no other rules)
* Rules support action deny or allow
* Rules can be mapped to instance level

## Pricing
Ingress - No charge
Egress - same zone, or Google products - free
Egress between zones, same zone ext. IP address, between regions - $0.01 per Gb
Egress other regions - varies
Use GCP Pricing calculator

# Virtual Machines
## GCP compute and processing options
Compute Engine supports any language, usage model IaaS, Server Autoscaling, primary used for General Workloads
Other options
* Kubernetes Engine
* App Engine Standard
* App Engine Flexible
* Cloud Functions

Compute Engine (IaaS)
* vCPUs (cores) and Memory
* Persitent disks: HDD, SSD, and Local SSD
* Networking
* Linux or Windows

## vCPU
* Network throughtput scales at 2Gbps per vCPU
* Theoretical max throughtput of 16Gbps with 8 vCPU
* A vCPU is equal to 1 hardware hyper-thread

## Storage
* Standard (max 64TB) / SSD (max 64TB) / Local SSD (for tmp storage)
* Standard and SSD PDs scale in performance for each GB of space allocated
* Resize disks or migrate instancs with no downtime
IOPs depends on size

## VM lifecycle
* Provisioning
* Staging
* Running <--> Reset
* Stopping
* Terminated
No charge for stopped VM (charged for attached disks and IPs)
Allowed to change machine type, add/remove disks, tags, metadata, static IPs, Can't change an image

## Machine types
* Standard
* High-memory
* High-CPU
* Memory optimized
* Compute-optimized
* Shared-core
* Custom (you specify everything)

## Pricing
* Per-second billing with minimum of 1 minute
* Resource-based pricing
* Disounts
  * Sustained use
  * Committed use
  * Preemptible VM instances
* Recommendation Engine notifies you of underutilized instances
* Free usage limits

### Preemptible
Lower price for interruptible services (up to 80%)
Might be terminated any time (no charge if terminated first 10 minutes, 24 hours max, 30 second terminate warning but not guaranteed)

### Sole-tenant nodes
physically isolated workloads. Useful for complience tasks.

### Shielded VMs offer verifiable integrity
* Secure Boot
* Virtual trusted platform module (vTPM)
* Integrity monitoring
* Required shielded Image

## Images
* Boot loader
* Operating system
* File system structure
* Software
* Customizations

Public or custom images
Images charged per second with 1 min minimum (some exceptions like MSSQL min 10 min and per minute)

Boot disk is durable (can survive VM termination)
### Persistent disks
* attached to a VM through the network interface
* durable
* bootable
* snapshot 
* performance scales with size
* Features
  * NDD / SSD
  * Disk resizing
  * RO mode to multiple VM
  * Encryption keys (Google managed, customer managed, customer supplied)






