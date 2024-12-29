{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  
# Remember to set this manually when needing an update
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_6;
  #boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_6.override {
  #          argsOverride = {
  #              src = pkgs.fetchurl {
  #                  url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-6.8.5.tar.xz";
  #                  sha256 = "sha256-E4kj5dc3SLS9vptaC48236yfzBZ1OpIiko3GyWPv+ok=";
  #              };
  #              version = "6.8.5";
  #              modDirVersion = "6.8.5";
  #          };
  #      });

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
  services.zfs.autoScrub.enable = true;
 
  hardware = {
    graphics = {
        enable = true;
        enable32Bit = true;
    };
    bluetooth.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "Compootah";
}
