# MCSE Exam 70-745: Implementing a Software-Defined Datacenter

## Plan and Implement System Center Virtual Machine Manager (VMM) Core Infrastructure

### Install and Configure Virtual Machine Manager (VMM)

- Determine requirements for Installation of System Center Virtual Machine Manager;
- install VMM server, VMM Administrative Console, and VMM local agents;
- configure SQL database requirements for the VMM database;
- add Hosts;
- upgrade VMM from previous versions of VMM including performing a rolling upgrade from Windows Server 2012 R2 host clusters;
- create service accounts for VMM;
- uninstall VMM;
- reinstall from a retained database.

### Install and Configure VMM Host Servers

- Determine requirements for bare metal installation of host servers;
- perform Hyper-V host deployment to bare-metal machine;
- integrate Windows Deployment Services (WDS) with VMM to provide PXE services for bare metal deployments.

### Manage VMM Infrastructure

- Integrate Windows Server Update Services (WSUS) with VMM infrastructure;
- plan and orchestrate updates and patches on VMM servers, SQL database host agents, and management consoles;
- create Update Baselines;
- run compliance scans;
- remediate host servers and clusters; manage host groups;
- backup and restore VMM servers.

### Manage VMM Libraries

- Install and configure library servers; add library servers and library shares to VMM;
- enable Data Deduplication on library server;
- synchronize libraries;
- manage library association;
- manage object equivalence.

### Implement Highly Available VMM Infrastructure

- Determine component requirements for Highly Available VMM infrastructure;
- create a highly available VMM management server;
- create a Hyper-V Host cluster by using Failover Cluster Manager;
- determine requirements and options for SQL server high availability;
- determine single site and multi-site high availability options;
- create highly available library servers;
- implement Scale-Out File Server;
- perform Scale-Out File Server cluster deployment to a bare-metal machine;
- implement Distributed Key Management Solution;
- determine upgrade scenarios and options for a highly available VMM deployment;
- perform Cluster-Aware Updating;
- implement Rolling Cluster Upgrades;
- implement stretch clusters; manage mixed-mode clusters.

## Implement Software-Defined Networking (SDN)

### Implement Core Network Fabric

- Create logical networks;
- create logical network sites;
- create IP pool;
- configure uplink port profiles;
- configure virtual port profiles;
- configure port classifications;
- create and configure logical switches;
- configure Hyper-V extensible virtual switches;
- integrate VMM switches with Top-of-Rack (TOR) switches;
- implement max bandwidth policies;
- enable NIC teaming;
- enable Switch Embedded Teaming (SET);
- create and configure MAC pools;
- configure Domain Name System (DNS);
- configure and enable NIC offload technologies such as virtual Receive Side Scaling (vRSS) and Virtual Machine Multi-Queue (VMMQ), and configure Single-Root I/O Virtualization (SR-IOV) on capable NICs.

### Plan for and Implement SDN solution

- Plan for software-defined network infrastructure;
- define and document fabric resource endpoints such as host servers, logical networks, software load balancer (SLB) multiplexers (MUX), VLANs and service credentials;
- implement SDN using VMM Service Templates;
- configure for single tenant and multi-tenant scenarios;
- define front end Virtual IPs (VIPs) in multi-tier scenarios;
- define back end Dynamic IPs (DIPs) in multi-tier application scenarios;
- install and configure the SDN Host agent;
- configure DNS integration with SDN;
- configure DNS integration with Internal DNS Service (iDNS);
- create and configure Access Control Lists (ACL) for use in multi-tenant environments; configure virtual subnets.

### Configure Network Controller (NC)

- Determine usage scenarios and requirements for the Network Controller;
- implement Network Controller in domain and non-domain environments;
- test successful Network Controller deployment;
- query Network Controller resources and provisioning state;
- define resource objects by using scripts;
- implement multi-node Network Controller deployments;
- implement highly available Network Controller resources; set up an Internet Protocol Address Management (IPAM) server.

### Configure and Manage Software Load Balancer (SLB)

- Determine infrastructure and tenant usage scenarios and requirements for load balancer deployment;
- configure SLB host agent;
- configure Border Gateway Protocol (BGP);
- configure SLB Multiplexer (MUX) to advertise Virtual IP Address (VIP);
- configure SLB rules to map virtual IP (VIP) and ports to back end Dynamic IPs (DIP) and ports in multi-tier application scenarios;
- configure NAT for inbound and outbound traffic;
- configure North-South and East-West load balancing; scale SLB Multiplexers;
- configure health probes.

### Configure Windows Server Gateway

- Determine usage scenarios and requirements for Windows Server Gateway (WSG) deployment;
- deploy WSG using SCVMM Service Templates; implement a Layer 3 gateway;
- implement Generic Routing Encapsulation (GRE) tunnelling;
- implement multi-tenant gateways by using PowerShell;
- implement IPsec Site-to-Site (S2S) tunnel;
- create M+N redundancy gateway pools;
- scale gateway pools;
- manage gateway by using Network Controller;
- integrate gateways with SLB;
- integrate VLAN networks with SDN gateway for Azure hybrid networking;
- configure BGP routing for gateway;
- assign gateway pools for tenant usage;
- configure Windows Server Gateway as a forwarding proxy;
- implement highly available Windows Server Gateway.

