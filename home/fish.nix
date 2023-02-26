{ lib, config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ll = "ls -la";
      "..." = "cd ../..";
    };

    shellInit = "neofetch";

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
