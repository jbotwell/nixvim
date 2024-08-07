{
  plugins.obsidian = {
    enable = true;

    settings = {
      ui.enable = false;

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
      options.desc = "Open Obsidian note";
    }
    {
      key = "<leader>on";
      action = "<cmd>ObsidianNew<cr>";
      options.desc = "Create new Obsidian note";
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
      action = "<cmd>ObsidianExtractNote<cr>";
      options.desc = "[O]bsidian[E]xtractNote";
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
      key = "<leader>oll";
      action = ":<C-u>'<,'>ObsidianLink<cr>";
      options.desc = "[O]bsidian[L]ink";
    }
    {
      key = "<leader>oln";
      action = ":<C-u>'<,'>ObsidianLinkNew<cr>";
      options.desc = "[O]bsidian[L]ink[N]ew";
    }
    {
      key = "<leader>ols";
      action = "<cmd>ObsidianLinks<cr>";
      options.desc = "[O]bsidian[L]ink[S]";
    }
  ];
}
