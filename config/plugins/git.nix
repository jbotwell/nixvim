{
  plugins = {
    gitblame.enable = true;
    gitgutter.enable = true;
    gitignore = {
      enable = true;
      keymap = {
        key = "<leader>gi";
        options.desc = "gitignore";
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gb";
      action = "<cmd>GitBlameToggle<cr>";
      options.desc = "gitblame";
    }
    {
      key = "<leader>gg";
      action = "<cmd>GitGutterToggle<cr>";
      options.desc = "gitgutter";
    }
  ];

  globals = {
    # don't start it by default
    gitblame_enabled = false;
  };
}
