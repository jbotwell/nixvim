{
  plugins.persistence.enable = true;

  plugins.which-key.registrations = {
    "<leader>q" = "Persistence";
  };

  keymaps = [
    {
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load()<cr>";
      options.desc = "[L]oad";
    }
    {
      key = "<leader>qq";
      action = "<cmd>lua require('persistence').list()<cr>";
      options.desc = "List sessions";
    }
    {
      key = "<leader>qs";
      action = "<cmd>lua require('persistence').save()<cr>";
      options.desc = "[S]ave";
    }
  ];
}
