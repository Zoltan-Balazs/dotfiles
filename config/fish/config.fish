# if status is-interactive
    # Commands to run in interactive sessions can go here
# end
set fish_color_autosuggestion dadada
pfetch

starship init fish | source
zoxide init fish | source

alias ls="exa -la --group-directories-first --icons"
alias cat="bat"
alias cd="z"
alias code="code-insiders"
alias vim="nvim"
alias vi="nvim"

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
