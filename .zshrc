# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/${USER}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="cobalt2"
#ZSH_THEME="avit"
ZSH_THEME="oxide"
#ZSH_THEME="typewritten"
#ZSH_THEME="spaceship"
#ZSH_THEME="agnoster"
#ZSH_THEME="bullet-train/bullet-train"

# typewritten theme
TYPEWRITTEN_GIT_RELATIVE_PATH=true
TYPEWRITTEN_CURSOR=underscore
TYPEWRITTEN_PROMPT_LAYOUT="pure"

# bullet-train
BULLETTRAIN_KCTX_KCONFIG="/Users/${USER}/.kube/config"
BULLETTRAIN_PROMPT_CHAR="\n\$"
BULLETTRAIN_STATUS_EXIT_SHOW="true"
BULLETTRAIN_CONTEXT_DEFAULT_USER="${USER}"
BULLETTRAIN_PROMPT_ORDER=(
  context
  kctx
  dir
  go
  git
  status
)

# powerlevel9k
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k custom config
#DEFAULT_USER=$USER
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" --"
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="↳ "

#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time go_version ip)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs go_version)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context battery dir vcs virtualenv ssh)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git brew osx docker autoenv)
# installed autoenv manually to get latest version with support for leave
# https://github.com/kennethreitz/autoenv 
plugins=(vi-mode git brew osx docker zsh-autopair vscode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.zsh_aliases

# Custom functions
source ~/.zsh_fns.sh

# kubectl completion
source <(kubectl completion zsh)

# pack completion
source $(pack completion --shell zsh)

# fuzzy find fzf
# brew install fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autoenv
# git remote: origin	git://github.com/kennethreitz/autoenv.git
source ~/.autoenv/activate.sh
AUTOENV_ENABLE_LEAVE=yes

# auto-completion/ syntax highlighting
# brew install zsh-autosuggestions zsh-syntax-highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# configure highlighting and auto-suggestions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=235,fg=100'
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

# gcloud completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# CDPATH
setopt auto_cd
cdpath=($EMBA $HOME/Dropbox \(Personal\))

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# kn (knative) completion
source <(kn completion zsh)
compdef _kn kn


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
