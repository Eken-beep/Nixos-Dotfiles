{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edvin = {
    isNormalUser = true;
    description = "Edvin Källström";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "edvin" ];
}
