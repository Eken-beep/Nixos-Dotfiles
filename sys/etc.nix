{ config, pkgs, lib, ... }:

{
  # Something
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  networking = {
    hostId = "356ffb56";
    firewall.checkReversePath = "loose";
    wireguard.enable = true;
    iproute2.enable = true;
  };

  # Unfree software and flakes
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # extra Services
  services = {
    gnome = {
        gnome-keyring.enable = true;
        localsearch.enable = true;
    };

    dbus.enable = true;
    openssh.enable = true;
    usbmuxd.enable = true;

    udev.packages = with pkgs; [ gnome-settings-daemon ];
    flatpak.enable = true;
    ratbagd.enable = true;

    resolved.enable = true;
    mullvad-vpn.enable = true;
  };

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["edvin"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
