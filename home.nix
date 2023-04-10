{ config, pkgs, ... }:

{
    # Enable home manager
    programs.home-manager.enable = true;

    # Some important information about the user
    home.username = "zoli";
    home.homeDirectory = "/home/zoli";

    # VScode & Extensions
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            # banacorn.agda-mode
            # jeff-hykin.better-cpp-syntax
            ms-vscode.cpptools
            catppuccin.catppuccin-vsc
            # twxs.cmake
            # ms-vscode.cmake-tools
            serayuzgur.crates
            # ms-vscode-remote.remote-containers
            usernamehw.errorlens
            tamasfe.even-better-toml
            github.copilot
            # ms-vscode.hexeditor
            # fwcd.kotlin
            bbenoist.nix
            # cweijan.vscode-office
            ms-python.vscode-pylance
            ms-python.python
            ms-vscode-remote.remote-ssh
            # ms-vscode-remote.remote-ssh-edit
            # rust-lang.rust-analyzer
            gruntfuggly.todo-tree
            emmanuelbeziat.vscode-great-icons
        ];
    };

    home.stateVersion = "22.05";
}