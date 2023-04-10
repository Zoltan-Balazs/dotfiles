{ config, pkgs, ...}:

{
    imports = [
        ./common-config.nix
        ./hardware-configuration.nix
    ];
    
    # Use Systemd boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.consoleMode = "auto";
    boot.loader.efi.canTouchEfiVariables = true;

    # Change Linux Kernel to bleeding edge
    boot.kernelPackages = pkgs.linuxPackages_6_0;
}