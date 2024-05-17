{ pkgs, ... }: {
  # Import all your configuration modules here
  imports = [
    ./plugins/cmp.nix
    ./plugins/codeium.nix
    ./plugins/conform-nvim.nix
    ./plugins/git.nix
    ./plugins/oil.nix
    ./plugins/telescope.nix
    ./plugins/trouble.nix
  ];

  clipboard.register = "unnamedplus";

  colorschemes.cyberdream.enable = true;

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
  };

  globals = { mapleader = " "; };

  autoCmd = [{
    event = [ "BufEnter" "BufWinEnter" ];
    pattern = [ "*c" "*h" ];
    command = "echo 'Entering a C file'";
  }];

  extraPlugins = with pkgs.vimPlugins; [
    vim-numbertoggle
    vim-unimpaired
    vim-devicons
    nvim-web-devicons
    plenary-nvim
    vim-sexp-mappings-for-regular-people
    # chatgpt
    nui-nvim
    {
      plugin = ChatGPT-nvim;
      config = ''
        :lua << EOF
          require("chatgpt").setup({
            api_host_cmd = "echo https://openrouter.ai/api",
            api_key_cmd = "pass show openrouter",
            openai_params = {
              model = "google/gemini-pro-1.5",
              frequency_penalty = 0,
              presence_penalty = 0,
              max_tokens = 5000,
              temperature = 0,
              top_p = 1,
              n = 1
            },
            openai_edit_params = {
              model = "google/gemini-pro-1.5",
              frequency_penalty = 0,
              presence_penalty = 0,
              temperature = 0,
              top_p = 1,
              n = 1
            },
            chat = {
              keymaps = {cycle_windows = "<C-b>"},
              welcome_message = "do the thing."
            },
          })
        EOF
      '';
    }
  ];

  extraPackages = with pkgs; [ nerdfonts ripgrep fd curl ];

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
