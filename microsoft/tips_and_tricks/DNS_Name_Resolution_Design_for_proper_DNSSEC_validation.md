# DNS Name Resolution Design for proper DNSSEC validation

Many networks have a DNS name resolution design that uses a hybrid DNS server. A hybrid DNS server is a DNS server that combines both functions that a DNS server can operate in into one process: the authoritative function (hosting zones) and the resolving/caching function (looking up names in DNS on behalf of DNS clients).

Both [BIND](http://isc.org/) and [Microsoft Windows DNS](http://technet.microsoft.com/en-us/network/bb629410.aspx) server can operate in a hybrid mode. Other (some would say "more modern") DNS servers such as [Unbound](http://unbound.net/) (resolving only) and [NSD](http://www.nlnetlabs.nl/projects/nsd/) (caching only) separate these functions.

While running a hybrid DNS server was fine in the world before DNSSEC, the deployment of DNSSEC requires a closer look at these "legacy" DNS designs.

Authoritative DNS servers, when queried for a name they are authoritative for, will set the AA-flag (/A/uthoritative /A/nswer) in the answer.

Resolving DNS server that perform DNSSEC validation will set the AD-flag, if the DNS data received is validating. The AA-flag and the AD-flag are mutually exclusive, there can only be either one in an DNS answer. The reason is that it would be extra work, but no added security, if an authoritative DNS server would validate its own data. After all, if the server has been compromised, it cannot trust its own data and it is not possible to detect the false data from within the authoritative DNS server. Only a DNS server external to the authoritative server can validate DNSSEC signed zone data.

For proper DNSSEC name resolution (AD flag set on all answers from DNSSEC secured zones), all queries must go through a resolving DNS Server that is separate from the DNS server hosting the zones.

## NAME RESOLUTION IN LEGACY HYBRID DNS DESIGNS

The graphic below shows DNSSEC name resolution for a DNSSEC secured name from the Internet, using a hybrid DNS server:

![](/mdwiki/pages/kb/microsoft/dnssec/img/492391a5-1765-434c-b739-97ca2e0df4e2.png)

The AD flag is seen by the client, and DNSSEC aware applications will continue to work.

The next graphic show name resolution for an internal DNS domain, which is also DNSSEC secured and hosted on the DNS server that is used for DNSSEC validation (a hybrid DNS server):

![](/mdwiki/pages/kb/microsoft/dnssec/img/889750ca-cfae-4f85-8d81-cdf76bd03f83.png)

Here, only the AA-flag is seen by the client. DNSSEC aware applications that require the AD flag will fail.

## NAME RESOLUTION IN MODERN DNS DESIGNS

In modern DNS designs, the resolving/caching DNS servers are separate from the authoritative DNS servers. As a rule of thumb, in these designs, caching/resolving DNS servers only receive DNS queries from client machines, never from other DNS servers (except for forwarding, where a DNS server acts like a client proxy). Authoritative servers only talk to caching/resolving DNS servers, never directly to DNS clients.

Resolving and validating names in the Internet works like in the hybrid design above:

![](/mdwiki/pages/kb/microsoft/dnssec/img/8b6d6906-459a-4f59-9b38-38acf0827d36.png)

AD-flag is seen by the client, everything is good and secure.

DNS queries for internal DNS domains now also will see the AD-flag:

![](/mdwiki/pages/kb/microsoft/dnssec/img/59ad649a-91c3-465f-a9b2-2d3ee44e6957.png)

DNSSEC aware applications work for all domains, internal and external.

## BENEFITS FROM A MODERN DNS DESIGN

A modern DNS name resolution design is required to be able to make use of all features DNSSEC offers. The number of DNSSEC aware applications is likely to grow in the future, so more and more applications will rely on proper DNSSEC validation.

Besides DNSSEC, there are more benefits in a modern DNS name resolution design: the possibility to apply different security policy and settings to the caching and authoritative servers, better troubleshooting options, simpler maintenance and upgrade-ability of DNS server components among them.

Separating the resolving/caching and the authoritative functions of DNS servers does not necessarily require more hardware or more physical DNS servers. Virtualization can be used to create separate instances of DNS servers on the same machine. Either full machine virtualization (HyperV, VMWare, VirtualBox, XEN or KVM), system virtualization (Solaris zones or Linux Container/LXC) or even process virtualization (BIND 9 views) can be used.
