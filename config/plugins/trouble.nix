{
  plugins.trouble.enable = true;

  plugins.trouble.keymaps = {
    "<leader>xx" = {
      action = "builtin";
      options.desc = "Toggle Trouble";
    };
  };

  keymaps = [
    {
      key = "<leader>xx";
      action = "<cmd>TroubleToggle<cr>";
    }
    {
      key = "<leader>xw";
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
    }
    {
      key = "<leader>xd";
      action = "<cmd>TroubleToggle document_diagnostics<cr>";
    }
    {
      key = "<leader>xl";
      action = "<cmd>TroubleToggle loclist<cr>";
    }
    {
      key = "<leader>xq";
      action = "<cmd>TroubleToggle quickfix<cr>";
    }
    {
      key = "<leader>xr";
      action = "<cmd>TroubleToggle lsp_references<cr>";
    }
  ];
}
