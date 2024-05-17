{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./ui.nix
    ./plugins/cmp.nix
    ./plugins/codeium.nix
    ./plugins/conform-nvim.nix
    ./plugins/git.nix
    ./plugins/oil.nix
    ./plugins/telescope.nix
    ./plugins/trouble.nix
  ];

  clipboard.register = "unnamedplus";

  globals = {mapleader = " ";};

  autoCmd = [
    {
      event = ["BufEnter" "BufWinEnter"];
      pattern = ["*c" "*h"];
      command = "echo 'Entering a C file'";
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [vim-unimpaired plenary-nvim];

  extraPackages = with pkgs; [ripgrep fd curl];

  keymaps = [
    {
      key = "<leader>nn";
      action = "<cmd>set number!<cr>";
      options.desc = "Toggle line numbers";
    }
    {
      key = "<leader>nr";
      action = "<cmd>set relativenumber!<cr>";
      options.desc = "Toggle relative line numbers";
    }
  ];

  plugins = {
    # Theming
    lualine = {
      enable = true;
      theme = "cyberdream";
    };

    bufferline.enable = true;

    commentary.enable = true;

    conjure.enable = true;

    markdown-preview.enable = true;

    mini.enable = true;

    neotest.enable = true;

    neo-tree.enable = true;

    nix.enable = true;

    nvim-autopairs.enable = true;

    parinfer-rust.enable = true;

    # qmk.enable = true;

    rainbow-delimiters.enable = true;

    surround.enable = true;

    treesitter.enable = true;

    which-key.enable = true;
  };

  viAlias = true;
  vimAlias = true;
}
