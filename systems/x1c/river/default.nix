{ pkgs, inputs, colors, ... }:
{
    home.packages = [
        pkgs.wlr-randr
        pkgs.wlopm
        
        pkgs.swayidle
        
        inputs.slstatus.defaultPackage.x86_64-linux
        pkgs.creek
    ];

    wayland.windowManager.river = {
        enable = true;
        settings = {
            # So that this follows the system color config
            background-color = "0x${colors.peach}";
            border-color-focused = "0x${colors.blue}";
            border-color-unfocused = "0x${colors.text}";
            border-color-urgent = "0x${colors.red}";
        };
        extraConfig = builtins.readFile ./river-config.sh;
    };

    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                terminal = "${pkgs.kitty}/bin/kitty";
                layer = "overlay";
                font = "JetbarinsMono Nerd Font:size=14";
                use-bold = "yes";
                icons-enabled = "no";

                horizontal-pad = 8;
            };
            colors = {
                background = "${colors.crust}ff";
                text = "${colors.text}ff";
                border = "${colors.mauve}ff";
                selection = "${colors.crust}ff";
                selection-text = "${colors.text}ff";
                selection-match = "${colors.red}ff";
                input = "${colors.lavender}ff";
                match = "${colors.lavender}ff";
            };
            border.width = 2;
        };
    };
}
