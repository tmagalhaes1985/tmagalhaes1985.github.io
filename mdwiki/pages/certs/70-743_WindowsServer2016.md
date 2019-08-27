# MCSA Exams 70-740, 741 and 742 (or 70-743): Windows Server 2016

## Install Windows Servers in Host and Compute Environments

### Install, upgrade, and migrate servers and workloads

- determine Server installation requirements;
- determine appropriate Windows Server editions per workloads;
- install Operating System;
- install roles and features;
- install and configure Server Core;
- manage Server using Windows PowerShell;
- implement Desired State Configuration (DSC) maintain environment integrity;
- perform upgrades and migrations of servers and core workloads;
- license activation models for server installation (AVMA, KMS, and Active Directory-based Activation);

### Create, manage, and maintain images for deployment

- plan for server virtualization;
- assess virtualization workloads;
- determine considerations for deploying workloads into virtualized environments;
- update images with patches, hotfixes, last cumulative updates and drivers;
- install roles and features in offline images;
- manage and maintain Server Core, Nano Server, and VHDs using PowerShell

## Implement Storage Solutions

### Implement server storage

- configure storage pools;
- implement simple, mirror, and parity storage layout options for disks or enclosures;
- expand storage pools;
- configure Tiered Storage;
- configure iSCSI target and initiator;
- configure Datacenter Bridging (DCB);
- configure Multi-Path IO (MPIO);
- determine usage scenarios for Storage Replica;
- implement Storage Replica for server-to-server, cluster-to-cluster, and stretch cluster scenarios

### Implement data deduplication

- implement and configure Deduplication;
- determine appropriate usage scenarios for Deduplication;
- monitor Deduplication;
- implement a backup and restore solution with Deduplication

## Implement Hyper-V

### Install and configure Hyper-V

- Determine hardware and compatibility requirements for installing Hyper-V;
- install Hyper-V Server;
- install management tools;
- upgrade from existing versions of Hyper-V;
- delegate virtual machine management;
- perform remote management of Hyper-V hosts;
- using Windows PowerShell Direct;
- implement nested virtualization

### Configure virtual machine (VM) settings

- Add or remove memory in a running VM;
- configure dynamic memory;
- configure Non-Uniform Memory Access (NUMA) support;
- configure smart paging;
- configure Resource Metering;
- manage Integration Services;
- create and configure Generation 1 and 2 VMs and determine appropriate usage scenarios;
- implement enhanced session mode;
- create Linux VM's;
- install and configure Linux Integration Services;
- implement Secure Boot for Windows and Linux environments;
- move and convert VMs from previous versions of Hyper-V;
- export and import VMs;
- implement Discrete Device Assignment (DDA);
- troubleshoot VM configuration versions

### Configure Hyper-V storage

- Create VHDs and VHDX files using Hyper-V Manager;
- create shared VHDX files;
- configure differencing disks;
- modify virtual hard disks;
- configure pass-through disks;
- resize a virtual hard disk;
- manage checkpoints;
- implement production checkpoints;
- implement a virtual Fibre Channel adapter;
- configure storage Quality of Service (QoS)

### Configure Hyper-V networking

- Add and remove virtual network interface cards (vNICs);
- configure Hyper-V virtual switches;
- optimize network performance;
- configure MAC addresses;
- configure network isolation;
- configure synthetic and legacy virtual network adapters;
- configure NIC teaming in VMs;
- configure virtual machine queue (VMQ);
- enable Remote Direct Memory Access (RDMA) on network adapters bound to a Hyper-V virtual switch using Switch Embedded Teaming (SET);
- configure Bandwidth Management

## Implement Windows Containers

### Deploy Windows containers

- Determine installation requirements and appropriate scenarios for Windows Containers;
- install and configure a container host in physical or virtualized environments;
- configure Docker start-up options;
- install a base container image;
- tag an image;
- remove a container;
- create containers;
- create isolated containers

### Manage Windows containers

