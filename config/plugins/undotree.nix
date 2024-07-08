{
  keymaps = [
    {
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      options.desc = "[U]ndo Tree";
    }
  ];

  plugins = {
    undotree.enable = true;
  };
}
