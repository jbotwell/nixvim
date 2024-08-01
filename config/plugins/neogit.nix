{
  keymaps = [
    {
      key = "<leader>gu";
      action = "<cmd>Neogit<cr>";
      options.desc = "[G]it [U]i";
    }
  ];

  plugins.neogit = {
    enable = true;
  };
}
