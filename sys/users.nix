{ config, pkgs, ... }:

{
  users.users.edvin = {
    isNormalUser = true;
    description = "Edvin Källström";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "edvin" ];
}
