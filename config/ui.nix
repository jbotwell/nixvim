{ pkgs, ... }:
{
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

  extraPackages = with pkgs; [ nerdfonts ];

  plugins.rainbow-delimiters.enable = true;

  keymaps = [
    {
      key = "<leader>nn";
      action = "<cmd>set number!<cr>";
      options.desc = "Toggle line numbers";
    }
    {
      key = "<leader>nr";
      action = "<cmd>set relativenumber!<cr>";
      options.desc = "Toggle relative line numbers";
    }
  ];
}
