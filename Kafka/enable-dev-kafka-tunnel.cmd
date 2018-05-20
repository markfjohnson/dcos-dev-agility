echo on
dcos kafka endpoints broker  --name=kafka-dev
for /f %%i in ('dcos config show core.dcos_url') do set VAR=%%i
set HNAME=%VAR:https://=%
::ssh -4 -f -i \dcos_scripts/ccm.pem -N -L 9092:broker.kafka.l4lb.thisdcos.directory:9092 core@%HNAME%
ssh -i \dcos_scripts\ccm.pem -N -L 9093:broker.kafka-dev.l4lb.thisdcos.directory:9092 core@%HNAME%

