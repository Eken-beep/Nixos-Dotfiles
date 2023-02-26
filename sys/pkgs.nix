{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim  
    wget
    libnotify
    killall
    zip
    gzip
    jdk17
    btop
    xdotool
    piper
    flameshot
    xterm
  ];

  # Fonts
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    liberation_ttf_v1
    fira-code
    fira-code-symbols
    dina-font
    proggyfonts
    font-awesome
    nerdfonts
    liberation_ttf_v1
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
    fira-code
  ];

  # System version no toucha
  system.stateVersion = "22.05";
}
