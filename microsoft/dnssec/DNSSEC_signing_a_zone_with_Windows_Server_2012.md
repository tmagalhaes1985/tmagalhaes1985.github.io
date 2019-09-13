# DNSSEC signing a zone with Windows Server 2012

Windows 2012 Server was released on 4th of September 2012. Time to have a closer look at the DNSSEC signing capabilities (information about DNSSEC validation on Windows 2012 can be found in the article "DNSSEC validation in Microsoft DNS Server 2012").

For the DNSSEC zone signing walk-through a newly installed Windows 2012 "Standard" Server was used. Only the DNS role was installed in addition to the default components, no Active Directory. This article will cover the creation of a static DNS zone for the Internet. I do not cover the creation of an internal dynamic zones that is updated from clients or DHCP Server.

## CREATING THE ZONE

From the "DNS Manager", a new static zone is created.

![](/mdwiki/pages/kb/microsoft/dnssec/img/1df60a68-bf47-4ce4-af01-c1ff6bb8a72f.png)

Zone-Type is set to "Primary Zone" to create a primary master zone. The name of the zone is "windnssec.signed04.dnslab.org". The parent zone (signed04.dnslab.org) is hosted on a BIND 9.9.1-P2 server, and has a working DNSSEC chain-of-trust to the trust-anchor of the root-zone. An independent DNSSEC validating resolver (BIND 9 with configured root trust anchor) is used to validate the new zone.

![](/mdwiki/pages/kb/microsoft/dnssec/img/7518b223-f5a0-42c3-868e-25748dca26ed.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/b77cb264-7532-4478-8cce-4f60e8c223f5.png)

The zone-file for this static zone will be in the default location "C:\Windows\System32\dns" and the name will be "windnssec.signed04.dnslab.org.dns".

![](/mdwiki/pages/kb/microsoft/dnssec/img/b5e25482-18af-4e47-83e1-cadb54f70db8.png)

Dynamic DNS updates are disabled, because this is for a static zone.

![](/mdwiki/pages/kb/microsoft/dnssec/img/f9774795-c811-44cb-b4c0-c3a9e160235b.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/74ec07e8-0fc1-4125-b129-172f41aa12df.png)

The zone is now complete, and works as a normal, non-DNSSEC secured zone.

## SIGNING THE ZONE

From the context menue on the zone name (right-click), I select "DNSSEC -> Sign the zone" to launch the DNSSEC zone signing wizard.

![](/mdwiki/pages/kb/microsoft/dnssec/img/81b178c3-3079-4966-aa0e-43afbba02d40.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/df0860fa-9ef7-48fe-9e20-44cbb23b39dc.png)

For this zone, we select to "Customize the zone signing parameters", not really because we want to make changes to the default, but to see all the default parameters and options that we can adjust in the wizard.

![](/mdwiki/pages/kb/microsoft/dnssec/img/4911bd62-1f54-4d7b-83a5-4cf0de358421.png)

First are the KSK (Key Signing Keys). I keep the default values, except that I change the key size to a maximum of 4096 bits (default is 2048 bits). The default algorithm used is RSASHA256. The DNSKEY signatures are valid for 168 hours (7 days), the key rollover frequency is 755 days (2 years + 25 days). We could add more than one KSK to the zone, however, creating one KSK is usually enough, as the Windows 2012 DNS server will create an extra "emergency rollover" KSK automatically.

![](/mdwiki/pages/kb/microsoft/dnssec/img/926fad42-73df-4dc2-a33c-c67478137c63.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/c8a19d18-ec8d-4df0-a495-86caa30d49a8.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/50aa6560-279c-4b81-83a5-9205f0f18db0.png)

Next are the ZSK (Zone Signing Keys). I left the default values here. The rollover frequency is 90 day (3 month).

![](/mdwiki/pages/kb/microsoft/dnssec/img/c159b3d9-aaaf-4ea5-94f6-13ac02176171.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/7c071310-c57f-4146-9a60-b7b68d341515.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/d1d529d5-f9fb-4462-87c9-c6074c71c14a.png)

