{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = ''
      {
        timeout_ms = 500,
        lsp_fallback = true
      }
    '';
    formattersByFt = {
      python = ["isort" "black"];
      nix = ["alejandra"];
    };
  };

  extraPackages = with pkgs; [alejandra black isort];

  keymaps = [
    {
      key = "<leader>fm";
      action = "<cmd>lua require('conform').format()<cr>";
      options.desc = "[F]or[M]at";
    }
  ];
}
