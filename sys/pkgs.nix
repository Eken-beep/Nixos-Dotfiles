{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim  
    wget
    libnotify
    killall
    zip
    gzip
    gcc
    btop
    xdotool
    piper
    flameshot
    xterm
    qmk
    qmk-udev-rules
    nautilus
    totem
    file-roller
    libimobiledevice
    ifuse
  ];

  programs.steam = {
    enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    jetbrains-mono
    dina-font
    proggyfonts
    font-awesome
    nerd-fonts.fira-code
    work-sans
    source-sans
    public-sans
    roboto
    roboto-mono
    roboto-slab
    go-font
    sudo-font
    hack-font
    freefont_ttf
    ttf_bitstream_vera
    jost
  ];

  # System version no toucha
  system.stateVersion = "22.05";
}
