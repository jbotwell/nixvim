{ pkgs, ... }: {
  plugins = {
    commentary.enable = true;
    conjure.enable = true;
    jupytext.enable = true;
    markdown-preview.enable = true;
    marks.enable = true;
    neotest.enable = true;
    nix-develop.enable = true;
    nix.enable = true;
    nvim-autopairs.enable = true;
    parinfer-rust.enable = true;
    # qmk.enable = true;
    surround.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [ vim-sneak ];

  extraPackages = with pkgs; [ ripgrep fd curl ];
}
