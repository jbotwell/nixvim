{
  imports = [
    ./ui.nix
  ];

  # lisp stuff
  plugins.conjure.enable = true;
  plugins.parinfer-rust.enable = true;
  plugins.vim-slime = {
    enable = true;
    settings = {
      target = "zellij";
    };
  };

  # which-key
  plugins.which-key.enable = true;

  # treesitter
  plugins = {
    treesitter.enable = true;
    ts-autotag.enable = true;
    ts-context-commentstring.enable = true;
  };

  # obsidian
  plugins.obsidian = {
    enable = true;

    settings = {
      ui.enable = false;

      note_id_func = ''
        function(title)
          local suffix = title or ""
          local datetime = os.date("%Y%m%d%H%M%S")
          if title == nil then
            return datetime .. "-" .. suffix
          else
            return datetime
          end
        end
      '';

      workspaces = [
        {
          name = "ob";
          path = "~/ob";
        }
      ];

      daily_notes.template = "daily.md";

      picker.name = "telescope.nvim";

      follow_url_func = ''
         function(url)
           vim.fn.jobstart({"xdg-open", url})
        end
      '';

      templates = {
        subdir = "templates";
        time_format = "%H:%M:%S";
      };
    };
  };

  keymaps = [
    {
      key = "<leader>oo";
      action = "<cmd>Obsidian Open<cr>";
      options.desc = "[O]bsidian[O]pen (in Obsidian)";
    }
    {
      key = "<leader>oc";
      action = "<cmd>ObsidianNew<cr>";
      options.desc = "[O]bsidian[C]reate new note";
    }
    {
      key = "<leader>oq";
      action = "<cmd>ObsidianQuickSwitch<cr>";
      options.desc = "[O]bsidian[Q]uickSwitch";
    }
    {
      key = "<leader>of";
      action = "<cmd>ObsidianFollowLink<cr>";
      options.desc = "[O]bsidian[F]ollowLink";
    }
    {
      key = "<leader>ob";
      action = "<cmd>ObsidianBacklinks<cr>";
      options.desc = "[O]bsidian[B]acklinks";
    }
    {
      key = "<leader>od";
      action = "<cmd>ObsidianToday<cr>";
      options.desc = "[O]bsidianTo[D]ay";
    }
    {
      key = "<leader>oe";
      action = ":<C-u>'<,'>ObsidianExtractNote<cr>";
      options.desc = "[O]bsidian[E]xtractNote";
    }
    {
      key = "<leader>or";
      action = "<cmd>ObsidianRename<cr>";
      options.desc = "[O]bsidian[R]ename";
    }
    {
      key = "<leader>os";
      action = "<cmd>ObsidianSearch<cr>";
      options.desc = "[O]bsidian[S]earch";
    }
    {
      key = "<leader>ot";
      action = "<cmd>ObsidianTemplate<cr>";
      options.desc = "[O]bsidian[T]emplate";
    }
    {
      key = "<leader>oi";
      action = ":<C-u>'<,'>ObsidianLink<cr>";
      options.desc = "[O]bsidian[I]nsertLink";
    }
    {
      key = "<leader>on";
      action = ":<C-u>'<,'>ObsidianLinkNew<cr>";
      options.desc = "[O]bsidian[N]ewLink";
    }
    {
      key = "<leader>ol";
      action = "<cmd>ObsidianLinks<cr>";
      options.desc = "[O]bsidian[L]inks";
    }
    {
      key = "<leader>dn";
      action = "<cmd>lua InsertTimestamp()<cr>";
      options.desc = "[D]ate [N]ow";
    }
  ];

  # telescope
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>sb" = {
        action = "buffers";
        options.desc = "[S]earch [B]uffers";
      };
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
      "<leader>sp" = {
        action = "projects";
        options.desc = "[S]earch [P]rojects";
      };
    };
    # See `:help telescope` and `:help telescope.setup()`
  };

  clipboard.register = "unnamedplus";

  globals = {
    mapleader = " ";
  };

  extraConfigLuaPre = ''
    function InsertTimestamp()
      local timestamp = os.date("<%Y-%m-%d %H:%M:%S>")
      vim.api.nvim_put({timestamp}, 'c', true, true)
    end
  '';
}
