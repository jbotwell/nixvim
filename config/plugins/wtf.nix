{
  plugins = {
    wtf = {
      enable = true;
      # use gpt-4o; api key is env var
      openaiModelId = "gpt-4o";
    };
  };

  keymaps = [
    {
      key = "<leader>wtf";
      action = "<cmd>Wtf<cr>";
      options.desc = "WTF";
    }
    {
      key = "<leader>wts";
      action = "<cmd>WtfSearch perplexity<cr>";
      options.desc = "WTF Search";
    }
  ];
}
