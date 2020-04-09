# Overview

**Regions** - geographical locaion (a set of zone). Regional resources are available within a region for all zones.

**Zones** - isolated locaions within a region. Zone resources are available for the zone only.
Billing for minutes in GCP, discounts for sustained usages (>25%), custom machines.
Pricing for compute per minute not per hour.

GCP is committed to eco friendly environment, robust infrastructure.

## What is a project
Collection of:
* billing
* track resources and quota usages
* manage permissions and credentials
* enable services and APIs

## Roles
* Owner
* Editor
* Viewer
* Billing admin
	
## Identity and Access Management (IAM)
Role is a set of permissions.
Service accounts to identify machines (they're assigned to machines) - like email <project_id>/<project_number>@developer.gs...com

IAM resource hierarchy.

## Interacting with GCP
* Web Google Cloud Platform Console
* cloud SDK/Shell (gcloud, gsutil, bq)
* REST-based API

APIs explorer - graph tool
Google Cloud Client Libraries
Google APIs Client Libraries

## App Engine (PaaS)
### App Engine Standard Environment
* managed runtimes for specific versions of Java, Python, PHP&Go
* autoscale workloads to meet demands
* Free daily quota, usage based
* SDKs for development/testing and deployment
* Need to conform to sandbox constaints
** no writing to local file system
** request timeout 60 secs
** limit on 3rd party software installations
		
### App Engine Flexible Environment
* docker based contanerized apps with a click
* Standard runtimes - Python, Java, Go, Node.js - no sandbox constaints
* Custom runtime - any language that supports http requests
** local development relies on Docker
** standard runtimes can access App Engine Services: Datastore, Memcache, task queues, logging, users and so on

|  | Standard | Flexible |
| - | - | - |
| start instance | ms | minutes |
| ssh | no | yes |
| local writes | no | yes (ephemeral) |
| support 3rd party binaries | no | yes |
| network | Via App Engine services | direct |
| customizable stack | no | yes |

### Google Cloud Endpoints
* Build own API running on App Engine Standard
* Expose your API using a RESTful interface
* Includes support for OAuth 2.0 authorization
* Generate client libraries
* Written on Java or Python
* Includes App Engine features (scaling, Denial of Sevice protection, High availability)
* Supports iOS/Android/JavaScript clients
	
### Google Cloud Datastore
* Designed for application backends
* NoSQL store for billions of rows
* Schemaless access
* Local development tools
* Automatic scaling and fully managed
* Built-in redundancy
* Supports ACID transactions
* Includes free daily quota
* Access from anywhere through a RESTful interface

### Lab source code
	gcloud source repos clone default
	
	git pull https://github.com/GoogleCloudPlatformTraining/cp100-bookshelf
	
	git push origin master
	
	pip install -r requirements.txt -t lib
	
	cat appengine_config.py
	
	gcloud app deploy

### Cloud Datastore
* Kind - something like table in RDBMS
* Entity - something like row in RDBMS

# Storage Options

## Google Cloud Storage
* High performance immutable BLOB (durability 11 9s)
* Not a file system
* No administration, not capacity planning
* Data encription on the fly
* All strorage classes accessible through the same APIs

### Classes
* Standard (high availability, durability, perfrmance, low latency)
** Regional 99.9% availability
** Multiregional 99.95% availability
* Durable Reduced Availability (lower availability SLA and reduced cost)
* Nearline/Cold-line (low-cost, for archiving, backup, disaster recovery) Price for access.

### GCS Features:
* Regional buckets
* Object versioning
* Offline imports (third party)
* ACLs
* Object lifecycle management
* Online cloud imports (like moving old data to cold storage)
* Object change notifications

### GCS Integration:
* Import/export tables (BigQuery)
* Startup scripts, images, general object storage (Compute Engine)
* Object storage, logs, datastore backups (App Engine)
* Import/export tables (Cloud SQL)
		
## Google Cloud Bigtable
* NoSQL, wide column datastore for large-workload applications - terabytes - petabytes
* Accessed using HBase API, Native compatibility with bigdata Hadoop ecosystem
* Protected (replicated, dataencryption in-flight, role-based ACLs)
* Proven (drives Google Analytics and Gmail)
* Access:
  * Application API
  * Streaming
  * Batch Processing
* Integration: 
  * Google Cloud Dataflow
  * Google Cloud Dataproc
  * On premises Cloud Based Hadoop

## Google Cloud SQL
* Google Managed MySQL RDBMS
* Pay per use
* REST API for management
* Affordability and performance
* Encrypted - Google Security
* Vertical scaling (Read and Write)
* Horizontal scaling (Read)
* Seamless integration with App Engine and Compute Engine

### Features
* Familiar
* Flexible pricing
* Google Security
* Managed backups
* Automatic replication

### Integration
* App Engine
* Compute Engine

## Comparing Storage Options
* BLOB
  * Cloud Storage
    * Good for: Sructured and not structured binary or object data
    * Use cases: Images, Large media files, backups
	* Object (BLOB) store
	* Petabatypes +
	* 5 TB per object
	* No transactions
	* No complex queries
* NOSQL 
  * Cloud Datastore
    * Good for: Getting started, App Engine applications 
    * Use cases: User profiles, Product catalog
	* NoSQL, document
	* Terabytes +
	* Size 1 Mb per entity
	* Transactional
	* Complex queries
  * Cloud Bigtable
    * Good for: Flat data, Heavy read/write, events, analytical data
    * Use cases: AdTech, Financial and IoT data
	* NoSQL, wide column
	* Petabatypes +
	* Individual values ~10MB per cell, all values per row ~100Mb
	* No transactions
	* No complex queries
* SQL
  * Cloud SQL
    * Good for: Web Frameworks, existing applications
    * Use cases: User credentials, customer orders
	* Relational
	* up to 500Gb
	* Standard MySQL limits
	* Transactional
	* Complex queries

## Lab
	gsutil mb -l <location> gs://$DEVSHELL_PROJECT_ID
	gsutil defacl ch -u AllUsers:R gs://$DEVSHELL_PROJECT_ID
	
	cd ~/cp100/default/cloud-storage
	sed -i s/your-bucket-name/$DEVSHELL_PROJECT_ID/ config.py
	
	pip install -r requirements.txt -t lib
	
	gcloud app deploy

# Google container engine
## Container
* Virtualization at the operating system level
* Separates OS from application code and dependencies
* Isolated individual processes
* Popular implementations: Docker, rkt

Docker supported by both Google Cloud App Engine Flexible Environment and Google container engine
	
## Why use containers
* Consistency across development, testing and production environments
* Loose coupling between OS and Application
* Much simpler to migrate workloads between on-premises and cloud environments
* Supports agile development and operations

## Kubernetes(k8s)
* Open source container cluster orchestration system (automates, deployment, scaling, operations for container cluster)
* Based on Google's experience over 10+ years
* Built for a multi-cloud world (public, private, hybrid)

### Features of Kubernetes
* Workload portability (across cloud providers, implementation is open and modular)
* Rolling updates (upgrade application with zero downtime)
* Autoscaling (automatically dapt to changes in workload
* Persistence storage (abstract details of how storage is provided from it is consumed)
* Muli-zone clusters (run a single cluster in multiple zones, on Google Cloud Platform)
* Load balancing (external IP address routes traffic to correct port)

## Google container engine
* Fully managed clister management and orchestration system for running containers (based on Kubernetes, Uses Compute Engine instances and resources)
* Complementary services:
  * Google Cloud Container Builder (create docker container images from app code in Google Cloud Storage) BETA
  * Google Container Registry (Secure, private docker image storage)
* Uses a clarative syntax to manage applications (declare desired application configuration, Container Engine implementsm, manages)
* Decouples operational, development concerns
* Manages and mantains (logging, health management, monitoring)
* Easily update Kubernetes versions as they are released

Treeptik - company which uses Google Cloud for Java application

| | Compute Engine | Container Engine | App Engine Standard | App Engine Flexible
|-|-|-|-|
| Language | Any | Any | Java&Python&Go&PHP | Any |
| Service model | IaaS | Hybrid | PasS | PaaS |
| Primary use case | General computing workloads | Container-based workloads | Web and mobile applications | Web and mobile applications, container-based workloads |

## Lab
	gcloud compute zones list
	gcloud config set compute/zone us-east1-c
	gcloud config list
	gcloud container clusters create bookshelf \
		--scopes "https://www.googleapis.com/auth/userinfo.email","cloud-platform" \
		--num-nodes 2
	
	cd ~/cp100/default/container-engine
	sed -i s/your-project-id/$DEVSHELL_PROJECT_ID/ config.py
	sed -i s/your-project-id/$DEVSHELL_PROJECT_ID/ bookshelf-frontend.yaml
	gcloud config set container/cluster bookshelf
	
	docker build -t gcr.io/$DEVSHELL_PROJECT_ID/bookshelf .
	gcloud docker -- push gcr.io/$DEVSHELL_PROJECT_ID/bookshelf
	gcloud container clusters get-credentials bookshelf
	kubectl create -f bookshelf-frontend.yaml
	kubectl get pods
	kubectl get services bookshelf-frontend

## Notes
* Nodes: A node is a worker machine in a Kubernetes cluster, and in Google Kubernetes Engine, the machine is always a Compute Engine instance.
* Pods: A pod is a group of one or more containers, shared storage, and configuration data relating to those containers. It is common for production applications running in Kubernetes to include multiple, relatively tightly-coupled containers in a single pod.
* Replication Controllers: A replication controller works to ensure that the requested number of pod replicas are always available and running at a given time. The replication controller automatically adds or removes pods as required to maintain a desired state.
* Services: A service defines a logical set of pods and a way to access them using an IP address and port number pair.

# Google Compute Engine and Networking

## Compute Engine
* Run large-scale workloads on virtual machines hosted on Google's infrastructure (use google's or upload your own images of VMs)
* Robust networking features
  * Default, custom networks
  * Firewall rules
  * Regional HTTP(s) load balancing
  * Network load balancing
  * Subnetworks
* High CPU, memory, standard and share core machine types
* Persistent disks (Standard, SSD, local SSD | Snapshots)
* Resize disks, migrate instances with no downtime
* Instance metadata and startup scripts
* Advanced APIs for auto-scaling and instance group management
* Innovative pricing 
  * Per-minute billing (sustaubed use discounts)
  * Preemptible instances - much lower price than normal instances. However, Compute Engine might terminate (preempt) these instances if it requires access to those resources for other tasks.
  * High throughput to storage at no extra cost
  * Custom machine types - Only pay for the hardware you need

## Networking Overview

### Google Cloud  Interconnect
* Carrier Interconnect (Enterprise-grade connections provided by carrier service providers)
* Direct Peering (Connect your business directly to Google)
* CDN Interconnect (Allows select CDN providers to establish direct interconnect links with Google's endge network at various locations)
	
### Google Cloud VPN
* Securely connect your network to Google Cloud Platform using IPsec VPN connection
* Google Cloud Router supports dynamic routing between Google Cloud Platform and your network
	
### Google Cloud DNS
* Higly available and scalable DNS
* Create managed zones, then add, edit, delete DNS records (Programmatically manages zones and records using RESTful API or CLI)
		
### Google Cloud Load Balancing
* HTTP(s) load balancing (can on/off compute engine machines)
  * Balance HTTP-based traffic across multiple Compute Engine regions (looks at user's region)
  * Global, external IP address routes traffic
  * Scalable, requires no pre-warming and provides resilience, fault tolerance
* TCP/SSL and UDP (network) load balancing
  * Spread TCP/SSL and UDP traffic over pool of instances withing a Compute Engine region
  * Ensures only healthy instances handle traffic
  * Scalable, requires no pre-warming
	
### Google Cloud CDN
* Use Google's globally distributed edge caches to cache HTTP(s) load balanced content far closer to your users than your instances
* Cloud CDN uses caches at network locaions to store responses generated by instances

## GCP Operations and Tools

### Google Stackdriver
* Integrated monitoring, logging, diagnostics
* Works across GCP and AWS
* Open source agents, integration
* Powerful data, analytics tools
* Collaborations with PagerDuty, BMC, Splunk, others
* Monitoring / Logging / Trace / Error Reporting / Debugger
	
### Google Cloud Deployment Manager
* Infrastructure management service
* Create a .yaml template describing your environment and use Deployment Manager to create resources
* Provides repeatable deployments
	
### Google Cloud Source Repositories (beta)
* Fully-featured Git repositories hosted on GCP
* Supports collaborative development of cloud apps
* Includes Source code editor, Integration with Stackdriver debugger
		
### Google Cloud Functions (alpha)
* Create single-purpose functions that respond to events without a server or runtime (event examples: New instance created, file added to Cloud Storage)
* Written in Javascript, execute in managed Node.js environment on GCP
* Should create trigger for events
		
## Lab
	cd ~/cp100/default/compute-engine
	gcloud compute zones list
	gcloud config set compute/zone us-east1-c
	gcloud compute instances create bookshelf \
		--image-family=debian-8 \
		--image-project=debian-cloud \
		--machine-type=g1-small \
		--scopes userinfo-email,cloud-platform \
		--metadata-from-file startup-script=startup-scripts/startup-script.sh \
		--tags http-server
	
	gcloud compute firewall-rules create default-allow-http-8080 \
		--allow tcp:8080 \
		--source-ranges 0.0.0.0/0 \
		--target-tags http-server \
		--description "Allow port 8080 access to http-server"
	
	gcloud compute instances get-serial-port-output bookshelf
		
# Google Cloud Big Data Platform

All services fully managed - No Ops.

## BigQuery
* Fully-managed analytics data warehouse (near real time interactive analysis of massive dataset - hundreds of TB)
* Query usin a SQL-like syntax
* Zero administration for performance and scale
* Runs on Google's fully managed, secure, hig-performance infrastructure (only pay for storage and processing used)
* Automatic discounts for long term data storage
	
## Cloud Pub/Sub
* Scalable, reliable messaging for GCP and beyond
* Supports many-to-many asynchronous messaging
* Includes support for offline consumers
* Based on proven Google technologies
* Integrates with Cloud Dataflow for data processing pipelines
* Uses push/pull subscriptions to topics
* Use cases:
  * Building block for data ingestion Dataflow, IoT, Marketing Analytics
  * Foundation for Dataflow streaming
  * Push notifications for cloud based applications
  * Connect applications across GCP (push/pull between Compute Engine and App Engine)
			
## Cloud Dataflow
* Managed service for executing scalable and reliable data pipelines (Java & Python)
* Write code once and get batch and streaming (transform-based programming model)
* Clusters are sized for you
* Process data using Compute Engine instances
* Integrates with GCP services like Cloud Storage, Cloud Pub/Sub, BigQuery, Bigtable
* Open source Java and Python SDKs
* Use cases
  * ETL
  * Data analysis
  * Orchestration - create pipelines that coordinate services, including external services
	
## Cloud Dataproc
* Fast, easy, managed way to run Hadoop and Spark/Hive/Pig on GCP
* Benefit from cloud integration (Cloud Storage, Stackdriver)
* Customize and configure clusters using initialization actions
* Create clusters in 90 sec or less
  * Dataproc clusters billed minute-by-minute (save using preemptible instances)
  * Scale clusters up and down even when jobs are running
  * Developer tools (RESTful API, integration with Cloud SDK)
  * Use cases:
    * Easily migrate on-premises Hadoop jobs to the cloud
    * Quickly analyze data (like log data) stored in Cloud Storage - create a cluster in less than 2 minutes then delete immediately
    * Use Spark/Spark SQL to quickly perform data mining and nanalysis
    * Use Spark Machine Learning Libraries (MLlib) to run classification algorithms
		
## Cloud Datalab (beta)
* Interactive tool for large-scale data, exploration, transformation, analysis, visualization
  * Analyze data in BigQuery, Compute Engine, Cloud Storage using Python, SQL, JavaScript
  * Easily deploy transformation, analysis models to BigQuery
* Integrated, Open source (Runs on App Engine, Built on Jupyter, Use Google Charts or matplotlib for easy visualizations
* Code, documentation, results, visualizations in intuitive notebook format
		
## Machine Learning Platform
		
* TensorFlow
* Cloud ML
* Pretrained services
		
### Vision API
* Analyze images with a simple REST Api (face detection, logo detection, label detection...)
* you can gain insight from images, detect inapproprate content, analyze sentiment, extract text
	
### Speech Api (alpha)
* Recognize over 80 languages and variants
* Can return text in real-time
* Highly accurate even in noisy environments
* Access from any device
* Powered by Google's machine learning
		
### Translate API
* Translate arbitary strings between thousands of language pairs
* Programmatically detect a document's language
* Support for dozens of languages
* Supports the standard Google API Client Libraries (Python&Java&Ruby&Objective-C...)
* Works in browser
		
## Lab
	SELECT
	  name,
	  COUNT
	FROM
	  cp100.namedata
	WHERE
	  gender = 'F'
	ORDER BY
	  COUNT DESC
	LIMIT
	  5
  
	bq query \
	"SELECT name,count FROM cp100.namedata WHERE gender = 'M' ORDER BY count ASC LIMIT 5"
	
	bg shell
	
	SELECT name,count FROM cp100.namedata WHERE gender = 'M' ORDER BY count DESC LIMIT 5
