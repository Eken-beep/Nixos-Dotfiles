{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      lualine-nvim
      catppuccin-nvim
      surround 
      nvim-treesitter
      vimtex
      
      orgmode
      vim-eunuch 
      vim-nix 
      tagbar
      nerdtree
      haskell-vim

    ];

    withPython3 = true;

    viAlias = true;

    extraPackages = with pkgs; [
      rnix-lsp
      haskell-language-server
      sumneko-lua-language-server
      nodePackages.bash-language-server
      ccls
    ];

    coc.enable = true;
    coc.settings = {
      "suggest.noselect" = true;
      "suggest.enablePreview" = true;
      "suggest.enablePreselect" = false;
      "suggest.disableKind" = true;
      languageserver = {
        haskell = {
          command = "haskell-language-server-wrapper";
          args = [ "--lsp" ];
          rootPatterns = [
            "*.cabal"
            "stack.yaml"
            "cabal.project"
            "package.yaml"
            "hie.yaml"
          ];
          filetypes = [ "haskell" "lhaskell" ];
        };
        
        lua = {
          command = "lua-language-server";
          filetypes = [ "lua" ];
        };

        bash = {
          command = "bash-language-server";
          args = [ "start" ];
          filetypes = [ "shell" ];
        };

        nix = {
          command = "rnix-lsp";
          filetypes = [ "nix" ];
        };

        rust = {
          command = "rls";
          filetypes = [ "rust" ];
        };

        c = {
          command = "ccls";
          filetypes = [ "c" "cpp" ];
        };
      };
    };
    extraConfig = "lua << EOF\n" + builtins.readFile ./other/init.lua + "\nEOF";
  };
}
