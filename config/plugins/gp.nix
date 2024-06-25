{
  inputs,
  pkgs,
  ...
}: let
  gp = pkgs.vimUtils.buildVimPlugin {
    name = "gp";
    src = inputs.gp;
  };
in {
  plugins.which-key.registrations."<leader>a" = "+[A]i";
  plugins.which-key.registrations."<leader>aw" = "+[A]i [W]hisper";

  keymaps = [
    {
      key = "<leader>aa";
      action = ":GpAgent ";
      options.desc = "[A]i [A]gent";
    }
    {
      key = "<leader>ai";
      action = "<cmd>GpImage<cr>";
      options.desc = "[A]i [I]mage";
    }
    {
      key = "<leader>ac";
      action = "<cmd>GpChatToggle popup<cr>";
      options.desc = "[A]i [C]hat";
    }
    {
      key = "<leader>ac";
      action = ":<C-u>'<,'>GpChatToggle popup<cr>";
      options.desc = "[A]i [C]hat";
      mode = "v";
    }
    {
      key = "<leader>av";
      action = "<cmd>GpChatPaste<cr>";
      options.desc = "[A]i Chat [Y]ank";
    }
    {
      key = "<leader>av";
      action = ":<C-u>'<,'>GpChatPaste<cr>";
      options.desc = "[A]i Chat [Y]ank";
      mode = "v";
    }
    {
      key = "<leader>af";
      action = "<cmd>GpChatFinder<cr>";
      options.desc = "[A]i [C]hat";
    }
    {
      key = "<leader>ar";
      action = "<cmd>GpRewrite<cr>";
      options.desc = "[A]i [R]ewrite";
    }
    {
      key = "<leader>ar";
      action = ":<C-u>'<,'>GpRewrite<cr>";
      options.desc = "[A]i [R]ewrite";
      mode = "v";
    }
    {
      key = "<leader>an";
      action = "<cmd>GpAppend<cr>";
      options.desc = "[A]i Write [N]ext Line";
    }
    {
      key = "<leader>an";
      action = ":<C-u>'<,'>GpAppend<cr>";
      options.desc = "[A]i Write [N]ext Line";
      mode = "v";
    }
    {
      key = "<leader>ap";
      action = "<cmd>GpPrepend<cr>";
      options.desc = "[A]i Write [P]revious Line";
    }
    {
      key = "<leader>ap";
      action = ":<C-u>'<,'>GpPrepend<cr>";
      options.desc = "[A]i Write [P]revious Line";
      mode = "v";
    }
    {
      key = "<leader>ad";
      action = "<cmd>GpImplement<cr>";
      options.desc = "[A]i Implement ([D]o)";
    }
    {
      key = "<leader>ad";
      action = ":<C-u>'<,'>GpImplement<cr>";
      options.desc = "[A]i Implement ([D]o)";
      mode = "v";
    }
    {
      key = "<leader>aww";
      action = "<cmd>GpWhisper<cr>";
      options.desc = "[A]i [W]hisper";
    }
    {
      key = "<leader>awr";
      action = "<cmd>GpWhisperRewrite<cr>";
      options.desc = "[A]i [W]hisper [R]ewrite";
    }
    {
      key = "<leader>awr";
      action = ":<C-u>'<,'>GpWhisperRewrite<cr>";
      options.desc = "[A]i [W]hisper [R]ewrite";
      mode = "v";
    }
    {
      key = "<leader>awn";
      action = "<cmd>GpWhisperAppend<cr>";
      options.desc = "[A]i [W]hisper Write [N]ext Line";
    }
    {
      key = "<leader>awn";
      action = ":<C-u>'<,'>GpWhisperAppend<cr>";
      options.desc = "[A]i [W]hisper Write [N]ext Line";
      mode = "v";
    }
  ];

  extraPlugins = [
    gp
  ];

  extraPackages = [
    (pkgs.sox.override
      {
        enableLame = true;
      })
  ];

  extraConfigLuaPost = builtins.readFile ./lua/gp.lua;
}
