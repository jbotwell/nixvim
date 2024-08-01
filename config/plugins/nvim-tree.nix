{
  plugins.nvim-tree.enable = true;

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>NvimTreeToggle<cr>";
      options.desc = "[F]ile [F]inder";
    }
    {
      key = "<leader>fc";
      action = "<cmd>NvimTreeFindFile<cr>";
      options.desc = "[F]ile [C]urrent";
    }
  ];
}
