{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
  services.zfs.autoScrub.enable = true;
 
  # Nvidia
  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    bluetooth.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "Compootah";
}
