# DNSSEC validation in Microsoft DNS Server 2012

The DNS Server in Windows 2012 now supports all bits and pieces necessary to validate DNSSEC signatures and keys in the Internet (including SHA256 and NSEC3). Here is a small tutorial on how to import the trust anchor for the Internet root zone into the Windows 2012 DNS Server to enable DNSSEC validation:

1. ENABLE DNSSEC VALIDATION

    DNSSEC validation can be enabled in the DNS Servers global properties (Advanced - enable DNSSEC validation for remote responses)

    ![](/mdwiki/pages/kb/microsoft/dnssec/img/33691775-5882-4e38-b314-1a07462f3754.png)

2. IMPORT OR ADD THE CURRENT PUBLIC DNSKEY FOR THE ROOT ZONE

    Now we can add the public DNSSEC key (the key signing key, or KSK, flag field value 257) for the root zone as a trust anchor (trust point) into the system (This tutorial uses the root public key that was valid in June 2012). There are two way to enter the trust anchor:

    - by importing from a file
    - manually adding the key material

## IMPORTING THE TRUST ANCHOR FROM A FILE

The Windows 2012 DNS Server is picky about the format of the trust anchor file to be used. It must be in the same format as the keyset files created by the DNS server when signing a DNS zone. The format is the same as produced with the BIND 'dig' tool in the versions 9.6 and 9.7 (using the +multi switch), but the Windows 2012 DNS Server will not take the format produced by 'dig' from BIND 9.9+.

Here is the content of the trust anchor file to be imported:

```
.      172800 IN DNSKEY  257 3 8 (
       AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQ
       bSEW0O8gcCjFFVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh
       /RStIoO8g0NfnfL2MTJRkxoXbfDaUeVPQuYEhg37NZWA
       JQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaDX6RS6CXp
       oY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3
       LQpzW5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGO
       Yl7OyQdXfZ57relSQageu+ipAdTTJ25AsRTAoub8ONGc
       LmqrAmRLKBP1dfwhYB4N7knNnulqQxA+Uk1ihz0=
       ) ; key id = 19036
```

Right click on the 'Trust Points' folder in the Windows 2012 DNS management console and select 'Import - DNSKEY':

![](/mdwiki/pages/kb/microsoft/dnssec/img/07f77fb6-60b8-4653-911d-ab02b60fe4a8.png)

and select the key-file:

![](/mdwiki/pages/kb/microsoft/dnssec/img/d8380cd7-d0ed-41c9-9670-0e0482c91e9b.png)

## MANUAL ADDING THE KEY MATERIAL

Right click on the 'Trust Points' folder in the Windows 2012 DNS Server console, select 'Add - DNSKEY'.

![](/mdwiki/pages/kb/microsoft/dnssec/img/981a8ea9-b3f0-4793-8c49-dea149a78d0e.png)

Enter "." (dot) as the name for the root zone, and paste the public KSK key (base64 encoded) into the public key field. The DNS server is again very picky about the format of the key material, it must be all in one line without any spaces or line-breaks:

```
AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQbSEW0O8gcCjFFVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh/RStIoO8g0NfnfL2MTJRkxoXbfDaUeVPQuYEhg37NZWAJQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaDX6RS6CXpoY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3LQpzW5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGOYl7OyQdXfZ57relSQageu+ipAdTTJ25AsRTAoub8ONGcLmqrAmRLKBP1dfwhYB4N7knNnulqQxA+Uk1ihz0=
eca225b0-2780-4a9c-ac8a-09b1b66ee324.png
```

## THE ROOT ZONE PUBLIC KEY IN THE TRUST POINTS FOLDER

The public key of the root zone should now be listed in the 'trust points' folder:

![](/mdwiki/pages/kb/microsoft/dnssec/img/0fb63af4-9690-4404-8b4f-462697c2eeda.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/621289d7-0281-4df2-9f3f-3ee3d0c7755f.png)

At this point we want to clear the cache of the DNS Server, as the Windows 2012 DNS Server will not validate data that is already stored in its cache.

## TESTING THE DNSSEC VALIDATION

The PowerShell in Windows 2012 includes a command (resolve-dnsname) to resolve DNS names, including DNSSEC records. However, this command unfortunately does not display the state of the AD (/A/uthenticated /D/ata) Flag in the DNS response header. This AD flag will tell us if DNSSEC validation is working or not.

![](/mdwiki/pages/kb/microsoft/dnssec/img/485d3117-1e6f-4c9e-82de-b0c3b40ed26c.png)

So I downloaded the BIND for Windows distribution from ISC and did a 'tools only' installation, which installs 'dig' (among other tools) on Windows. With 'dig' we can see the AD flag on DNSSEC signed DNS domains, and therefore validate that DNSSEC validation is indeed working for the Windows 2012 DNS Server:

![](/mdwiki/pages/kb/microsoft/dnssec/img/fede173a-955e-46e0-87f7-b823b8622bbf.png)

An alternative to installing 'dig' on Windows are websites that offer DNSSEC validation testing.

## ENABLING DNSSEC USING DNSCMD

It is also possible to enable DNSSEC validation from the commandline using the command dnscmd /RetrieveRootTrustAnchors.

![](/mdwiki/pages/kb/microsoft/dnssec/img/e2796aeb-ac0d-40f5-91da-cea1c545c9b2.png)

This command will first fetch the delegation signer (DS-record) using https from [IANA](https://data.iana.org/root-anchors/root-anchors.xml). The server will then fetch the public key signing key from the root zone during an active refresh cycle (RFC 5011) and validate the KSK using the delegation signer record.

It can take a while until the KSK will appear, and DNSSEC validation can be used. In my tests with Windows 2012 Build 8400 I was not able to trigger an active refresh cycle to speed the process up (but I might have missed something).
