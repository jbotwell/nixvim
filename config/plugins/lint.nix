{pkgs, ...}: {
  plugins.lint.enable = true;

  plugins.lint.lintersByFt = {
    json = ["jsonlint"];
    markdown = ["vale"];
    sh = ["shellcheck"];
  };

  extraPackages = with pkgs; [shellcheck nodePackages.jsonlint vale];

  keymaps = [
    {
      key = "<leader>ln";
      action = "<cmd>lua require('lint').try_lint()<cr>";
      options.desc = "[L]i[N]t";
    }
  ];
}
