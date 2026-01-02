# kubeswitch

Per-shell Kubernetes context and namespace switching using `KUBECONFIG`.

Each shell session gets its own isolated kubeconfig file, so you can work in different contexts/namespaces across multiple terminals without conflicts.

## Installation

### Plugin managers

```zsh
# zinit
zinit light jcwu7/kubeswitch

# zplug
zplug "jcwu7/kubeswitch"

# antigen
antigen bundle jcwu7/kubeswitch
```

### Manual

```zsh
# Clone the repo
git clone https://github.com/jcwu7/kubeswitch.git ~/.kubeswitch

# Add to .zshrc
source ~/.kubeswitch/kubeswitch.plugin.zsh
```

## Usage

```zsh
# Switch to context and namespace
kubeswitch <context> <namespace>

# Revert to default kubeconfig
kubeswitch exit

# Clear cached profiles
kubeswitch clear
```

Tab completion is available for both context and namespace arguments.

## Configuration

Set these in `~/.config/kubeswitch/config` or export before sourcing:

```zsh
# Cache directory for generated profiles (default: ~/.cache/kubeswitch)
KUBESWITCH_CACHE_DIR=$HOME/.cache/kubeswitch
```

## How it works

1. On first use of a context/namespace pair, kubeswitch copies `~/.kube/config` to a profile-specific file
2. Sets the context and namespace in that copy
3. Exports `KUBECONFIG` pointing to the profile file
4. Subsequent calls with the same pair reuse the cached profile

This leverages kubectl's `KUBECONFIG` environment variable, which is inherited per-shell and not shared across terminals.
