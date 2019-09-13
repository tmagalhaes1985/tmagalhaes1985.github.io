# Shell Básico

## Determinando a versão do Kernel

```uname -a```

## Identificando a distro e a versão

```cat /etc/lsb-release```

## Identificando a quantidade de RAM instalada num sistema

```cat /proc/meminfo```

## Identificando o modelo da CPU

```cat /proc/cpuinfo```

## Identificando o modelo da GPU

```lspci -v | grep AMD```

```lspci -v | grep NVIDIA```

## Identificando o tamanho dos discos e espaço livre

```df -H```

## Identificando dispositivos USB

```xinput```

---

---

## Download de um site inteiro

```wget --recursive http://intranet.wales/```