- Manage containers by using Docker CLI;
- manage container networking;
- manage container data volumes;
- manage Resource Control;
- create new container images using Dockerfile;
- manage container images using DockerHub repository for public and private scenarios;
- manage container images using Microsoft Azure

## Implement High Availability

### Implement high availability and disaster recovery options in Hyper-V

- Implement Hyper-V Replica;
- implement Live Migration including shared nothing Live Migration;
- configure CredSSP or Kerberos authentication protocol for Live Migration;
- implement storage migration

### Implement failover clustering

- Implement Single, Multi-Domain and Workgroup clusters;
- restore single node or cluster configuration;
- configure cluster storage;
- implement Cluster-Aware Updating;
- implement Cluster Operating System Rolling Upgrade;
- configure and optimize cluster shared volumes (CSVs);
- configure clusters without network names;
- implement Scale-Out File Server (SoFS);
- determine different scenarios for the use of SoFS vs. File Server for general use;
- determine usage scenarios for implementing guest clustering;
- implement a Clustered Storage Spaces solution using Shared SAS storage enclosures;
- implement Storage Replica;
- implement Cloud Witness;
- implement VM resiliency;
- implement shared VHDX as a storage solution for guest clusters

### Implement Storage Spaces Direct

- Determine scenario requirements for implementing Storage Spaces Direct;
- enable Storage Spaces Direct using Windows PowerShell;
- implement a disaggregated Storage Spaces Direct scenario;
- implement a hyper-converged Storage Spaces Direct scenario

### Manage failover clustering

- Configure role-specific settings, including continuously available shares;
- configure VM monitoring;
- configure failover and preference settings;
- implement stretch and site-aware failover clusters;
- enable and configure node fairness

### Manage VM movement in clustered nodes

- Perform live migration;
- perform quick migration;
- perform storage migration;
- import, export, and copy VMs;
- configure VM network health protection;
- configure drain on shutdown

## Implement Domain Name System (DNS)

### Install and configure DNS servers

- Determine DNS installation requirements;
- determine supported DNS deployment scenarios on Nano Server;
- install DNS;
- configure forwarders;
- configure Root Hints;
- configure delegation; implement DNS policies;
- Configure DNS Server settings using Windows PowerShell;
- configure Domain Name System Security Extensions (DNSSEC);
- configure DNS Socket Pool;
- configure cache locking; enable Response Rate Limiting;
- configure DNS-based Authentication of Named Entities (DANE);
- configure DNS logging;
- configure delegated administration;
- configure recursion settings;
- implement DNS performance tuning;
- configure global settings

### Implement and Maintain IP Address Management (IPAM)

- Provision IPAM;
- configure server discovery;
- create and manage IP blocks and ranges;
- monitor utilization of IP address space;
- migrate existing workloads to IPAM;
- configure IPAM database storage using SQL Server;
- determine scenarios for using IPAM with VMM for physical and virtual IP address space management;
- manage DHCP server properties using IPAM;
- configure DHCP scopes and options;
- configure DHCP policies and failover;
- manage DNS server properties using IPAM;
- manage DNS zones and records;
- manage DNS and DHCP servers in multiple Active Directory forests;
- delegate administration for DNS and DHCP using role-based access control (RBAC);
- audit the changes performed on the DNS and DHCP servers;
- audit the IPAM address usage trail;
- audit DHCP lease events and user logon events

## Implement Network Connectivity and Remote Access Solutions

### Implement virtual private network (VPN) and DirectAccess solutions

- Implement remote access and site-to-site VPN solutions;
- configure different VPN protocol options;
- configure authentication options;
- configure VPN reconnect;
- create and configure connection profiles;
- determine when to use remote access VPN and site-to-site VPN and configure appropriate protocols;
- install and configure DirectAccess;
- implement server requirements;
- implement client configuration;
- troubleshoot DirectAccess

## Implement an Advanced Network Infrastructure

### Implement high performance network solutions

