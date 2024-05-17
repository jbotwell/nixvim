{ pkgs, ... }: {
  # Import all your configuration modules here
  imports = [
    ./plugins/chadtree.nix
    ./plugins/cmp.nix
    ./plugins/codeium.nix
    ./plugins/conform-nvim.nix
    ./plugins/git.nix
    ./plugins/mini.nix
    ./plugins/oil.nix
    ./plugins/tags.nix
    ./plugins/telescope.nix
    ./plugins/trouble.nix
    ./plugins/which-key.nix
    ./ui.nix
  ];

  clipboard.register = "unnamedplus";

  globals = { mapleader = " "; };

  autoCmd = [{
    event = [ "BufEnter" "BufWinEnter" ];
    pattern = [ "*c" "*h" ];
    command = "echo 'Entering a C file'";
  }];

  extraPlugins = with pkgs.vimPlugins; [ plenary-nvim ];

  extraPackages = with pkgs; [ ripgrep fd curl ];

  plugins = {
    commentary.enable = true;

    conjure.enable = true;

    markdown-preview.enable = true;

    neotest.enable = true;

    neo-tree.enable = true;

    nix.enable = true;

    nvim-autopairs.enable = true;

    parinfer-rust.enable = true;

    # qmk.enable = true;

    surround.enable = true;

    treesitter.enable = true;
    ts-autotag.enable = true;
    ts-context-commentstring.enable = true;
  };

  viAlias = true;
  vimAlias = true;
}
