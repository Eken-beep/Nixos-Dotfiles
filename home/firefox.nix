{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        profiles."Edvin" = {
            name = "Edvin";
            id = 0;
            userChrome = builtins.readFile ./chrome.css;
        };
    };
}