- Implement NIC Teaming or the Switch Embedded Teaming (SET) solution and identify when to use each;
- enable and configure Receive Side Scaling (RSS);
- enable and configure network Quality of Service (QoS) with Data Center Bridging (DCB);
- enable and configure SMB Direct on Remote Direct Memory Access (RDMA) enabled network adapters;
- configure SMB Multichannel;
- enable and configure virtual Receive Side Scaling (vRSS) on a Virtual Machine Queue (VMQ) capable network adapter;
- enable and configure Virtual Machine Multi-Queue (VMMQ);
- enable and configure Single-Root I/O Virtualization (SR-IOV) on a supported network adapter

### Determine scenarios and requirements for implementing Software Defined Networking (SDN)

- Determine deployment scenarios and network requirements for deploying SDN;
- determine requirements and scenarios for implementing Hyper-V Network Virtualization (HNV) using Network Virtualization Generic Route Encapsulation (NVGRE) encapsulation or Virtual Extensible LAN (VXLAN) encapsulation;
- determine scenarios for implementation of Software Load Balancer (SLB) for North-South and East-West load balancing;
- determine implementation scenarios for various types of Windows Server Gateways, including L3, GRE, and S2S, and their use;
- determine requirements and scenarios for Datacenter firewall policies and network security groups

## Install and Configure Active Directory Domain Services (AD DS)

### Install and configure domain controllers

- Install a new forest;
- add or remove a domain controller from a domain;
- upgrade a domain controller;
- install AD DS on a Server Core installation;
- resolve DNS SRV record registration issues;
- configure a global catalog server;
- transfer and seize operations master roles;
- install and configure a read-only domain controller (RODC);
- configure domain controller cloning

## Implement identity federation and access solutions

### Install and configure ADFS

- Upgrade and migrate previous ADFS workloads;
- implement claims-based authentication, including Relying Party Trusts;
- configure authentication policies;
- configure multi-factor authentication;
- implement and configure device registration;
- integrate ADFS with Microsoft Passport;
- configure for use with Microsoft Azure and Office 365;
- configure ADFS to enable authentication of users stored in LDAP directories

### Implement Web Application Proxy (WAP)

- Install and configure WAP;
- implement WAP in pass-through mode;
- implement WAP as AD FS proxy;
- integrate WAP with AD FS; configure AD FS requirements;
- publish web apps via WAP;
- publish Remote Desktop Gateway applications;
- configure HTTP to HTTPS redirects;
- configure internal and external Fully Qualified Domain Names (FQDNs)

## Notes

### Desired Configuration State (DSC)

1. ```WindowsFeature```: provides a mechanism to ensure that roles or features are added or removed on a target node.
2. ```Ensure```: indicates if the role or feature needs to exist (```Present``` or ```Absent```).
3. ```Service```: provides a mechanism to manage services on the target node.
4. ```State```: indicates the state that a service needs to be ensured (```Running``` or ```Stopped```).

```powershell
Configuration FileShare
{
Import-DscResource -Module xSmbShare

Node $ComputerName
{
    xSmbShare FileShare
    {
        Ensure      = "Present"
        Name        = "FileShare"
        Path        = "D:\FileShare"
        ReadAccess  = "DOMAIN\ReadAccessUsers"
        FullAccess  = "DOMAIN\FullAccessUsers"
    }
}
}
```

```powershell
Configuration WebServer {
    Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node $ComputerName {

        WindowsFeature WebServer {
            Ensure = "Present"
            Name   = "Web-Server"
        }

        File WebsiteContent {
            Ensure = "Present"
            SourcePath = "\\DOMAIN\FileShare\wwwroot\"
            DestinationPath = "c:\inetpub\wwwroot"
        }

        Service "WebsiteService"
        {
            Name = "w3svc"
            StartupType = "Automatic"
            State = "Running"
        }
    }
}
```

```powershell
Configuration PrintServer
{
    Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node $ComputerName
    {
        Service "SpoolerService"
        {
            Name = "spooler"
            StartupType = "Automatic"
            State = "Running"
        }
    }
}
```

