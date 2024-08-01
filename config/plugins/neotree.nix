{
  plugins.neo-tree = {
    enable = true;
    enableGitStatus = true;
  };

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Neotree<cr>";
      options.desc = "[F]ile [F]inder";
    }
    {
      key = "<leader>cq";
      action = "<cmd>call setqflist([])<cr>";
      options.desc = "[C]lear [Q]uickfix List";
    }
  ];
}
