{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [./plugins/conform-nvim.nix ./plugins/cmp.nix ./plugins/codeium.nix];

  clipboard.register = "unnamedplus";

  colorschemes.cyberdream.enable = true;

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
  };

  globals = {mapleader = " ";};

  autoCmd = [
    {
      event = ["BufEnter" "BufWinEnter"];
      pattern = ["*c" "*h"];
      command = "echo 'Entering a C file'";
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    vim-unimpaired
    vim-numbertoggle
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

  extraPackages = with pkgs; [nerdfonts ripgrep fd curl];

  keymaps = [
    {
      key = "<leader>nn";
      action = "<cmd>set number!<cr>";
      options.desc = "Toggle line numbers";
    }
    {
      key = "<leader>nr";
      action = "<cmd>set relativenumber!<cr>";
    }
    # trouble
    {
      key = "<leader>xx";
      action = "<cmd>TroubleToggle<cr>";
    }
    {
      key = "<leader>xw";
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
    }
    {
      key = "<leader>xd";
      action = "<cmd>TroubleToggle document_diagnostics<cr>";
    }
    {
      key = "<leader>xl";
      action = "<cmd>TroubleToggle loclist<cr>";
    }
    {
      key = "<leader>xq";
      action = "<cmd>TroubleToggle quickfix<cr>";
    }
    {
      key = "<leader>xr";
      action = "<cmd>TroubleToggle lsp_references<cr>";
    }
    # end trouble
  ];

  plugins = {
    # Theming
    lualine = {
      enable = true;
      theme = "cyberdream";
    };

    bufferline.enable = true;

    conjure.enable = true;

    gitblame.enable = true;

    gitignore = {
      enable = true;
      keymap = "<leader>gi";
    };

    markdown-preview.enable = true;

    mini.enable = true;

    neotest.enable = true;

    neo-tree.enable = true;

    nix.enable = true;

    nvim-autopairs.enable = true;

    oil = {
      enable = true;
      settings = {
        columns = ["icon"];
        keymaps = {
          "<C-c>" = false;
          "<C-l>" = false;
          "<C-r>" = "actions.refresh";
          "<leader>qq" = "actions.close";
          "y." = "actions.copy_entry_path";
        };
        skip_confirm_for_simple_edits = true;
        view_options = {show_hidden = false;};
        win_options = {
          concealcursor = "ncv";
          conceallevel = 3;
          cursorcolumn = false;
          foldcolumn = "0";
          list = false;
          signcolumn = "no";
          spell = false;
          wrap = false;
        };
      };
    };

    parinfer-rust.enable = true;

    # qmk.enable = true;

    rainbow-delimiters.enable = true;

    surround.enable = true;

    telescope = {
      enable = true;

      keymaps = {
        # NOTE: if you don't care about descriptions (i.e. if you are not using the `which-key` plugin),
        # you can simply write str-str mappings:
        # Ex: "<leader>sh" = "help_tags";
        "<leader>sh" = {
          action = "help_tags";
          options.desc = "[S]earch [H]elp";
        };
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "[S]earch [K]eymaps";
        };
        "<leader>sf" = {
          action = "find_files";
          options.desc = "[S]earch [F]iles";
        };
        "<leader>ss" = {
          action = "builtin";
          options.desc = "[S]earch [S]elect Telescope";
        };
        "<leader>sw" = {
          action = "grep_string";
          options.desc = "[S]earch current [W]ord";
        };
        "<leader>sg" = {
          action = "live_grep";
          options.desc = "[S]earch by [G]rep";
        };
        "<leader>sd" = {
          action = "diagnostics";
          options.desc = "[S]earch [D]iagnostics";
        };
        "<leader>sr" = {
          action = "resume";
          options.desc = "[S]earch [R]esume";
        };
        "<leader>s." = {
          action = "oldfiles";
          options.desc = "[S]earch Recent Files ('.' for repeat)";
        };
        "<leader><leader>" = {
          action = "buffers";
          options.desc = "[ ] Find existing buffers";
        };
      };
      # See `:help telescope` and `:help telescope.setup()`
    };

    trouble.enable = true;

    treesitter.enable = true;

    which-key.enable = true;
  };

  viAlias = true;
  vimAlias = true;
}