```powershell
Configuration BrazillianTimeZone
{
    Import-DSCResource -ModuleName xTimeZone

    Node $ComputerName
    {
        xTimeZone TimeZoneExample
        {
            TimeZone = "E. South America Standard Time"
        }
    }
}
```

### Volume Activation

AVMA can to do the following:

- Activate VM's in remote locations
- Activate VM's without an internet connection
- Track VM usage and licenses from the virtualization server, without requiring any access rights on the virtualized systems

Edition                                 | AVMA key
----------------------------------------|------------------------------
Windows Server 2019 Datacenter          | H3RNG-8C32Q-Q8FRX-6TDXV-WMBMW
Windows Server 2019 Standard            | TNK62-RXVTB-4P47B-2D623-4GF74
Windows Server 2019 Essentials          | 2CTP7-NHT64-BP62M-FV6GG-HFV28
Windows Server 2016 Datacenter          | TMJ3Y-NTRTM-FJYXT-T22BY-CWG3J
Windows Server 2016 Standard            | C3RCX-M6NRP-6CXC9-TW2F2-4RHYD
Windows Server 2016 Essentials          | B4YNW-62DX9-W8V6M-82649-MHBKQ
Windows Server 2012 R2 Datacenter       | Y4TGP-NPTV9-HTC2H-7MGQ3-DV4TW
Windows Server 2012 R2 Standard         | DBGBW-NPF86-BJVTX-K3WKJ-MTB6V
Windows Server 2012 R2 Essentials       | K2XGM-NMBT3-2R6Q8-WF2FK-P36R2

### Datacenter Bridging (DCB)

To converge other workloads such as Live Migration, Cluster and Management on the same RDMA NICs, the NICs must support Data Center Bridging (DCB).

With Data Center Bridging you can apply all QoS features, including: Bandwidth Management, Classification and Tagging, and PFC in the management operating system.

### Nested Virtualization

```powershell
Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $True
Get-VMNetworkAdapter -VMName <VMName> | Set-VMNetworkAdapter -MacAddressSpoofing On
```

### Production Checkpoints

1. Stop the virtual machine with ```Stop-VM``` cmdlet before upgrading it
2. The ```Set-VM``` cmdlet configures a virtual machine
3. To upgrade the virtual machine configuration version by using Windows PowerShell, use the ```Update-VMVersion``` cmdlet
4. The ```Checkpoint-VM``` cmdlet creates a checkpoint of a virtual machine

### Workgroup Clusters

- Failover Clustering MMC is not supported (use PowerShell instead);
- To create new cluster you must have local user with administrative privileges on each node. The username and password must be the same on all nodes;
- If you receive error "Requested Registry access is not allowed" you need to change ```LocalAccountTokenFilterPolicy```:

```New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 1```

- Each cluster node must have a primary DNS suffix.
- To create new cluster in Workgroup you have to use DNS as an Administrative Access Point.
- Workgroup clusters support only Disk Witness or Cloud Witness (Azure Storage).

### Cluster Networking

Cluster network roles can be changed using ```Get-ClusterNetwork```cmdlet:

```(Get-ClusterNetwork "Cluster Network").Role = 1```

- Disabled for Cluster Communication (Role = 0)
- Enabled for Cluster Communication only (Role = 1)
- Enabled for client and cluster communication (Role = 3)

### Cluster Auto Balancing

```(Get-Cluster).AutoBalancerLevel = 1```

- ```AutoBalancerLevel = 1``` (default): Move when host is more than 80% loaded
- ```AutoBalancerLevel = 2```: Move when host is more than 70% loaded
- ```AutoBalancerLevel = 3```: Move when host is more than 5% above average

### Receive Side-Scaling (RSS)

RSS is a scalability technology that distributes the receive network traffic among multiple processors by hashing the header of the incoming packet. Without RSS, the network traffic is received on the first processor which can quickly reach full utilization limiting receive network throughput.

