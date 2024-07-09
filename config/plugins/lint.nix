{pkgs, ...}: {
  plugins.lint.enable = true;

  plugins.lint = {
    autoCmd = null;
    lintersByFt = {
      json = ["jsonlint"];
      markdown = ["vale"];
      nix = ["nix"];
      sh = ["shellcheck"];
    };
  };

  extraPackages = with pkgs; [shellcheck nodePackages.jsonlint vale];

  keymaps = [
    {
      key = "<leader>ln";
      action = "<cmd>lua require('lint').try_lint()<cr>";
      options.desc = "[L]i[N]t";
    }
    {
      key = "<leader>le";
      action = "<cmd>lua vim.api.nvim_buf_clear_namespace(0, 0, 0, -1)<cr>";
      options.desc = "[L]int [E]rase";
    }
  ];
}
