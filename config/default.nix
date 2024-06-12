{
  imports = [
    ./autoCmd.nix
    ./plugins/chadtree.nix
    ./plugins/cmp.nix
    ./plugins/conform-nvim.nix
    ./plugins/dap.nix
    ./plugins/git.nix
    ./plugins/lsp.nix
    ./plugins/luasnip.nix
    ./plugins/mini.nix
    ./plugins/neogit.nix
    ./plugins/obsidian.nix
    ./plugins/oil.nix
    ./plugins/parrot.nix
    ./plugins/project-nvim.nix
    ./plugins/simple.nix
    ./plugins/tags.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/vim-ai.nix
    ./ui.nix
  ];

  clipboard.register = "unnamedplus";

  globals = {mapleader = " ";};

  viAlias = true;
  vimAlias = true;
}
