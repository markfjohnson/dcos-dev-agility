#!/usr/bin/env bash
#TODO Bash tunnel implementation needs to get verified
export HNAME=$(echo $(dcos config show core.dcos_url) | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')

ssh -4 -f -i \dcos_scripts\ccm.pem -N -L 9092:broker.kafka-dev.l4lb.thisdcos.directory:9092 core@$HNAME

ssh -4 -f -i ccm.pem -N -L 9092:broker.kafka.l4lb.thisdcos.directory:9092 core@$HNAME