The ```Set-NetAdapterRss``` cmdlet sets the receive side scaling properties on a network adapter. Many properties can be configured using the parameters to optimize the performance of RSS. The selection of the processors to use for RSS is an important aspect of load balancing.

### Web Application Proxy (WAP)

```Add-WebApplicationProxyApplication -Name "WebApp" -BackendServerUrl http://WebApp/ -ExternalUrl https://WebApp.domain.com/ -ExternalPreauthentication "PassThrough" -ExternalCertificateThumbprint "<thumbprint>"```

### Host Guardian

```Install-WindowsFeature HostGuardianServiceRole –IncludeManagementTools```

### VM Migration

```Set-VMHost -UseAnyNetworkForMigration $True```

### Network Bandwith Throttle (QoS)

```Set-SmbBandwidthLimit -Category Default -BytesPerSecond 100MB```

The same can be achieved within ```New-NetQosPolicy```cmdlet:

```New-NetQosPolicy -Name "SMB Policy" -SMB -PriorityValue8021Action 3 -ThrottleRateActionBitsPerSecond 100MB```

The ```New-NetQosPolicy``` cmdlet is used create a network Quality of Service (QoS) policy that consists of two main parts:

- conditions (filters): Match conditions such as the name by which an application is run in Windows Server or a TCP port number decide to what traffic the policy is relating.
- actions. Parameters such as ```DSCPAction``` and ```ThrottleRateAction``` determine how the policy is to handle the matched traffic.

A list of well-known match conditions, or filters, in the form of parameters is provided:

- FCoE (EtherType 0x8906)
- Cluster (3343)
- LiveMigration (6600)
- iSCSI (3260)
- NFS (2049)
- SMB (445)

These filters must be used alone for filtering purpose. In other words, they cannot be mixed with other match condition parameters.

Limiting ftp.exe bandwith:

```powershell
New-NetQosPolicy -Name "FTP" -AppPathNameMatchCondition "ftp.exe" -ThrottleRateActionBitsPerSecond 10MB -PolicyStore ActiveStore
```

Limiting HTTP/HTTPS bandwith:

```powershell
New-NetQosPolicy -Name "HTTP" -IPPort 80 -IPProtocol TCP -ThrottleRateActionBitsPerSecond 10MB
New-NetQosPolicy -Name "HTTPS" -IPPort 443 -IPProtocol TCP -ThrottleRateActionBitsPerSecond 10MB
```

Limiting specific website bandwith:

```powershell
New-NetQosPolicy -Name "IIS" -URIMatchCondition "http://WebTest.Domain.com" -ThrottleRateActionBitsPerSecond 500KB
```

### Stretched Cluster Replication

```powershell
New-SRPartnership –ReplicationMode <Mode>
```

- ```Synchronous``` or "1" (default): Requires all writes to commit on the destination server and on the source server, which guarantees data integrity between computers.
- ```Asynchronous``` or "2": Writes to the source server without waiting for the destination server, which allows for replication over high latency, geographic networks. The default RP alert time is 5 minutes.

### Remove failed disk from storage pool

```powershell
Get-PhysicalDisk | ft FriendlyName
Set-PhysicalDisk –FriendlyName <DeviceName> –Usage Retired
Remove-PhysicalDisk –FriendlyName <DeviceName>
```

### Optimize VHD

The ```Optimize-VHD``` cmdlet optimizes the allocation of space in or more virtual hard disk files, except for fixed virtual hard disks.

This operation reclaims unused blocks as well as rearranges the blocks to be more efficiently packed, which reduces the size of a virtual hard disk file.

### Volume deduplication requirements

- Must not be a system or boot volume. Deduplication is not supported on operating system volumes
- Can be partitioned as a master boot record (MBR) or a GUID Partition Table (GPT), and must be formatted using the NTFS file system
- Can reside on shared storage, such as storage that uses a Fibre Channel or an SAS array, or when an iSCSI SAN and Windows Failover Clustering is fully supported.
- If you’re using Windows Server 2012, don’t deduplicate Cluster Shared Volumes (CSVs). You can access data if a deduplication-enabled volume is converted to a CSV, but you cannot continue to process files for deduplication on Windows Server 2012.
- Do not rely on the Microsoft Resilient File System (ReFS)
- Can’t be larger than 64 TB in size.
- Must be exposed to the operating system as non-removable drives. Remotely-mapped drives are not supported.

