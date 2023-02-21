{ pkgs, ... }:

{
  services.picom = {
      enable = true;

      inactiveOpacity = 0.50;
      activeOpacity = 0.90;

      fade = true;
      fadeDelta = 10;
      fadeSteps = [0.015 1.0];

      backend = "glx";
      
      opacityRules = [
          "100:class_g   *?= 'Firefox'" 
          "100:class_g   *?= 'Minecraft* 1.18.2'" 
          "100:class_g   *?= 'VirtualBox Machine'"
          "75:class_g    *?= 'discord'" 
      ];

      settings = {
          blur = {
              method = "dual_kawase";
              size = 10;
              deviation = 5.0;
          };
          
          corner-radius = 12;
          round-borders = 1;
          rounded-corners-exclude = [
              "class_g = 'Dunst'"
              "window_type = 'dock'"
          ];
      };
  };
}
