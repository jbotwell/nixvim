{
  plugins.persistence.enable = true;

  plugins.which-key.registrations = {
    "<leader>r" = "Pe[r]sistence";
  };

  keymaps = [
    {
      key = "<leader>rl";
      action = "<cmd>lua require('persistence').load()<cr>";
      options.desc = "[L]oad";
    }
    {
      key = "<leader>rp";
      action = "<cmd>lua require('persistence').load({ last = true })<cr>";
      options.desc = "Load [P]revious";
    }
    {
      key = "<leader>rr";
      action = "<cmd>lua require('persistence').list()<cr>";
      options.desc = "List sessions";
    }
    {
      key = "<leader>rs";
      action = "<cmd>lua require('persistence').save()<cr>";
      options.desc = "[S]ave";
    }
  ];
}
