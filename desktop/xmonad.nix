{ config, pkgs, ... }:

{
  services.xserver = {
    windowManager = {
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
          haskellPackages.xmonad-contrib
          haskellPackages.xmonad-extras
          haskellPackages.xmonad
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    polybar
    dunst
    xmobar
  ];

  environment = {
    # Variables
    variables = {
      EDITOR = "nvim";
    };
    pathsToLink = [ "/libexec" "/share/bash-completion" ];
    sessionVariables = rec {
      LIBVA_DRIVER_NAME="nvidia";
    };
  };
}
