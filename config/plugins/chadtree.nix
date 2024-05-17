{
  plugins.chadtree = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>CHADopen<cr>";
      options.desc = "[F]ile [F]inder";
    }
    {
      key = "<leader>cq";
      action = "<cmd>call setqflist([])<cr>";
      options.desc = "[C]lear [Q]uickfix List";
    }
  ];
}
