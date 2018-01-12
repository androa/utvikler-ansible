#! /bin/sh

export KUBECONFIG="$HOME/kubeconfigs/config"

if [ "$0" = "/usr/bin/bash" ]; then
    . "$HOME/workspace/kubectx/completion/kubectx.bash"
    . "$HOME/workspace/kubectx/completion/kubens.bash"

    if [ ! -f "$HOME/.bash_helm" ]; then
	"$HOME/.local/bin/helm" completion bash > .bash_helm
    fi
    . "$HOME/.bash_helm"

    if [ ! -f "$HOME/.bash_kubectl" ]; then
	/usr/bin/kubectl completion bash > .bash_kubectl
    fi
    . "$HOME/.bash_kubectl"
fi
    

if [ "$0" = "/usr/bin/zsh" ]; then
    . "$HOME/workspace/kubectx/completion/kubectx.zsh"
    . "$HOME/workspace/kubectx/completion/kubens.zsh"

    if [ ! -f "$HOME/.zsh_helm" ]; then
	"$HOME/.local/bin/helm" completion zsh > .zsh_helm
    fi
    . "$HOME/.zsh_helm"

    if [ ! -f "$HOME/.zsh_kubectl" ]; then
	/usr/bin/kubectl completion zsh > .zsh_kubectl
    fi
    . "$HOME/.zsh_kubectl"
fi
