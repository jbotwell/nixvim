{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        stop_after_first = false;
      };
      formatters_by_ft = {
        lua = ["stylua"];
        python = ["isort" "black"];
        nix = ["alejandra"];
        fs = ["fantomas"];
        cs = ["csharpier"];
      };
    };
  };

  extraPackages = with pkgs; [alejandra black csharpier fantomas isort stylua];

  keymaps = [
    {
      key = "<leader>fm";
      action = "<cmd>lua require('conform').format()<cr>";
      options.desc = "[F]or[M]at";
    }
  ];
}
