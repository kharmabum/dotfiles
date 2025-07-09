alias remake='docker rmi halo:latest && make image'
alias docker-stop='docker container stop $(docker container ls -qa) || true'
alias docker-rm='docker container rm $(docker container ls -qa) || true'
alias docker-volumes-rm='docker volume rm $(docker volume ls -q) || true'
alias docker-nuke='docker compose down --volumes && docker-stop && docker-rm && docker-volumes-rm'
alias dockerps='docker ps --format "table {{.ID}}\t{{printf \"%.50s\" .Names}}\t{{printf \"%.30s\" .Image}}\t{{.Ports}}\t{{.Status}}"'
alias dockerpsae='docker ps -a --filter "status=exited" --no-trunc --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Command}}\t{{.Image}}"'
alias distart="docker inspect --format '{{.State.StartedAt}}'"
alias diimage="docker inspect --format='{{.Image}}'"
