# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ./kde.nix
        ./vscode-install.nix
        ./terminal.nix
    ];

    # Mount the NTFS partitions
    # /dev/sdd1 - SSD Games
    fileSystems."/mnt/games" =
    { 
        device = "/dev/disk/by-uuid/AC1011FE1011CFE6";
        fsType = "ntfs"; 
        options = [ "rw" "uid=1000"];
    };

    # /dev/sdb2 - HDD
    fileSystems."/mnt/hdd" =
    { 
        device = "/dev/disk/by-uuid/CA7A72247A720D87";
        fsType = "ntfs"; 
        options = [ "rw" "uid=1000"];
    };

    # /dev/sdc2 - HDD Archive
    fileSystems."/mnt/archive" =
    { 
        device = "/dev/disk/by-uuid/766E0F016E0EB9BF";
        fsType = "ntfs"; 
        options = [ "rw" "uid=1000"];
    };
    
    # /dev/sda1 - SSD Software
    fileSystems."/mnt/software" =
    { 
        device = "/dev/disk/by-uuid/3422FBB522FB7A66";
        fsType = "ntfs"; 
        options = [ "rw" "uid=1000"];
    };

    # Latest kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
    
    # NVIDIA Drivers
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.opengl.enable = true;

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    services.xserver.screenSection = ''
        Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
    '';

    # Steam compatibility
    hardware.opengl.driSupport = true;
    hardware.opengl.driSupport32Bit = true;

    # SteamVR
    hardware.steam-hardware.enable = true;

    # fish (MOVED TO terminal.nix)
    # programs.fish.enable = true;

    # nix-ld
    programs.nix-ld.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Budapest";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable GNOME keyring - Required by GitHub Copilot
    services.gnome.gnome-keyring.enable = true;

    # Configure keymap in X11
    services.xserver = {
        layout = "hu";
        xkbVariant = "";
    };

    # Configure console keymap
    console.keyMap = "hu101";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable SANE & AVAHI to scan documents.
    hardware.sane.enable = true;
    services.saned.enable = true;
    services.avahi.enable = true;
    services.avahi.nssmdns = true;
    services.saned.extraConfig = "192.168.0.146/8018";
    hardware.sane.netConf = "192.168.0.146:8018"; 

    # Enable Bluetooth
    hardware.bluetooth.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    hardware.pulseaudio.support32Bit = false;
    security.rtkit.enable = true;
    nixpkgs.config.pulseaudio = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        # jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        # media-session.enable = true;
    };
    
    # Fonts
    fonts.fontDir.enable = true;
    fonts.fonts = with pkgs; [
        iosevka
        jetbrains-mono
        fira-code
        fira-code-symbols
        cascadia-code
        terminus-nerdfont
    ];

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Normalize audio
    # systemd.user.services.normalize-audio = {
    #   description = "Normalizes volume";
    #   serviceConfig.PassEnvironment = "AUDIO";
    #   script = ''
    #     pactl load-module module-ladspa-sink sink_name=ladspa_sink master=alsa_output.pci-0000_00_1f.3.analog-stereo plugin=sc4_1882 label=sc4 control=1,1.5,401,-12,20,5,12
    #     pactl load-module module-ladspa-sink sink_name=ladspa_normalized master=ladspa_sink plugin=fast_lookahead_limiter_1913 label=fastLookaheadLimiter control=10,-20,0.8
    #   '';
    #   wantedBy = [ "multi-user.target" ]; # starts after login
    # };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.zoli = {
        isNormalUser = true;
        shell = pkgs.fish;
        description = "Zoltán Balázs";
        extraGroups = [ "kvm" "libvirt" "audio" "scanner" "lp" "networkmanager" "wheel" ];
        packages = with pkgs; [
            # Programs
            betterdiscordctl
            bitwarden
            (discord.override { nss = nss_latest; })
            firefox
            heroic
            kitty
            onlyoffice-bin
            qalculate-gtk
            qbittorrent

            # Games
            lutris
            polymc
            steam

            # Virtualization
            iproute2
            libvirt
            qemu_kvm
            virt-manager
            wineWowPackages.stable
            win-qemu
        
            # Utilities
            gnome.gnome-keyring
            hunspell
            hunspellDicts.hu_HU
            jdk
            jdk8
            libgnome-keyring
            libsecret
            linuxPackages.nvidia_x11.bin
            lighthouse-steamvr
            rustscan
            unzip
            unrar

            # ladspaPlugins # potentially for volume normalization
        ];
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.

        # CLI
        bat
        broot
        btop
        du-dust
        eva
        exa
        fd
        fish
        grex
        hexyl
        neofetch
        neovim
        nomino
        nvtop
        procs
        ripgrep
        sd
        starship
        tealdeer
        thefuck
        yt-dlp
        zoxide
        pfetch

        # Utilities 
        file
        gcc
        git
        glibc
        gnumake
        home-manager
        libgcc
        nmap
        ntfs3g
        pciutils
        wget

        # Printer
        libusb1
        lsb-release
        samsung-unified-linux-driver
        sane-backends

        # Rust <3
        lldb
        rust-analyzer
        rustup
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?

}
