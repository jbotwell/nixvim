{
  keymaps = [
    {
      key = "<leader>gu";
      action = "<cmd>Neogit<cr>";
      options.desc = "[G]it [U]i";
    }
  ];

  plugins.which-key.registrations."<leader>g" = "[G]it";

  plugins.neogit = {
    enable = true;
  };
}