### Common VHD problems

**Problem**: One or more virtual hard disks have a physical sector size that is smaller than the physical sector size of the storage on which the virtual hard disk file is located.

**Resolution**:

- Perform a storage migration to move the virtual hard disk to a new physical system
- Use a registry setting to enable a VHD-format virtual hard disk to report a physical sector size of 4k
- Use ```Set-VHD -PhysicalSectorSizeBytes``` PowerShell cmdlet or WMI to enable a VHDX to report a specific sector size. Valid values are 512 and 4096.

### Active Directory

Get a Global Catalog in the current forest using discovery:

```powershell
Get-ADDomainController -Discover -Service "GlobalCatalog"
```

Get a list of FSMO Role holders for a single domain:

```powershell
Get-ADDomain | Select-Object Name, SchemaMaster, DomainNamingMaster, InfrastructureMaster, PDCEmulator, RIDMaster
```

Get a list of FSMO Role holders in a forest:

```powershell
Get-ADDomain | Select-Object Name, SchemaMaster, DomainNamingMaster, InfrastructureMaster, PDCEmulator, RIDMaster all
```

Get a formated list with all the Domain Controllers and who owns the particular role:

```powershell
Get-ADDomainController -Filter * | Select-Object Name, Domain, Forest, OperationMasterRoles | Where-Object {$_.OperationMasterRoles}
```

### Containers

1. The ```container``` feature needs to be enabled before working with Windows containers. To do so run the following command in an elevated PowerShell session:

    ```powershell
    Enable-WindowsOptionalFeature -Online -FeatureName containers -All
    ```

2. ```Docker``` is required in order to work with Windows containers.

    **Note**: needs the OneGet PowerShell module.

    ```powershell
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    Install-Package -Name docker -ProviderName DockerMsftProvider
    ```

3. Install Base Container Images. Windows containers are deployed from templates or images. Before a container can be deployed, a container base OS image needs to be downloaded. The following commands will download the Nano Server base image:

    ```powershell
    docker pull microsoft/nanoserver
    ```

4. Mount local folders of container host inside a container for persistent data:

```docker run -it -v C:\ContainerHostFolder:C:\ContainerData <ContainerName>```

The preferred method for configuring the Docker Engine on Windows is using a configuration file. The configuration file can be found at ```C:\ProgramData\Docker\Config\daemon.json```.

Only the desired configuration changes need to be added to the configuration file. For example, the following configures Docker Engine to accept incoming connections on port 64500 and allow people of group docker to administer containers. All other configuration options wil use default values.

```json
{
    "hosts": ["tcp://0.0.0.0:64500"],
    "group": "docker"
}
```

To ensure that containers that you run can obtain IP addresses from your DHCP Server when using container networking in transparent mode, you should enable Mac Address Spoofing on the container host VM:

```powershell
Get-VMNetworkAdapter –VMName <ContainerHostName> | Set-VMNetworkAdapter –MacAddressSpoofing On
```

### ADFS

To configure your AD FS farm to authenticate users from an LDAP directory, you can complete the following steps:

1. First, configure a connection to your LDAP directory using the ```New-AdfsLdapServerConnection``` cmdlet
2. (Optional) Next, you can perform the optional step of mapping LDAP attributes to the existing AD FS claims using the ```New-AdfsLdapAttributeToClaimMapping``` cmdlet
3. Finally, you must register the LDAP store with AD FS as a local claims provider trust using the ```Add-AdfsLocalClaimsProviderTrust``` cmdlet

