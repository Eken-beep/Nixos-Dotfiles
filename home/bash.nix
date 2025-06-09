{ ... }:
{
    programs.bash = {
        enable = true;
        historyControl = [ "ignoredups" "ignorespace" ];

        shellAliases = {
            ll = "ls -la";
            "..." = "cd ../..";
            ed = "nvim $(fzf)";
        };

        initExtra = ''
            if uwsm check may-start; then
                uwsm start default
            fi
        '';
    };
}