I use NSEC3 to the authenticated denial of existence, which is the default for Windows 2012.

The number of iterations is "50" (default), the salt is random, and the default size for the salt is 8 byte (or 256bit, the result is a 16 hex char salt). No "opt-out", as this zone will not have insecure delegations.

![](/mdwiki/pages/kb/microsoft/dnssec/img/5facbee6-4791-4aae-ac4c-a5daf2905e01.png)

I enable the automatic update of trust anchors according to RFC 5011.

![](/mdwiki/pages/kb/microsoft/dnssec/img/00b682f7-7d1a-4803-b443-3290f0697f6e.png)

The delegation-signer (DS) records should be generated using both SHA-1 and SHA-256. Available hash algorithms for the DS record are SHA-1, SHA-256 and SHA-384.

![](/mdwiki/pages/kb/microsoft/dnssec/img/be778b2e-d887-4938-b2d7-5208a12d9fec.png)

Having completed all the DNSSEC signing parameters, the Windows 2012 DNS Server now starts creating the key material and signs the zone. This takes a few seconds.

![](/mdwiki/pages/kb/microsoft/dnssec/img/10d17e66-a7b5-442c-b7d2-3bf8292d4015.png)

## INSPECTING THE SIGNED ZONE

Once the zone is signed, the signed zone, as well as the ds-set and key-set files appear in the ```C:\Windows\System32\dns\``` folder.

![](/mdwiki/pages/kb/microsoft/dnssec/img/9873ea25-803a-42bf-9395-b1182f660f4b.png)

I've created an extra "www" A-record in the zone. This new record got automatically signed on creation.

Once the DS-records and the delegation NS-records are added to the parent zone, the new zone hosted on the Windows 2012 DNS Server does validate:

```bash
# dig  www.windnssec.signed04.dnslab.org a +dnssec +multi

; <<>> DiG 9.9.1-P2 <<>> www.windnssec.signed04.dnslab.org a +dnssec +multi
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 30532
;; flags: qr rd ra ad; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags: do; udp: 4096
;; QUESTION SECTION:
;www.windnssec.signed04.dnslab.org. IN A

;; ANSWER SECTION:
www.windnssec.signed04.dnslab.org. 3600 IN A 192.0.2.10
www.windnssec.signed04.dnslab.org. 3600 IN RRSIG A 8 5 3600 (
                                20120921134910 20120911124910 20011 windnssec.signed04.dnslab.org.
                                u24KXaMM+a4ysMlhNvAUVuiuXNrUVyHs6XvAAXOhQmAS
                                Jt6cbPhM09QkwRV2OWstVukqqVHugOOU70GmzGSpfsAi
                                3iOcQ4GLK7S6bH09lSuutfH1Ezxt2CPEW3pqeyaBbZLZ
                                kP53NQ7o/nMuZQmEBv/NqRvBvPuHhpjsx4RV+tc= )

;; Query time: 867 msec
;; SERVER: 192.168.53.251#53(192.168.53.251)
;; WHEN: Tue Sep 11 14:08:00 2012
;; MSG SIZE  rcvd: 267
```

Below is the full zone, as created by the Windows 2012 DNS Server:

```bash
;
;  Database file windnssec.signed04.dnslab.org.dns for windnssec.signed04.dnslab.org zone.
;      Zone version:  5
;

@                       IN  SOA win2012ga.home.strotmann.de. hostmaster.home.strotmann.de. (
                                5            ; serial number
                                900          ; refresh
                                600          ; retry
                                86400        ; expire
                                3600       ) ; default TTL

;
;  Zone NS records
;

@                       NS  win2012ga.home.strotmann.de.

;
;  Zone records
;

@                       RRSIG   NS 8 4 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                MtnYnQCIMDLbCcbnbrDFDLjHKRIq4cCh5VWd
                                sqQoDDf8tcYnQB3MlmkpI9S2M2xX/ztR434x
                                1W1K7FTeu+rcBIE0EpMNHyCzVNjQdQA+AudL
                                7Rk+xS8M+RvmMRoI1gv5ghkocMHfHDHHIu3W
                                XgZGxPRSpF8B1nuesvvuFqX+l1k=
                                )
