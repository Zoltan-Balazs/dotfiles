{ config, pkgs, lib, ... }:
{
    # Change to Fish shell
    programs.fish.enable = true;

    # Set aliases
    programs.fish.shellAliases = {
        # Generic
        ls = "lsd -la";
        cat = "bat";
        r = "radian";

        # Nix specific
        nix-garbage = "sudo nix-collect-garbage -d";
        nix-rebuild = "sudo nixos-rebuild switch";
        nix-home = "home-manager switch";
    };

    # Starship configuration
    programs.starship = {
        enable = true;

        settings = {
            character = {
                format = "[❯](bold green)";
                success_symbol = "[❯](bold green)";
                error_symbol = "[❯](bold red)";
            };

            package.disabled = false;
            aws.disabled = true;
            gcloud.disabed = true;
            git_status.disabled = false;

            time = {
                disabled = false;
                time_format = "📅%m/%d ⏱️%H:%M";
                format = "[$time ](white bold)";
            };

            directory = {
                format = "[$path]($style)[$read_only]       ($read_only_style) ";
                truncation_length = 3;
                read_only = " 🔒";
                truncate_to_repo = false;
                truncation_symbol = "../";
            };

            username = {
                disabled = false;
                format = "[$user](bold yellow)[@](bold cyan)";
                show_always = true;
            };

            hostname = {
                ssh_only = false;
                format = "[$hostname](bold red) ";
            };

            cmd_duration = {
                disabled = false;
                min_time = 500;
                format = "took [$duration](bold yellow) ";
            };
        }
    }
} 