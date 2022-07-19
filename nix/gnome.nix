{ config, pkgs, lib, ... }: {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Install some packages
    users.users.zoli = {
        packages = with pkgs; [
            # GNOME
            gnome.gnome-tweaks
            gnomeExtensions.dash-to-dock
            gnomeExtensions.topicons-plus
            gnomeExtensions.topiconsfix
            gnomeExtensions.appindicator
            gnomeExtensions.hide-activities-button
            gnomeExtensions.fildem-global-menu
            adwaita-qt
            libadwaita
        ];
    };

    # Exclude some packages
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
    ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        gnome-terminal
        gedit # text editor
        epiphany # web browser
        geary # email reader
        evince # document viewer
        gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
    ]);
}