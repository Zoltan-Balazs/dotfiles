{ pkgs, theme }:
let
    themeColors = theme.colors;

    configFile = pkgs.writeText "alacritty.yml" ''
        window:
            dimensions:
                columns: 0
                lines: 0

            padding:
                x: 5
                y: 5

            decorations: None

        tabspaces: 4

        font:
            normal:
                family: ${theme.fonts.mono}
                style: Regular
            bold:
                family: ${theme.fonts.mono}
                style: Bold
            italic:
                family: ${theme.fonts.mono}
                style: Italic

            size: ${theme.fonts.size}.0

            offset:
                x: 0
                y: 0
            glyph_offset:
                x: 0
                y: 0

            scale_with_dpi: false

        colors:
            primary:
                background:         '#${themeColors.base}'
                foreground:         '#${themeColors.text}'
                dim_foreground:     '#${themeColors.text}'
                bright_foreground:  '#${themeColors.text}'

            cursor:
                text:   '#${themeColors.base}'
                cursor: '#${themeColors.rosewater}'
            vi_mode_cursor:
                text:   '#${themeColors.base}'
                cursor: '#${themeColors.lavender}'

            search:
                matches:
                    foreground: '#${themeColors.base}'
                    background: '#${themeColors.subtext0}'
                focused_match:
                    foreground: '#${themeColors.base}'
                    background: '#${themeColors.green}'
                footed_bar:
                    foreground: '#${themeColors.base}'
                    background: '#${themeColors.subtext0}'
            
            hints:
                start:
                    foreground: '#${themeColors.base}'
                    background: '#${themeColors.yellow}'
                end:
                    foreground: '#${themeColors.base}'
                    background: '#${themeColors.subtext0}'

            selection:
                text:       '#${themeColors.base}'
                background: '#${themeColors.rosewater}'

            normal:
                black:   '#${themeColors.surface1}'
                red:     '#${themeColors.red}'
                green:   '#${themeColors.green}'
                yellow:  '#${themeColors.yellow}'
                blue:    '#${themeColors.blue}'
                magenta: '#${themeColors.pink}'
                cyan:    '#${themeColors.teal}'
                white:   '#${themeColors.subtext1}'

            bright:
                black:   '#${themeColors.surface2}'
                red:     '#${themeColors.red}'
                green:   '#${themeColors.green}'
                yellow:  '#${themeColors.yellow}'
                blue:    '#${themeColors.blue}'
                magenta: '#${themeColors.pink}'
                cyan:    '#${themeColors.teal}'
                white:   '#${themeColors.subtext0}'

            dim:
                black:   '#${themeColors.surface1}'
                red:     '#${themeColors.red}'
                green:   '#${themeColors.green}'
                yellow:  '#${themeColors.yellow}'
                blue:    '#${themeColors.blue}'
                magenta: '#${themeColors.pink}'
                cyan:    '#${themeColors.teal}'
                white:   '#${themeColors.subtext1}'

            indexed_colors:
                - { index: 16, color: '#${themeColors.peach}' }
                - { index: 17, color: '#${themeColors.rosewater}' }
    '';
in
pkgs.stdenv.mkDerivation {
    name = "alacritty-styled";
    src = null;
    buildInputs = [ pkgs.alacritty pkgs.makeWrapper ];
    unpackPhase = "true";
    installPhase = ''
        makeWrapper ${pkgs.alacritty}/bin/alacritty $out/bin/alacritty \
            --add-flags "--config-file ${configFile}"
    '';
}