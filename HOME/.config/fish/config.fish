# set fish_color_autosuggestion dadada
set fish_greeting

thefuck --alias | source
zoxide init fish | source
starship init fish | source

alias ls="exa -la --group-directories-first --icons"
alias cat="bat"
alias cd="z"
