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
    ./plugins/simple.nix
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

  viAlias = true;
  vimAlias = true;
}
