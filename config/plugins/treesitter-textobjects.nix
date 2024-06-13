{
  plugins.treesitter-textobjects = {
    enable = true;
    move = {
      enable = true;
    };
    select = {
      enable = true;
      keymaps = {
        "af" = {
          query = "@function.outer";
          desc = "[A]round [F]unction";
        };
        "if" = {
          query = "@function.inner";
          desc = "[I]nside [F]unction";
        };
        "ac" = {
          query = "@class.outer";
          desc = "[A]round [C]lass";
        };
        "ic" = {
          query = "@class.inner";
          desc = "[I]nside [C]lass";
        };
      };
    };
    swap.enable = true;
  };
}