@                       RRSIG   SOA 8 4 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                NU14HQT1Ne6+eL0CIcSxEADuRvuhfahlD6lb
                                n6kmXaMo0HNXuDpTKL78VN+XjAoPMt0DkC5A
                                t6ZDwq/iXL/Cz0HHnqVZMBWk5TM7Vtc+WIWt
                                ofS4cdAUdaSpVvLlNObANxYYZmeKL3qTblni
                                00tL3J4IZRTrPmeFiMrVd/djdvo=
                                )
@                       RRSIG   DNSKEY 8 4 3600 20120918134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                mTI3j5FYloUSk+tpVI6vJqoqra0YWLJ4O0ha
                                zlBW3mgBSr9P5bAPp2buKtwZBIv6+2peHGyW
                                DBFS0QjLIaHmQuDS5LL14M2ebUWYrbqCo4It
                                NAQB/ArX+JdujYtUKqcagsjM0NRq+RW59dq1
                                Rys3AHZzqSaDA4AmXFMBybg6awc=
                                )
@                       RRSIG   DNSKEY 8 4 3600 20120918134910 (
                                20120911124910 8257 windnssec.signed04.dnslab.org.
                                Vd1Z6Xjy01g6Ym4Qx/VD5RGbIoUGHQ9mC0Rh
                                DdktnyHklNKWVXJ+zHP/NnsEwvYzCnr1NetC
                                6Sfu8y+VtRf9t+tXBMJWXNHNjti4HNzNEKvx
                                gPwBJXkfm/27xHBgtG80RduTcVTa5iK5bS0Q
                                C9FXQQHJVTgLt+d7Pky5QjkPl3bVhoefWBDw
                                Y4TPGALC1MnR7sjheqnCuZW//cb4k1RldmNY
                                4vWUKEJDn4kBnQjfD15N9rM202W0AyyV71IA
                                6Rv4GsgHHeDDHgfyAycYku/7QP3CqG7fDlZO
                                V+MWsgUfHoiAlJwGCXvzKvqhNTQY3rPmx89o
                                SyKRHdXvldCWkkfNzXCFTBvkO/pcioXcNBmX
                                xqn4SBuZengdbJ4lHdveXnlOrr1ZG32+zm3K
                                ppbD5LBy4DQnKHpD4AthnW2vq3P22uHBdotA
                                zIrRvp6hJZP0QHysHwyJ4PF/4E3pO3OgeXcQ
                                jU7Q4dgtF2vU3owYgk2BwRyH92abqzTeKjuc
                                PMtADjVtiugrhmRQJ9Ex5tAt8o/0ssa7oAeG
                                LNUiRoVlXN+OXUeJkL8V9EezOngmqlrUQVV7
                                Q5v4l/E+Tbe4l9UneDIsUQ6Kht+MlDeLfwAq
                                YRRBYW/cE+MWZngFFLK4XWVmcQ+X3hYlVUjO
                                Oj748CSEiJ9SKp8iwwSDqhRa3TsjwPSKXpA=
                                )
@                       RRSIG   NSEC3PARAM 8 4 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                pMXl43pA/GVXvx85lE9umxnSHmYRjDV2dvii
                                S2H/A2BXikvkG5S2Ou1i/+1ky1vkavabUaoQ
                                PqVbBhNhotqrtwdU2LWhIepCUCAEeFpRgu21
                                sD/bgMw6367GFIQhqDO2CvCkVH/yTFOe63Ez
                                9G/BNzKocO0LiqlLo0fV6+ipLIE=
                                )
@                       DNSKEY  256 3 8 (
                                AwEAAcMfL/1WuSs6zzEQbqTjOTC9DsDlR2tX
                                rNPEA3cJFTxUpyU7K/5ykr4Y+hjJ2Z7JHVwD
                                5edp50SKAywNgFyIAcKH8wHhF07Xfl77RYFg
                                oEE1x33Q0BatRSk46pw1ZJOAsk10V6gxaf/1
                                51gNvjdjX1S7MmGK/8i5TpHLoAc59iHv
                                ) ; key tag = 20011
