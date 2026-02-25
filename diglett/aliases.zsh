alias diglett-ssh='ssh diglett'
alias diglett-vnc='open -a "/Applications/TigerVNC.app" --args localhost:5901'
alias diglett-vnc-tunnel='cloudflared access tcp --hostname vnc.diglett.xyz/ --url localhost:5901'

# NUC
alias diglett-chromium='google-chrome --disable-gpu &'
alias diglett-vnc-restart='vncserver -kill :1 2>/dev/null; vncserver :1'