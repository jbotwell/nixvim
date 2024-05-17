{
  plugins.chadtree = {
    enable = true;
  };

  keymaps = [
    {
      key = "<leader>ft";
      action = "<cmd>CHADopen<cr>";
      options.desc = "[F]ile [T]ree";
    }
    {
      key = "<leader>ff";
      action = "<cmd>CHADopen<cr>";
      options.desc = "[F]ile [F]inder";
    }
    {
      key = "<leader>l";
      action = "<cmd>call setqflist([])<cr>";
      options.desc = "Clear Quickfix [L]ist";}
  ];
}