@                       DNSKEY  256 3 8 (
                                AwEAAbF31wsrhR4EKPkQs1V5zgXqoYz/z2sI
                                wLCKx1CXmT3xtFhh0xMd+Y+xIn82n8AdY9K/
                                M0v116WLExzvYSdl/aTuIjiQ5rYB/JLIaLCL
                                HLYBaShWPsEzpFhawTvI3NuyTB5dolednL5T
                                fEjs2QZgwly/SF7Na9lIf7x5GJojhXzj
                                ) ; key tag = 55764
@                       DNSKEY  257 3 8 (
                                AwEAAa8e3bf1svqyWOZDVU8bJ2QYtIBmF8r6
                                YQq72phpyVgDGpcyrtITXC0dwpa5XQi+CPTh
                                5vO89W//8cSIacUiLtaIhb0ipTHobUmDwAnw
                                8mFANY6milnaAkG6Gz5oBxzolybWo4HDcEFM
                                QZLpynP7ZfJHeVB0VU5Qzbja069OHY4w8CfZ
                                zA5OLJt1tHEj+xnGzfazPS5nUDKOoT17Bizc
                                l1gTQFb7TnwJFgwuOuy7OxiGAvaRqIdfPm5C
                                7i8Dxko11K/0isaTjhvHsdgh0EgTgCGWcRbn
                                s/gXw3U5956hkSxtT2g4Yskii1OEwwy7ODnJ
                                dHJM9cDm5IvLS+8ZA5hCl8+E33vOyld+qBEo
                                P8ySzzQF2kGGs77iVSv4ZpgDwOrYqS8Yr2/6
                                A5z4jHzLIWBkUq9pXgBh44hAPIWgsJ8MAWTP
                                FhQHBRnBg3VA/K91fQjSV27ZQpcEv6105eXQ
                                dJEfRGKkC+8cr+oHtfMdY/kHYQ8nnId5AFou
                                oTS+2s7h8sYdNPB4eoDWFA1Vl7VBRQVwlRmg
                                uj+7Y8y2Kjh/SDBImBo/afEiLa+1ffdG6Ag3
                                g8e/FTfw+uK1cXRD237ldEKY+ay8N8BXre15
                                QrSiA39M8pWTIwtKq1Ant+b6F/8BCiQF/FhZ
                                zvRnTetjQK6pan9JPVb4k089PjwP7j+ik22Z
                                KmRn
                                ) ; key tag = 8257
@                       DNSKEY  257 3 8 (
                                AwEAAb/rrPNxWAAeHjWRX0Pl10Po3ZQ7FWO+
                                +rVagU+iThBqRHXWkE56hFVkG4NH6OufH7+c
                                KZbDvv35D7QgwkEGaGFkLTeJxgWioeKB9ezT
                                MRMfYmP1UoMIzBE/vuhaegKEMpvleHvupYTD
                                uLURYYC316GlqxZh+6GW1Vlai9rYHhPiKnaN
                                96/3IWa0mmr1Lhj4jU645AOGBgWwsNR8/hrM
                                LIoTcBTakC+zXG/Fzt8sAMe6EH3Cp2IKOrd7
                                Hw8bHxxP3jzY+5kKKo23u7aL4ljAeeNhC3a9
                                x2vhiah2NkVWdZrM9HueLAeRy8i++JRIfTFe
                                vcmRQoVXfAOPFirkHpsuvMUlBYgdSfcMowln
                                tNr7C2MUCehDBzxmZg/tfQLV2BLKj8qIU35F
                                e8siumA/Jvv0qXSOfqnhKUwkPL1UsTRovV/G
                                Yh6HkF7COKxG3rLHK3elJAysN2efKtSyXBaw
                                lkm19WAre22srihqQGFOH9dg8nT/iptWnhl4
                                lXppXXutmkdK0jdq4Sbmd321Bxpyk2wPdsjF
                                OJYjTjf38iqC0GXopYoDXGa4qoJch3yDGGM4
                                NtpR+hY90sT0xbWeok1vyfNBI9vXUp0x8coh
                                yR6DpVszYvrct9To15ofdA5s1gr81PYUuIOl
                                6vpJrqY9U1Lo5FvE5ktmELwgOo/aN2BNn8Ye
                                vXCX
                                ) ; key tag = 64486
