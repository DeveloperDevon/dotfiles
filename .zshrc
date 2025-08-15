eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="${HOME}/.pyenv/shims:${PATH}"
export PATH="/Users/devon.reichardt/bin/Sencha/Cmd:$PATH"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

r() {
  docker compose restart "$1" && docker compose logs -f "$1" --tail 1000 | sed 's/^[^|]*| //'
}

alias vim="nvim"
alias vim-ls="fd --type f --exclude .git --exclude node_modules | fzf-tmux -p --reverse | xargs nvim"
alias lg=lazygit
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias dev="cd ~/git/mp && nvim"
alias dc="docker compose"
alias dce="docker compose exec -it"
alias dcl="docker compose logs -f --tail 1000"
alias dcr="docker compose restart"
# alias dcb="dcr & dcl"
alias dcfr="docker compose up -d --force-recreate"
alias cddc="cd ~/git/mp/mpe-docker/docker-compose"
# alias cddc="cd ~/git/mp/mpe-docker/;docker-compose"
alias cdmp="cd ~/git/mp"
alias psui="cd ~/git/mp/ps-ui/packages/marketpay && code ."
alias bounce-mpnode="dc restart mpnode-mp && dc logs -f --tail 1000 mpnode-mp"
alias bounce-cms="dc restart cms-mp && dc logs -f --tail 1000 cms-mp"
alias ssh-rc="ssh devon.reichardt_dc@dc.pssea.office@il-test-new-fs.dc.pssea.office"
alias ssh-preprod="ssh devon.reichardt_dc@mp-test-01.dc.pssea.office"
alias ssh-backbar="ssh devon.reichardt_dc@dc.pssea.office@mp-back-bar-01.dc.pssea.office"
alias ssh-prod="ssh devon.reichardt_dc@dc.pssea.office@il-jump-01.dc.pssea.office"
alias ssh-db-dev="ssh devon.reichardt_dc@dc.pssea.office@st30mp-pgdb-01.dc.pssea.office"
alias tail-acs="tail -f ~/docker/mp/dmp/logs/acs/merit-error.log"

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

export BAT_THEME=tokyonight_night

# ---- Eza (better ls) -----

alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"
