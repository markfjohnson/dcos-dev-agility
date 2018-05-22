echo on
dcos kafka endpoints broker  --name=kafka-dev
dcos tunnel vpn --client=/usr/local/sbin/openvpn --user=core

