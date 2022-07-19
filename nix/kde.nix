{ config, pkgs, lib, ... }: {
    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

    users.users.zoli = {
        packages = with pkgs; [
            # KDE
            libsForQt5.ark
            libsForQt5.gwenview
            libsForQt5.kolourpaint
            libsForQt5.skanlite
            libsForQt5.skanpage
            libsForQt5.spectacle
            libsForQt5.okular
            # libsForQt5.kde-gtk-config
            # libsForQt5.sddm-kcm
        ];
    };

    services.xserver.desktopManager.plasma5.excludePackages = (with pkgs; [
        elisa
        konsole
        kwalletmanager
    ]);
}