# Chalenges 02

## Great, kid, don't get cocky.

There are two UDP services running in the given network range (172.20.1.100-200). Please input their port numbers as a sorted, comma separated list in ascending order. For example if the ports are 27346 and 9834 you should write

9834,27346

Hint: the ports are well known


```sh
nmap -sU -n -v -p- 172.20.1.100-200 > UDP-ports.txt
```

I get two UDP ports with running services: 69, 161.

## Try not. Do or do not. There is no try.

What is the highest port used by the HTTP servers in the given range? (172.20.1.100-200) Please use a numerical value.

I used nmap snippet.

## There’s always a bigger fish.

Solution: use ncat with service 172.20.1.149:19333 and solve math task.



## Find flag in the network

Solution was focus on UDP and ICMP packets.
