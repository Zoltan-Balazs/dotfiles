if status is-interactive
    thefuck --alias | source
    zoxide init fish | source
    starship init fish | source
    atuin init fish | source

    alias ls="eza --long --all --git --hyperlink --group-directories-first --icons"
    alias cat="bat"
    alias r="radian"
end

set fish_greeting
