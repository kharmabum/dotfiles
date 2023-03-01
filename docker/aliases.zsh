alias remake='docker rmi halo:latest && make image'
alias docker-stop='docker container stop $(docker container ls -qa) || true'
alias docker-rm='docker container rm $(docker container ls -qa) || true'
alias docker-nuke='docker-stop && docker-rm'