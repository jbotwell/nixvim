{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./autoCmd.nix
    ./plugins/chadtree.nix
    ./plugins/cmp.nix
    ./plugins/codeium.nix
    ./plugins/conform-nvim.nix
    ./plugins/git.nix
    ./plugins/lsp.nix
    ./plugins/mini.nix
    ./plugins/oil.nix
    ./plugins/tags.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/which-key.nix
    ./ui.nix
  ];

  clipboard.register = "unnamedplus";

  globals = {mapleader = " ";};

  extraPlugins = with pkgs.vimPlugins; [vim-sneak];

  extraPackages = with pkgs; [ripgrep fd curl];

  plugins = {
    commentary.enable = true;

    conjure.enable = true;

    markdown-preview.enable = true;

    marks.enable = true;

    neotest.enable = true;

    nix.enable = true;

    nix-develop.enable = true;

    nvim-autopairs.enable = true;

    parinfer-rust.enable = true;

    # qmk.enable = true;

    surround.enable = true;
  };

  viAlias = true;
  vimAlias = true;
}
