# Content
* Cloud IAM
* Data Storage Services
* Resource Management
* Resource Monitoring

# Cloud IAM
Resource Hierarchy
Organization -> Folders -> Projects -> Resources
Child policies can't restrict access granted at the parent level.

## Organization node
Roles:
* Organization Admin
* Project Creator
* Viewer

G Suite or Cloud Identity super administrator

## Folders
Roles:
* Admin
* Creator
* Viewer

Can be used to model departments/team/etc hierarchy in organization

## Project
Roles:
* Creator
* Deleter

## Roles
* Primitive (Owner/Editor/Viewer/Billing)
* Predefined (can do what on what resource: Compute admin, Network Admin, Storage Admin)
* Custom (fine grained access)

Role is a set of permissions (like compute.instances.get)

## Members
Types:
* Google accounts
* Service accounts
* Google Groups
* Google Identity or G Suite Domain (your org domain)

AD or LAP -one-way-sync-> Users and groups in Cloud Identity domain
SSO

Service accounts:
* User-created
* Built-in
* Google API service accounts

Default Compute Engine service accounts

Service accounts authenticated by keys (GCP or User managed)

## Best practices
* Use projects to group resources that share the same trust boundaries
* Check the policy granted on each resource amnd make sure you understand the inheritance
* Use principle of least privilege when granting roles
* Audit policies in Cloud audit logs (setiampolicy)
* Audit membership of groups ised in policies
* Grant roles to Google groups instead of individuals

# Data Storage Services

* Object
  * Cloud Storage (binary and object data like images, backups)
* Relational
  * Cloud SQL (web frameworks like CMS, eCommerce)
  * Cloud Spanner (RDMS + scale, HA, HTAP like User metadata, Ad/Fin/MarTech)
* Non-Relational
  * Cloud Firestore (Hierarchical, mobile, web, like user profiles, game state)
  * Cloud Bigtable (Heavy read + write, events like AdTech, financial, IoT)
* Warehouse
  * BigQuery (Enterprise data warehouse like analytics, dashboards)

## Cloud Storage
Supports ACLs
Objects are immutable, supports versioning
Object lifecycle management (based on rules, applies to each object in a backet)
Object change notification (can be sent to App Servers/Compute Engine) Cloud PubSub recommended
Strong global consistency
4 different classes (Cold/Nearline/Single Region/Multireonal)

## Cloud SQL
MySQL or PostgreSQL - fully managed
Has replica, backup, import/export services
Supports Up and Out scaling

## Cloud Spanner
Combine best of non-sql and rdbms.

* Scales to petabytes
* Strong consistency
* HA
* Monthly uptime 99.999% (multi-regional) or 99.99% (regional)

## Cloud Firestore
NoSQL fully managed document database

* Mobile, web and IoT apps at global scale
* Live syncronization and offline support
* Security features
* ACID transactions
* Multi-region replication
* Powerful query engine

Cloud Firestore is the next generation of Cloud Datastore
2 modes: Datastore and Native mode

## Cloud Bigtable
NoSQL big data database (no ACID)
* petabytes
* consistent sub-10ms latency
* seamless scalability for throughput
* learns and adjusts to access patterns
* ideal for ad tech, fintech, and IoT
* storage engine for ML applications
* easy integration with open source big data tools

## Cloud Memorystore
Fully managed Redis service
* in memory data store service
* focus on building great apps
* high availability, failover, patching and monitoring
* sub-millisecond latency
* instances u to 300Gb
* network throughput of 12 Gbps
* easy lift-and-shift

# Resource Management

## Cloud Resource Manager
Resources: Global, Regional and Zonal

## Quotas
How many resources per projects
How many resources per region
How quickly you can make API requests

## Labels and names
Labels - user defined strings key value pairs (up to 64 labels per resource)

Sample: teams, Cost Center, Componets, Environment or Stage, Owner or contact, State

Tags for labling instances - don't confuse with labels.

## Billing
Can set up alerts

Data Studio can visualize reports

Can export to BigQuery or File

# Resource Monitoring

## Stackdriver

* Integrated monitoring, loggin, diagnostics
* Supports GCP and AWS

## Monitoring
SRE - site reliability engineering
Dynamic config and intelligent defaults
Platform, system and app metrics
Health checks, alerts, dashboards

Workspace is the root entity that holds monitoring and configuration information
Contains multiple projects (one main - called hosting projects)
Uptime checks can test availability of service from different regions

Monitoring agent should be installed for detailed monitoring of instances.

## Logging
platform, systems and application logs
30-day retention
analyze log in BigQuery and visualize in Data Studio

Intall logging agent to all the instances

## Error reporting
Supports exception stack traces
Go, Java, .net, node.js, php, python ruby 

## Traicing
Tracing system
* displays near realtime
* latency reporting
* per--URL latency sampling

Collects latency data
* app engine
* googlge http(s) load balancers
* applications instrumented with the Stackdriver Trace SDKs

## Debugging

* Inspect an application without stopping it or slowing it down significantly
* Capture call stack and local variables of an running application
* Debug logpoints (inject logging into a service without stopping it)
* Java, Python, Go, Node.js and Ruby
