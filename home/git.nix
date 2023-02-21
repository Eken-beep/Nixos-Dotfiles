{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Edvin Källström";
    userEmail = "edvin.kallstrom@protonmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      safe.directory = "/etc/nixos";
    };
  };
}
