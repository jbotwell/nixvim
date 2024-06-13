{
  plugins.lint.enable = true;

  keymaps = [
    {
      key = "<leader>ln";
      action = "<cmd>lua require('lint').try_lint()<cr>";
      options.desc = "[L]i[N]t";
    }
  ];
}
