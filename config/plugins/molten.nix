{
  plugins.molten = {
    enable = true;
  };

  plugins.which-key.registrations = {
    "<leader>m" = "+[M]olten";
  };

  keymaps = [
    {
      key = "<leader>mi";
      action = "<cmd>MoltenInfo<cr>";
      options.desc = "[M]olten [I]nfo";
    }
    {
      key = "<leader>mS";
      action = "<cmd>MoltenInit<cr>";
      options.desc = "[M]olten [S]tart";
    }
    {
      key = "<leader>mg";
      action = "<cmd>MoltenGoto<cr>";
      options.desc = "[M]olten [G]oto";
    }
    {
      key = "<leader>mm";
      action = "<cmd>MoltenEvaluateLine<cr>";
      options.desc = "[M]olten Evaluate Line";
    }
    {
      key = "<leader>mo";
      action = "<cmd>MoltenEvaluateOperator<cr>";
      options.desc = "[M]olten Evaluate [O]perator";
    }
    {
      key = "<leader>mm";
      action = "<cmd><C-u>MoltenEvaluateVisual<cr>gv";
      options.desc = "[M]olten Evaluate Visual";
      mode = "v";
    }
    {
      key = "<leader>mr";
      action = "<cmd>MoltenReevaluateCell<cr>";
      options.desc = "[M]olten [R]e-evaluate Cell";
    }
    {
      key = "<leader>ms";
      action = "<cmd>MoltenShowOutput<cr>";
      options.desc = "[M]olten [s]how Output";
    }
  ];
}
