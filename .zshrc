ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1


# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime ruby docker systemadmin osx colored-man common-aliases emoji gpg-agent)

source $ZSH/oh-my-zsh.sh

export GOPATH=/Users/danny/src/go

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

ssh-add ~/.ssh/id_rsa

alias did="vim +'normal Go' +'r!date' ~/did.txt"
