{ pkgs, lib, ... }:
let 
  luaFiles = lib.lists.forEach [
      # All the files to build the lua config from, gets mapped with readFile to create a list of multi-line strings
      ./neovim-lua/vim.lua
      ./neovim-lua/lualine.lua
      ./neovim-lua/theme.lua
  ] builtins.readFile;

  luaConfig = lib.strings.concatMapStrings (x: x+"\n") luaFiles;
in {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ 
      lualine-nvim
      lualine-lsp-progress
      nvim-web-devicons
      nvim-tree-lua
      indent-blankline-nvim
      # bufferline

      telescope-nvim
      telescope-symbols-nvim
      telescope-project-nvim

      catppuccin-nvim

      dashboard-nvim

      delimitMate
      vim-illuminate
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context

      vimtex
      render-markdown-nvim
      
      vim-eunuch
      glow-nvim
    ];

    # Packages to expose to neovim, mostly language servers
    extraPackages = with pkgs; [
      nil
      haskell-language-server
      sumneko-lua-language-server
      nodePackages.bash-language-server
      perl
      ccls
      rust-analyzer
      lua54Packages.digestif
      jdt-language-server
      ocamlPackages.ocaml-lsp
      zls
    ];

    coc.enable = true;
    coc.settings = {
      "suggest.noselect" = true;
      "suggest.enablePreview" = true;
      "suggest.enablePreselect" = false;
      "suggest.disableKind" = true;

      "perl.Perl::LanguageServer.enable" = true;

      languageserver = {
        c = {
          command = "ccls";
          filetypes = [ "c" "cpp" "cuda" "objc" "objcpp" ];
          rootPatterns = [ ".ccls-root" "compile_commands.json" ];
          initializationOptions = {
            cache.directory = ".ccls-cache";
            client.snippetSupport = true;
          };
        };

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
          command = "nil";
          filetypes = [ "nix" ];
        };

        digestif = {
          command = "digestif";
          filetypes = ["tex" "plaintex" "contex"];
        };

                #perlnavigator = {
                #  command = "node";
                #  args = [ "~/projects/PerlNavigator/server/out/server.js" "--stdio" ];
                #  filetypes = [ "perl" ];
                #};

        rust = {
          command = "rust-analyzer";
          filetypes = [ "rust" ];
          rootPatterns = [ "Cargo.toml" ];
        };

        svelte = {
          ask-to-enable-ts-plugin = false;
          enable-ts-plugin = true;
          filetypes = [ "svelte" ];
        };

        ocaml = {
            command = "ocamllsp";
            filetypes = ["ocaml" "reason"];
        };

        zig = {
            command = "zls";
            filetypes = ["zig"];
        };
      };
    };

    withPython3 = true;
    viAlias = true;
    extraLuaConfig = luaConfig;
    extraConfig = ''
        let g:coc_global_extensions = [
            \ 'coc-java',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ 'coc-yaml',
            \ 'coc-vimtex',
            \ 'coc-perl',
            \ ]
    '';
  };
}
