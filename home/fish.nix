{ lib, config, pkgs, ... }:

{
    programs.command-not-found.enable = true;

    programs.fish = {
      enable = true;

      shellAliases = {
        ll = "ls -la";
        "..." = "cd ../..";
        ed = "nvim $(fzf)";
      };

      shellInit = ''
          if status is-interactive
              fastfetch
          end

          if uwsm check may-start
              uwsm start default
          end
      '';

      functions = {
          fish_command_not_found = ''
              echo Command (set_color red -i) \'$argv[1]\' (set_color normal) not found
          '';

          fish_prompt = ''
              echo -n (set_color brblack) (prompt_pwd -d 3)
              echo -n (set_color cyan) ""
              echo -n (set_color green) ""
              echo -n (set_color magenta) " "
              set_color normal
          '';
      };

          plugins = [
              {
                name = "fasd";
                src = pkgs.fasd;      
              }

              {
                name = "done";
                src = pkgs.fishPlugins.done;
              }

              {
                name = "grc";
                src = pkgs.fishPlugins.grc;
              }
      ];
    };
}
