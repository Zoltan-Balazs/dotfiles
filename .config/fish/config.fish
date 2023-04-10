set fish_color_autosuggestion dadada
set fish_greeting

# thefuck --alias | source
# zoxide init fish | source
starship init fish | source

# alias ls="lsd -la"
alias ls="exa -la --group-directories-first --icons"
alias cat="bat"
# alias r="radian"

switch (tty)
case "/dev/tty1"
    wrapperhl
end