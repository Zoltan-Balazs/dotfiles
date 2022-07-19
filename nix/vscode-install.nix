{ config, pkgs, lib, ... }: {
    imports =
    [
        ./vscode.nix
    ];

    vscode.user = "zoli";
    vscode.homeDir = "/home/zoli";
    vscode.extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
            name = "better-cpp-syntax";
            publisher = "jeff-hykin";
            version = "1.15.19";
            sha256 = "sha256-gWRmoQs30AHCTW8+m5Ak37piIoNprISqLW6+7TCmYY8=";
        }
        {
            name = "better-toml";
            publisher = "bungcip";
            version = "0.3.2";
            sha256 = "sha256-g+LfgjAnSuSj/nSmlPdB0t29kqTmegZB5B1cYzP8kCI=";
        }
        {
            name = "cmake";
            publisher = "twxs";
            version = "0.0.17";
            sha256 = "sha256-CFiva1AO/oHpszbpd7lLtDzbv1Yi55yQOQPP/kCTH4Y=";
        }
        {
            name = "cmake-tools";
            publisher = "ms-vscode";
            version = "1.12.13";
            sha256 = "sha256-hdu8SsCXa/ShJisN6pLouEKD46CJKscxMe8nmuktex0=";
        }
        {
            name = "code-runner";
            publisher = "formulahendry";
            version = "0.11.8";
            sha256 = "sha256-XRykE3RuGh+l73EY6e399RXVV1Vl+uq5bJNkfej9JcE=";
        }
        {
            name = "copilot";
            publisher = "GitHub";
            version = "1.31.6194";
            sha256 = "sha256-obUu3pHvdwzWBejVWl94Ki8YN7ujHukNX0gvRdWhBYw=";
        }
        {
            name = "copilot-labs";
            publisher = "GitHub";
            version = "0.2.221";
            sha256 = "sha256-96rQBwm6KhRiHSrqe00yaF3UY/qavXHnXhSESgUtfdU=";
        }
        {
            name = "cpptools";
            publisher = "ms-vscode";
            version = "1.11.2";
            sha256 = "sha256-iZYEL5e/UyWxwSYkt5sAAjj2Vy/xKfXKCuEI4uOTZXY=";
        }
        {
            name = "cpptools-extension-pack";
            publisher = "ms-vscode";
            version = "1.2.0";
            sha256 = "sha256-MEWL5ZlEfKPPR7wrejln+X5CIy4LcF+LIqFZYmlosZQ=";
        }
        {
            name = "crates";
            publisher = "serayuzgur";
            version = "0.5.10";
            sha256 = "sha256-bY/dphiEPPgTg1zMjvxx4b0Ska2XggRucnZxtbppcLU=";
        }
        {
            name = "csharp";
            publisher = "ms-dotnettools";
            version = "1.25.0";
            sha256 = "sha256-WE4DbJr1HqoyuS3mVYmIgd9DDTuSKPd6vdZn4YOPUtU=";
        }
        {
            name = "customize-ui";
            publisher = "iocave";
            version = "0.1.61";
            sha256 = "sha256-9sK6jhNhYv6pjImvLIoFpSP4FDCwVLM8hnvFyIIwxAM=";
        }
        {
            name = "doxdocgen";
            publisher = "cschlosser";
            version = "1.4.0";
            sha256 = "sha256-InEfF1X7AgtsV47h8WWq5DZh6k/wxYhl2r/pLZz9JbU=";
        }
        {
            name = "errorlens";
            publisher = "usernamehw";
            version = "3.5.2";
            sha256 = "sha256-FJAXnld0sfJkjmxdsa2T/oWzYUb5CuIST9BPT/CXHTU=";
        }
        {
            name = "gitlens";
            publisher = "eamodio";
            version = "12.1.2";
            sha256 = "sha256-qclBbZeGH7ODYAruhTi7X5FTRcai29nGTpSbeF129XI=";
        }
        {
            name = "haskell";
            publisher = "haskell";
            version = "2.2.0";
            sha256 = "sha256-YGPytmI4PgH6GQuWaRF5quiKGoOabkv7On+WVupI92E=";
        }
        {
            name = "helium-icon-theme";
            publisher = "helgardrichard";
            version = "1.0.0";
            sha256 = "sha256-uSApuTXQgvPiJpBL91d3mX35Sa2l2vLIAFpBo+cZ4h4=";
        }
        {
            name = "hexeditor";
            publisher = "ms-vscode";
            version = "1.9.7";
            sha256 = "sha256-vY+kVSxKVE5LUD1n3EKAaqtqenGEx43we4004k1VYMM=";
        }
        {
            name = "language-haskell";
            publisher = "justusadam";
            version = "3.6.0";
            sha256 = "sha256-rZXRzPmu7IYmyRWANtpJp3wp0r/RwB7eGHEJa7hBvoQ=";
        }
        {
            name = "language-x86-64-assembly";
            publisher = "13xforever";
            version = "3.0.0";
            sha256 ="sha256-wIsY6Fuhs676EH8rSz4fTHemVhOe5Se9SY3Q9iAqr1M=";
        }
        {
            name = "monkey-patch";
            publisher = "iocave";
            version = "0.1.18";
            sha256 = "sha256-IQIbU/63nMMsqof32eWp3tQb4qdXqhpMKN621NI9d9U=";
        }
        {
            name = "remote-containers";
            publisher = "ms-vscode-remote";
            version = "0.242.0";
            sha256 = "sha256-cLHa0E0izNu2QYQBQ0qUlCIXsJmvc7Q6kgR6F3hnMX8=";
        }
        {
            name = "remote-ssh";
            publisher = "ms-vscode-remote";
            version = "0.85.2022071315";
            sha256 = "sha256-kcqN8Ym1cyTT+P8h0nTq1j/GroMWOI4iPeLwvbkQrKQ=";
        }
        {
            name = "remote-ssh-edit";
            publisher = "ms-vscode-remote";
            version = "0.80.0";
            sha256 = "sha256-2rAIZnzVSU1J3wsNJ3wW9Bnqh4IgSmYCGfn2BJJo+X0=";
        }
        {
            name = "rust-analyzer";
            publisher = "rust-lang";
            version = "0.4.1125";
            sha256 = "sha256-vBuZzNO6wc1Tbj5SU76oL3zJz4WmyVn51Odiu1igj2E=";
        }
        {
            name = "rust-syntax";
            publisher = "dustypomerleau";
            version = "0.6.1";
            sha256 = "sha256-o9iXPhwkimxoJc1dLdaJ8nByLIaJSpGX/nKELC26jGU=";
        }
        {
            name = "todo-tree";
            publisher = "Gruntfuggly";
            version = "0.0.215";
            sha256 = "sha256-WK9J6TvmMCLoqeKWh5FVp1mNAXPWVmRvi/iFuLWMylM=";
        }
        {
            name = "vscode-go-syntax";
            publisher = "dunstontc";
            version = "0.0.18";
            sha256 = "sha256-ayeSDUrY2K3Xjt1q2pb4cNgGlR2cSxsqfJJlRWhdLPA=";
        }
        {
            name = "vscode-lldb";
            publisher = "vadimcn";
            version = "1.7.0";
            sha256 = "sha256-DuYweIri8NpBHcIG37WyUUc+p4/TaBBHcI6x6YIRvmk=";
        }
        {
            name = "vscode-office";
            publisher = "cweijan";
            version = "2.6.5";
            sha256 = "sha256-hB5Qv5fAftHqjUxQVZfVqRzZh+TJ2tZ7WplAwza9+ZE=";
        }
        {
            name = "vscode-theme-onedark";
            publisher = "akamud";
            version = "2.2.3";
            sha256 = "sha256-tfAhPTtOAYDU35UYMK6IRwWwh8r60DrAglBv1M81ztQ=";
        }
        {
            name = "yash";
            publisher = "daohong-emilio";
            version = "0.2.9";
            sha256 = "sha256-5JX6Z7xVPoqGjD1/ySc9ObD14O1sWDpvBj9VbtGO1Cg=";
        }
    ];
}