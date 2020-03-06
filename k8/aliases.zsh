alias kcheat='cat ~/.dotfiles/k8/aliases.zsh'
alias mk='minikube kubectl --'
alias k='kubectl'

alias kgc='kubectl config get-contexts'
alias kuc='kubectl config use-context'

alias ke='kubectl edit'
alias kg='kubectl get'
alias kg-all='kubectl get all --all-namespaces | less'
alias kl='kubectl logs'
alias kd='kubectl describe'
alias kx='kubectl exec -it'
alias kt='kubectl top'
alias krm='kubectl delete'
alias ksyse='kubectl -n kube-system edit'
alias ksysg='kubectl -n kube-system get'
alias ksysl='kubectl -n kube-system logs'
alias ksysx='kubectl -n kube-system exec -it'
alias ksysd='kubectl -n kube-system describe'
alias ksysrm='kubectl -n kube-system delete'
alias ksyst='kubectl -n kube-system top'
alias kdrain='kubectl drain --ignore-daemonsets --delete-local-data'

# kubectl exec airflow-5fcc549cc4-l6qkk -c webserver -it -- /bin/bash
# kubectl logs -f airflow-5fcc549cc4-l6qkk -c webserver
# kubectl run -it --rm --image=debian:buster test -- bash
# kubectl delete po -n kube-system -l k8s-app=kube-dns # remove core dns pods

function k-bash() {
  kubectl exec -it $1 -- /bin/bash
}