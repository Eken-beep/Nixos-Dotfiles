{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    colors = {
      bg = "#1e1e2e";
      "bg+" = "#313244";
      spinner = "#f5e0dc";
      hl = "#f38ba8";
      fg = "#cdd6f4";
      "fg+" = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      prompt = "#cba6f7";
    };
  };
}
