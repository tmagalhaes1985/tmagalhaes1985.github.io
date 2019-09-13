# Sistemas Autônomos

## O protocolo IP

## Sistemas Autônomos, BGP, PTTs

## Plano de endereçamento

## Boas práticas para roteamento

### Introdução ao roteamento

#### OSPF

### Introdução ao BGP

#### iBGP

#### eBGP

#### Boas práticas para o BGP

### MANRS

### Filtros Anti SPAM

### Filtros Anti-Spoofing

### Boas práticas para conexão a um PTT

## Tópicos avançados de roteamento

 Configurações para Multihoming
 Engenharia de tráfego

## Gerenciamento de redes

## Segurança

- Hardening de Equipamentos
- Tratamento de Incidentes
- Análise do Google para sites
- Análise do Google para sistemas autônomos

## Extras

### NTP

### IETF

### Bug iBGP - Mikrotik

```bash
mikrotik_borda:

/routing filter
add chain=BUG-IBGP-MKT-IPV6 set-in-nexthop-ipv6=4D0C:XX:0:3::6,4D0C:XX:0:4::A,4D0C:XX:0:1::2

/routing bgp peer
set IBGP-IPV6-CISCO in-filter=BUG-IBGP-MKT-IPV6
set IBGP-IPV6-JUNIPER in-filter=BUG-IBGP-MKT-IPV6
set IBGP-IPV6-MKT-CLIENTES in-filter=BUG-IBGP-MKT-IPV6

----------------------------------------------

mikrotik_clientes:

/routing filter
add chain=BUG-IBGP-MKT-IPV6 set-in-nexthop-ipv6=4D0C:XX:0:1::1,4D0C:XX:0:5::E

/routing bgp peer
set IBGP-IPV6-CISCO in-filter=BUG-IBGP-MKT-IPV6
set IBGP-IPV6-MKT-BORDA in-filter=BUG-IBGP-MKT-IPV6
set IBGP-IPV6-JUNIPER in-filter=BUG-IBGP-MKT-IPV6
```

### DNS Reverso
