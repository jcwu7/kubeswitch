# Proper $0 handling per Zsh Plugin Standard
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
KUBESWITCH_DIR="${0:h}"

# Source XDG config if exists
[[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/kubeswitch/config" ]] && \
  source "${XDG_CONFIG_HOME:-$HOME/.config}/kubeswitch/config"

# Defaults (can be overridden by config)
: ${KUBESWITCH_CACHE_DIR:=$HOME/.cache/kubeswitch}

# Add functions to fpath and autoload
fpath=("$KUBESWITCH_DIR/functions" $fpath)
autoload -Uz kubeswitch _kubeswitch __kubeswitch_list_contexts __kubeswitch_list_namespaces
compdef _kubeswitch kubeswitch
