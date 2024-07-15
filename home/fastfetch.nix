{ ... }:
{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "~/Pictures/nixos.png";
                type = "kitty-direct";
                padding.left = 6;
                width = 32;
            };

            display = {
                color = {
                    keys = "blue";
                    title = "red";
                };
            };

            modules = [
                "title"
                "separator"
                {
                    type = "os";
                    key = "Distro";
                    format = "{3}";
                }
                {
                    type = "kernel";
                    key = "Kernel Version";
                    format = "{2}";
                }
                {
                    type = "packages";
                    format = "{9}";
                }
                "shell"
                "wm"
                "separator"
                {
                    type = "cpu";
                    format = "{1} - {3} Cores";
                }
                {
                    type = "gpu";
                    key = "GPU";
                    hideType = "integrated";
                    format = "{2}";
                }
                {
                    type = "memory";
                }
                {
                    type = "disk";
                }
            ];
        };
    };
}
