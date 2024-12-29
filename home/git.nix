{ pkgs-old, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs-old.git;
    userName = "Edvin Källström";
    userEmail = "edvin.kallstrom@protonmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs-old.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      safe.directory = "/etc/nixos";
    };
  };
}
