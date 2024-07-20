1. Provisioning Infra
2. Deploying Application

Difference Between Ansible vs Terraform

- Both: Infra as a code. Both automate: Provisioning, configure and managinc the infrastructure

Ansible
- Mainly a configuration tool
- Configure that infra
- deploy apps
- install/update software

Terraform
- Mainly infra provisioning tool
- Can deploy apps
- Replicating Infra (Dev -> Staging -> PROD)


Terraform Architechture

How does TF work?

2 main concepts

- TF Core
- Providers (AWS/Azure (IaaS), K8s(PaaS), Fastly(SaaS))


2 input source:

TF Config File
State 

ei 2 ta core re janabe -> 
Core then plan korbe ->
Plan: What needs to be created/updated/destroyed?
So, it compares current state vs desired state



# Providers

Over 100 Providers
to over 1000 resources

Through provider, we can get access to resources

Provider: AWS
Resources: EC2, Users, S3

Provider: K8s
Resources: Namespaces, Services, Deployments


TF follows declarative approch. 

We write tf file as the final desired state


TF commands for differenct stages

- refresh -> query infra provider to get current state = state

- plan -> create an execution plan (determines what actions are necessary to achieve the desired state)

apply -> execure the plan

destroy -> destroy the resource/infra

Takeaways

1. Tool for creating and configurating infra
2. Universal IaC tool
3. use just 1 tool to integrate all those different technologies




Practice

After defining providers,
we need to init terraform to install that provider
then we can access the all resources of that provider

provider_resource_name -> in this way, tf define resources


- Resources (New resource will create)
- Data Source (Accessing existing resources)



Terraform is idempotent. (always gives the same result)