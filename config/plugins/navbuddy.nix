{
  plugins.navbuddy = {
    enable = true;
    lsp.autoAttach = true;
  };

  keymaps = [
    {
      key = "<leader>nb";
      action = "<cmd>Navbuddy<cr>";
      options.desc = "[N]av[B]uddy";
    }
  ];
}
