{ config, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  
  # TF2 needs 6.7 kernel, change back when they patch this crap. Valve are stupid or smth
  #boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_8.override {
            argsOverride = {
                src = pkgs.fetchurl {
                    url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-6.8.5.tar.xz";
                    sha256 = "sha256-E4kj5dc3SLS9vptaC48236yfzBZ1OpIiko3GyWPv+ok=";
                };
                version = "6.8.5";
                modDirVersion = "6.8.5";
            };
        });

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = true;
  services.zfs.autoScrub.enable = true;
 
  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    bluetooth.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "Compootah";
}
