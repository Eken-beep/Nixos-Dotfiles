{ config, pkgs, ... }:

{
  users.users.edvin = {
    isNormalUser = true;
    uid = 1000;
    description = "Edvin Källström";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "libvirtd" ];
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "edvin" ];
}
