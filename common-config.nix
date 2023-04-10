{ config, lib, pkgs, stdenv, ... }:
let
    theme = import ./themes/catppuccin-mocha.nix;
    alacritty = import ./pkgs/alacritty.nix { inherit pkgs theme; };
in
{   
    # Silent Boot
    boot.plymouth.enable = true;

    # Allow Unfree Packages
    nixpkgs.config.allowUnfree = true;

    # Enable Audio
    sound.enable = true;
    hardware.pulseaudio = {
        enable = true;
        systemWide = true;
    };

    # TODO: Volume normalization

    # Networking
    networking.networkmanager.enable = true;

    # Locale 
    i18n = {
        defaultLocale = "en_US.UTF-8";
    };

    # Keymap
    console.keyMap = "hu";

    # Timezone
    time.timeZone = "Europe/Budapest";

    # AwesomeWM
    services.xserver = {
        enable = true;
        layout = "hu";

        # lib.mkOverride needed for QEMU
        resolutions = [
                {
                    x = 1920;
                    y = 1080;
                }
                {
                    x = 2560;
                    y = 1440;
                }
        ];

        displayManager.lightdm.greeters.mini = {
            enable = true;
            user = "zoli";
            extraConfig = ''
                [greeter]
                show-image-on-all-monitors = false
                password-border-width = 1px
                show-password-label = false
                [greeter-theme]
                background-image = "/etc/nixos/lightdm/login-image.png"
            '';
        };

        displayManager.defaultSession = "none+awesome";
        windowManager.awesome = {
            enable = true;
            luaModules = with pkgs.luaPackages; [
                luarocks # is the package manager for Lua modules
                luadbi-mysql # Database abstraction layer
            ];
        };
    };

    # System packages
    environment.systemPackages = with pkgs; [
        # Apps
        alacritty
        firefox
        vscode
        
        # Dev
        agda
        sccache
        gcc
        kotlin
        lldb
        # radian - not in nixpkgs
        rustup
        python310

        # Utilities
        bat
        btop
        broot
        cargo-edit
        du-dust
        eva
        fd
        fish
        fzf
        git
        grex
        hexyl
        lsd
        nomino
        procs
        ripdrag
        ripgrep
        sd
        starship
        tealdeer
        thefuck
        topgrade
        unrar
        unzip
        yt-dlp
        zoxide

        # Nice to haves
        gnome.gnome-keyring

        # Eye candy
        pfetch
    ];

    # Change shells
    environment.shells = with pkgs; [ fish ];

    # User config
    users.extraUsers.zoli = {
        isNormalUser = true;
        description = "Zoltán Balázs";
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;

        packages = with pkgs; [
            home-manager
        ];
    };

    # NOT FOR UPGRADING!
    system.stateVersion = "22.05";
}