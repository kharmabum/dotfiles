alias remake='docker rmi halo:latest && make image'
alias docker-nuke='docker container stop $(docker container ls -qa) || true'