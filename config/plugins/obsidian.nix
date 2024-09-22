{
  plugins.obsidian = {
    enable = true;

    settings = {
      ui.enable = false;

      workspaces = [
        {
          name = "ob";
          path = "~/ob";
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
  ];
}
