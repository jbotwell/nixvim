{pkgs, ...}: {
  plugins = {
    commentary.enable = true;
    conjure.enable = true;
    fzf-lua.enable = true;
    jupytext.enable = true;
    markdown-preview.enable = true;
    marks.enable = true;
    neotest.enable = true;
    nix-develop.enable = true;
    nix.enable = true;
    nvim-autopairs.enable = true;
    parinfer-rust.enable = true;
    sleuth.enable = true;
    spectre.enable = true;
    surround.enable = true;
    todo-comments.enable = true;
    which-key.enable = true;
    wilder.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [vim-sneak];

  extraPackages = with pkgs; [curl fd gnused ripgrep];
}