```Install-WindowsFeature -Name adfs-federation -IncludeManagementTools```
```Install-AdfsFarm -CertificateThumbprint <Thumbprint> FederationServiceName adfs.Domain.com GroupServiceAccountIdentifier "DOMAIN\Domain Admins"```

### Nano Server Scenarios

- As a "compute" host for Hyper-V VM's
- As a storage host for Scale-Out File Server
- As a DNS server
- As a web server running Internet Information Services (IIS)
- As a host for cloud applications (container or VM guest)
- As a container host

1. Import Module

    ```powershell
    Import-Module .\NanoServerImageGenerator.psm1
    ```

2. Create Nano Server Image VHDX

    ```powershell
    New-NanoServerImage -MediaPath .\Files -BasePath .\Base -TargetPath .\Images\NanoVM.vhdx
    ```

Role or feature                                         |   Option
--------------------------------------------------------|------------------------------------------------------------
Hyper-V role (including NetQoS)	                        |   Microsoft-NanoServer-Compute-Package
Failover Clustering and other components                |   Microsoft-NanoServer-Clustering-Package
Set of drivers included in a Server Core installation   |   Microsoft-NanoServer-OEMDrivers-Package
File Server role and other storage components           |   Microsoft-NanoServer-Storage-Package
Windows Defender                                        |   Microsoft-NanoServer-Defender-Package
DNS Server role                                         |   Microsoft-NanoServer-DNS-Package
Desired State Configuration (DSC)                       |   Microsoft-NanoServer-DSC-Package
Internet Information Server (IIS)                       |   Microsoft-NanoServer-IIS-Package
Host support for Windows Containers                     |   Microsoft-NanoServer-Containers
System Center Virtual Machine Manager agent             |   Microsoft-NanoServer-SCVMM-Package
Data Center Bridging (including DCBQoS)                 |   Microsoft-NanoServer-DCB-Package
Deploying on a virtual machine                          |   Microsoft-NanoServer-Guest-Package
Deploying on a physical machine                         |   Microsoft-NanoServer-Host-Package
Secure startup functionalities                          |   Microsoft-NanoServer-SecureStartup-Package
Hyper-V support for Shielded VMs                        |   Microsoft-NanoServer-ShieldedVM-Package
Simple Network Management Protocol (SNMP) agent         |   Microsoft-NanoServer-SNMP-Agent-Package.cab
IPv6 transition technologies and IP-HTTPS               |   Microsoft-NanoServer-IPHelper-Service-Package.cab

### Name Resolution

Install DNS Server role:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName DNS-Server-Full-Role
```

Set DNS forwarder:

```powershell
Set-DnsServerForwarder -IPAddress "10.0.0.1" -PassThru
```

Preventing DNS from using root hints if forwarder is unavailable:

```powershell
Set-DnsServerForwarder -UseRootHint $False
```

Preventing DNS from resolving queries from DNS clients located on a specific subnet:

You have three options:

1. Create an inbound rule within Windows Firewall
2. Create a DNS Server Query Resolution Policy

    ```powershell
    Add-DnsServerClientSubnet -Name "PreventedSubnet" -IPv4Subnet 10.0.0.0/16 -PassThru
    Add-DnsServerQueryResolutionPolicy -Name "PreventedSubnet" -Action IGNORE -ClientSubnet  "EQ,PreventedSubnet" -PassThru
    ```

3. Create a Name Resolution Policy Table (NRPT). It can be configured using ```Add-DnsClientNrptRule``` and ```Remove-DnsClientNrptRule```, and other PowerShell cmdlets.

Export a DNS trust anchor to a file share:

This command exports the trust anchor (DS record) for Domain.com to a file share.

A DNS administrator must runs this command from the DNS server that hosts the zone Domain.com and specifies that the zone signing key uses the SHA-1 algorithm to create the DS record.

```powershell
Export-DnsServerDnsSecPublicKey -ComputerName "NS1.Domain.com" -ZoneName "Domain.com" -Path "\\DOMAIN\FileShare\keys" -PassThru DigestType "Sha1"
```
