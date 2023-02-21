{ lib, config, pkgs, commands, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ed  = "nvim";
      ll = "ls -la";
      hmrs = "home-manager switch";
      "..." = "cd ../..";
      pkgdir = "/home/edvin/.config/nixpkgs/";
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
