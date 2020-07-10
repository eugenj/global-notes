# Requirements Analysis, and Design

* Who (users, developers, stakeholders)
* What (what doe the system do, what are the main features)
* Why (why it's needed)KPI
* When (want and developers can deliver)
* How (how the system will work, how many user, much data ...)

Roles represent the goal of a user at some point
* Not people
* Should describe a user objectives (what does the user want to do)

Persona describe a typical person who plays a role 
* Go find your users and talk to them
* They tell a story of who they are
* They are NOT a list of job functions
* For each role there could be manu personas

User stories decribe a feature from the user's point of view
* Give each story a title that describes its purpose
* Write a short, one sentence description
* Specify the user role, what they want to do and why
* Use the template: As a [ROLE], I want to [WHAT TO DO...], so that I [WHY THEY NEED IT...]

Evaluate user stories with the INVEST criteria
* Independent
* Negotiable
* Valuable
* Estimatable
* Small
* Testable

# KPIs and SLIs
KPI - ke performance indicators
* Business
 * ROI
 * Earning before interest and taxes (EBIT)
 * Employee turnover
 * Customer churn
* Software 
 * Page views
 * Userregistrations
 * Clickthroughs
 * Checkouts

KPI must be SMART to be effictive
* Specific
* Measurable
* Archivable
* Relevant
* Time-bound

SLI/SLO/SLA
* Indicators - measurable attribute
* Objectives - target values of SLI
* Agreements - contract which includes responsibilies if SLO fails

SLO must be achievable and relevant
Have just enough number of SLO to cover most important system quialities
Not all services have an SLA but should have SLO
SLO should be more strict that SLA

# Microservices

Independent services
Scalable

* Decompose apps by features to minimize dependecies
* Organize services by arch layers
* Isolate shared services (security etc)
* Isolate stateful services

## The 12  factor APP

* Codebase - one codebase tracked in revision control, many deploys
* Dependencies - explicitly declare and isolate dependencies
* Config - store config in the environment
* Backing services - treat backing services as attached resources (databases etc)
* Build, release, run - strictly separate build and run stages
  * build creates a deployment package from the source code
  * release combines the deployment with configuration in the runtime environment
  * run executes the application
* Processes - executes the app as one or more stateless processes (each instance of the app gets it's data from a separated db service)
* Port binding - export services via port binding
* Concurrency - scale out via the process model (add instances - they scale)
* Disposability - maximize robustness with fast startup and graceful shutdown
* Dev/prod parity - keep development, staging, and production as similar as possible
* Logs - treat logs as event streams (aggregate in a single place)
* Admin processes - run admin/management tasks as one-off processes (no manual tasks - all automated and repeatable, admin tasks should be a part of the application)

## REST

A good microservice design is loosely coupled
Think about backward compatibility
HTTP or gRPC (more performant) can be used
OpenAPI - interface description format for REST API

# Devops Automation

Code -> Run tests -> Create distr package -> Deploy

* Develop (Cloud Source Repositories)
* Build deployment package or docker image (Cloud Build)
* Build triggers (watch for changes in git repo and start build)
* Container registry (store docker images)

Binary authorization (enforce deploying only trusted containers to GKE)

All infrastructure should be disposable. 
* Cloud Deployment Manager - google only
* Terraform - cross cloud providers

# Choosing Storage Solution


* Storage Transfer Service
* Transfer Appliance (device to ship)
* Transfer service BigQuery from other clouds

# Google Cloud  and Hybrid Network Architecture

* Network Intelligence Center - visualize network topology

# Deploying apps

* App Engine
* GKE
* Cloud Deploy

# Designing reliable Systems

* design spare spare (N+2) 
* aware of correlated failures (failure domain) - isolate failure
* beware of cascading failure (when failure overloads another service and it fails)
* in GKE Istio implement curcuit breaker
* use lazy deletion (trash, soft-deletion, hard deletion)

Recovery Point Objectives and Recovery Time Objectives
Balance a cost of availability vs cost of unavailability

# Security

Identity aware proxy - requires users to login
Identity Platform - provides authentication as a service (integration with other providers)
Service Accounts - for machines and application identities. Used keys.

Remove external IPs - use Bastion Host with Firewall Rules instead

DDoS - CDN, Global Load Balancer, Cloud Armor

DEK - Data Encryption Key AES-256
KMS - Key Management Service (to manage own keys)
CSEK - Customer Supplied Encryption Keys (store on prem)

DLP - Data Loss Prevention API. Help to detect credit card loss and lots of other rules

# Maintanance and Monitoring

* Rolling updates - replace services without downtime
* Blue/Gree deployment
* Canary releases

Optimize cost
* Disks size and type
* Don't underutilize VMs
* Plan traffic (within region is free)
* GKE usage metering can prevent over-provisioning Kubernetes cluster
* Consider alternative services based on cost
* Pricing calculator
* Billing reports
* Google Data Studio - visualize billing data
* Set budgets and alerts

Cloud Monitoring





