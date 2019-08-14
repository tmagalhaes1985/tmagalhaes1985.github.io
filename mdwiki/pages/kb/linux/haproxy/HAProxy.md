# HAProxy

## Sobre o HAProxy

O HAProxy é uma solução gratuita, rápida e confiável, que oferece alta disponibilidade, balanceamento de carga e proxy para aplicativos Web.

É amplamente utilizado em sites de tráfego intenso, e alguns são sites mais visitados do mundo.

Ao longo dos anos, tornou-se o balanceador de carga default fornecido com a maioria das distribuições Linux, além de geralmente ser implantado por padrão em plataformas de nuvem.

Como o HAProxy não anuncia a si mesmo, só sabemos que ele está em uso quando os administradores informam :-)

Seu modo de operação torna sua integração em arquiteturas existentes muito fácil e sem riscos, enquanto oferece a possibilidade de não expor servidores frágeis à rede:

![Proxy mode](/mdwiki/pages/kb/linux/haproxy/haproxy-pmode.png)

## Balanceamento de carga

O balanceamento de carga consiste na agregação de vários componentes para obter uma capacidade de processamento total acima da capacidade individual de cada componente, sem qualquer intervenção do usuário final e de forma escalonável.

Exemplos de balanceamento de carga:

- Agendamento de processos em sistemas com vários processadores
- Balanceamento de carga de link (por exemplo, EtherChannel, Bonding)
- Balanceamento de carga de endereços IP (por exemplo, ECMP, round-robin de DNS)
- Balanceamento de carga do servidor (via balanceadores de carga)

Em ambientes da Web, esses componentes são chamados de "balanceador de carga de rede", pois essa atividade é, de longe, o caso de uso mais comum.
