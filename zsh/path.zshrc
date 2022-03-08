# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# 由于政策原因，所有源自 Debian 的autojump发行版都需要手动激活
. /usr/share/autojump/autojump.sh


#默认使用编辑器
export EDITOR=/usr/bin/nvim
######################################################################
###FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#Append this line to ~/.zshrc to enable fzf keybindings for Zsh:
#source /usr/share/doc/fzf/examples/key-bindings.zsh
#Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:
#source /usr/share/doc/fzf/examples/completion.zsh
# 这行配置开启 fd 查找隐藏文件 及忽略 .git 文件等
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude={.git,.idea,.sass-cache,node_modules,build} . ~/.config /home / '
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
#该环境变量定义了 fzf 的参数
export FZF_DEFAULT_OPTS='--height 90% --bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_COMPLETION_TRIGGER='\'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'
######################################################################
###GO
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