### Manage SDN Infrastructure

- Install updates on network controllers, Software Load Balancer components, and gateway components;
- configure health probes;
- query configuration state health information in load balancer MUX object;
- configure NC/SLB and GW logs;
- manage SDN components for service branching and patching considerations;
- troubleshoot SDN stack by using Network Controller diagnostics.

### Manage Tenant Virtual Networks

- Use network virtual appliances on virtual networks;
- configure network Quality of Service (QoS) for tenant VM network adapter;
- connect container endpoints to a tenant virtual network.

## Implement Software-Defined Storage

### Implement Software-Defined Storage Solutions

- Implement Storage Spaces Direct in hyper-converged scenario by using VMM;
- implement Storage Spaces Direct in a disaggregated scenario by using VMM;
- implement storage tiering;
- implement iSCSI storage;
- implement Storage Spaces fault tolerance;
- implement Cluster Shared Volumes (CSVs);
- determine usage scenarios and requirements for SMB 3 storage;
- configure and enable NIC offload technologies such as SMB Direct on Remote Direct Memory Access (RDMA) and SMB Multichannel on capable NICs for use as part of storage infrastructure;
- implement SMB file storage;
- encrypt cluster volumes;
- implement Storage QoS policies for Min/Max IOPs and Max Bandwidth;
- implement aggregated and dedicated QoS policies;
- provision Thin and Thick storage solutions;
- allocate Storage Array to a Host Group;
- create a LUN for a Hyper-V Cluster from allocated storage;
- allocate File Share to a Hyper-V Cluster;
- implement storage classifications for storage pools.

### Manage Software-Defined Storage

- Implement Storage Replica solutions;
- implement Hyper-V replica solutions;
- integrate Hyper-V Replica with Azure Site Recovery (ASR) for secondary on-premises site;
- implement Offloaded Data Transfer (ODX);
- determine LUN usage;
- decommission storage from Hyper-V Host;
- optimize Storage Spaces Direct storage pools;
- implement network QoS policies to control RDMA and SMB storage connections;
- implement SAN copy to rapidly provision VMs.

## Implement Datacenter Compute Solutions with Virtual Machine Manager (VMM)

### Implement Compute solutions

- Determine requirements and usage scenarios for virtualized deployments;
- determine requirements for application deployments in virtualized infrastructure;
- create and configure virtual machine templates;
- configure hardware profiles;
- configure guest operating system profiles;
- configure application profiles; manage custom properties and placement rules;
- deploy and manage Nano server containers;
- perform operating system deployments using unattend.xml options;
- integrate sysprep with unattend.xml answer file;
- migrate existing virtual machine deployments to VMM;
- create and manage checkpoints;
- clone virtual machines;
- perform Virtual-to-Virtual (V2V) virtual machine conversions;
- implement and manage Linux virtual machines;
- deploy virtual machines from an existing VHD, template, P2V conversion, or VMM library;
- deploy containers by using VMM templates;
- manage guarded hosts.

### Implement Service Templates

- Create and configure Service Templates;
- implement availability sets within a template;
- add tiers to a Service Template;
- add network components to a Service Template;
- implement Active Directory Service Template;
- configure SharePoint Server Service Template;
- deploy Service Templates;
- update and modify Service Templates;
- import and export Service Templates;
- implement Guest Clustering.

## Secure your Software-Defined Datacenter

### Secure the Compute Environment

- Determine the requirements for Host Guardian Service, implement Host Guardian Service;
- implement shielded VMs for new VMs by using templates;
- implement shielded VMs for existing virtual machines;
- implement Guarded Fabric solutions;
- implement DHCP guard;
- configure Run as accounts and User Roles;
- implement Role Based Access Control (RBAC);
- implement Code Integrity solution;
- implement secure boot for Windows and Linux guests;
- implement Credential Guard;
- implement self-service.

### Secure the Network Environment

- Create and use port ACLs with VM networks, VM subnets and virtual NICs;
- create and use Global Settings for all VMs;
- implement Datacenter Firewall solutions using VMM;
- create ACL Rules using Datacenter Firewall;
- configure and apply Network Controller network policies;
- secure tenant networks;
- plan for integration of security appliances into tenant network infrastructure.

## Monitor and Maintain the Software-Defined Datacenter

### Install and Configure System Center Operations Manager (SCOM)

- Determine requirements and usage scenarios for implementing Operations Manager;
- perform single and distributed deployment options for Operations Manager;
- install Operations Manager Agents by using Discovery Wizard or the command line; secure user access;
- create, install, and manage sealed and unsealed Management Packs.

### Monitor and Manage Infrastructure and Virtual Machine Workloads using System Center Operations Manager (SCOM)

- Tune Monitoring using Targeting and Overrides;
- configure maintenance schedules;
- suspend monitoring temporarily;
- configure notifications;
- configure reporting;
- integrate Operations Manager and VMM;
- enable Performance and Resource Optimization (PRO) tips in VMM;
- determine requirements and usage scenarios for backing up and restoring Software-Defined Datacenter workloads and Virtual Machine Manager with tools such as Data Protection Manager (DPM) and Microsoft Azure.
