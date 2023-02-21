{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
 
  # Nvidia
  boot.initrd.kernelModules = [ "nvidia" ];
  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    nvidia.modesetting.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "Compootah";
}
