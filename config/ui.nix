{pkgs, ...}: {
  colorschemes.cyberdream.enable = true;

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
  };

  extraPlugins = with pkgs.vimPlugins; [
    vim-numbertoggle
    vim-devicons
    nvim-web-devicons
  ];

  extraPackages = with pkgs; [nerdfonts];
}