@                       NSEC3PARAM  1 0 50 7A59BC4B8A536621
p5v0al7iu1nhknb885o88bmd2on6v650 RRSIG  NSEC3 8 5 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                Ik6uRXyvUKhukQ1O6kVhIokOxIkJRt6vIN/U
                                2/fIom1qHvDaLZegzeOR/9ZjBypnGoHXBAdv
                                cutwmQPC765uNDTJW4C1WnGPQccV6KaSICiq
                                o+jlOeu9SNlxaMsFul3GQ/C2BV6cyMt2V/nN
                                iMCVLL5TxvhpHISNE+bdmw5otN8=
                                )
                        NSEC3   1 0 50 7A59BC4B8A536621 vpsasnt3eaq49l9cuq3lqrdgsbijkf65 A RRSIG
vpsasnt3eaq49l9cuq3lqrdgsbijkf65 RRSIG  NSEC3 8 5 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                KTacQes3fi3V35WbYblvdwBAZmnoZHDu+jZP
                                js0DXZoRnG0ttvf5mPIqF8WhsgKRty4gDyln
                                bEoHCWal9Y/lAYLP0PNv6hc0g/uzu3oB5VuD
                                Dz+MusfmWmr7iBWc+8AGTc/HsEonflZbmIoE
                                XSFhLpCrf5X8dPewtZB9cl80TIg=
                                )
                        NSEC3   1 0 50 7A59BC4B8A536621 p5v0al7iu1nhknb885o88bmd2on6v650 NS SOA RRSIG DNSKEY NSEC3PARAM
www                     A   192.0.2.10
                        RRSIG   A 8 5 3600 20120921134910 (
                                20120911124910 20011 windnssec.signed04.dnslab.org.
                                u24KXaMM+a4ysMlhNvAUVuiuXNrUVyHs6XvA
                                AXOhQmASJt6cbPhM09QkwRV2OWstVukqqVHu
                                gOOU70GmzGSpfsAi3iOcQ4GLK7S6bH09lSuu
                                tfH1Ezxt2CPEW3pqeyaBbZLZkP53NQ7o/nMu
                                ZQmEBv/NqRvBvPuHhpjsx4RV+tc=
                                )
```

We see four DNSKEY records in the zone, 2 KSK and 2 ZSK. One ZSK and one KSK are "active" (used to create signatures), while one KSK is the "stand-by" key for an emergency rollover. I'm not sure of the role of the extra ZSK.

Keys in the ```windnssec.signed04.dnslab.org``` zone:

Type    | ID    | status
--------|-------|---------
KSK     | 08257 | (active)
KSK     | 64486 | (standby)
ZSK     | 20011 | (active)
ZSK     | 55764 | ??

Unfortunately, the key IDs are not shown in the Windows 2012 DNS Server manager GUI (it would be quite useful to see the key ids for each zone to help troubleshooting DNSSEC issues).

![](/mdwiki/pages/kb/microsoft/dnssec/img/0b43ffc8-bd8e-42ca-9e48-7eb7beda19e0.png)

![](/mdwiki/pages/kb/microsoft/dnssec/img/f33bca56-3ac2-4e83-a736-c685746373dd.png)

## DS SET FILE

Below is the ds-set file created by the Windows 2012 DNS server. The file can be found it ```C:\Windows\System32\dns```:

![](/mdwiki/pages/kb/microsoft/dnssec/img/8474e28b-b5bd-4cfc-bbeb-ec248bb0bd40.png)
