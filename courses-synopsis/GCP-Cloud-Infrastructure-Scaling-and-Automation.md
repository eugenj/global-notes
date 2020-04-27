# Overview

Interconnecting Networks
Load Balancing and Autoscaling
Infrastructure Automation
Managed Services

# Cloud VPN
Connects on-premises network to GCP VPC
* low volume data connection
* 99.9% SLA
* supports
  * site-to-site VPN
  * static routes
  * dynamic routes (with Cloud Router)
  * IKEv1 & IKEv2 ciphers

# Cloud interconnect and peering

| | Dedicated | Shared |
|-|-|-|
| Layer 3 | Direct Peering | Carrier Peering |
| Layer 2 | Dedicated Interconnect | Partner Interconnect |

## Dedicated Interconnect

When Google and Customer networks meet on co-location (certain points in the world)

## Partner interconnect

When you can't get to the point where Google Data Center live. Instead partners provide network to the DC.

## Direct Peering

No SLA
Exchange BGP routes

Edge Points of Presence (PoPs) all around the world.

# Sharing VPC Networks

Either one big shared VPC (for single organization) or peering between different VPC (different organization).

# Load Balancing and Autoscaling

Global (Google Frontends) or Regional Load balancers

* Global
  * HTTP(S)
  * SSL proxy
  * TCP proxy
* Regional
  * Internal TCP/UDP (Andromeda)
  * Network TCP/UDP (Maglev)
  * Internal HTTP(S)

## Managed instance groups

* identical instances based on **instance templates**
* can be resized
* manager ensures all instances are running
* typically used with autoscaler
* can be single zone or regional

### Autoscaling policy
CPU / Capacity / metrics / queue-based workload

### Health check
how often, how long to wait, healthy and unhealthy threshold

## HTTPs load balancers

IPv4 or IPv6
url maps (url -> instance(s))

### Backend services
* Health checks
* Session affinity (optional)
* Timeout setting (30sec default)
* One or more backends
  * instance group (managed or unmanaged)
  * balancing mode (CPU utilization or RPS)
  * capacity scaler (ceiling % of CPU/Rate targets)
 
# Load babalncer

## SSL/TCP proxy load balancing

* Global
* for non-http
* terminate ssl sessions (just SSL)
* IPv4 / IPv6
* Intelligent and region aware balancing

## Network load balancer 

* Regional, non-proxied
* Works with target pools

## Internal load balancing

* Regional private load balancing
* Reduced latency, simple configuration
* Software defined load balancer based on Andromeda

# Deployment manager

* Repetable deployment process
* Declarative language
* Focus on the application
* Parallel demployment
* Template-driven







