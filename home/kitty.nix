{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.fira-code;
      name = "FiraCode";
      size = 12;
    };
    
    theme = "Catppuccin-Mocha";
    # settings = {
    #   setting
    # };

    extraConfig = ''
      XDG_CURRENT_DESKTOP=GNOME
    '';

  };
}
