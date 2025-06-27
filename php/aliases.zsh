alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sailup='sail up -d --force-recreate'
alias phpf='sail composer run phpcbf'