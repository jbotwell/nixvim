{
  plugins = {
    gitblame.enable = true;
    gitignore = {
      enable = true;
      keymap = {
        key = "<leader>gi";
        options.desc = "gitignore";
      };
    };
  };

  keymaps = [{
    key = "<leader>gb";
    action = "<cmd>GitBlameToggle<cr>";
    options.desc = "gitblame";
  }];
}
