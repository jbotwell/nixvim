{
  inputs,
  pkgs,
  ...
}: let
  parrot-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "parrot-nvim";
    src = inputs.parrot-nvim;
  };
  model-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "model-nvim";
    src = inputs.model-nvim;
  };
in {
  keymaps = [
    {
      key = "<leader>pa";
      action = ":PrtAgent ";
      options.desc = "Parrot Select agent";
    }
    {
      key = "<leader>pp";
      action = ":PrtProvider ";
      options.desc = "Parrot Select provider";
    }
    {
      key = "<leader>p*";
      action = "<cmd>PrtNew<cr>";
      options.desc = "Parrot new chat command prompt";
    }
    {
      key = "<leader>pn";
      action = ":<C-u>'<,'>PrtChatNew<cr>";
      options.desc = "Parrot paste selection into new chat";
      mode = "v";
    }
    {
      key = "<leader>pn";
      action = "<cmd>PrtChatNew<cr>";
      options.desc = "Parrot open new chat";
      mode = "n";
    }
    {
      key = "<leader>pt";
      action = ":<C-u>'<,'>PrtChatToggle<cr>";
      options.desc = "Parrot paste selection into new chat";
      mode = "v";
    }
    {
      key = "<leader>pt";
      action = "<cmd>PrtChatToggle<cr>";
      options.desc = "Parrot paste selection into new chat";
      mode = "n";
    }
    {
      key = "<leader>pi";
      action = ":<C-u>'<,'>PrtImplement<cr>";
      options.desc = "Implement selected comment/instruction";
    }
    {
      key = "<leader>ps";
      action = "<cmd>PrtStop<cr>";
      options.desc = "Stop Parrot Response";
    }
    {
      key = "<leader>pr";
      action = "<cmd>PrtChatRespond<cr>";
      options.desc = "Trigger Parrot Chat Response";
    }
    {
      key = "<leader>pf";
      action = "<cmd>PrtChatFinder<cr>";
      options.desc = "Parrot Chat Finder";
    }
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
  plugins = {
    wtf = {
      enable = true;
      openaiModelId = "gpt-4o";
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    parrot-nvim
    model-nvim
  ];
  extraConfigLuaPost = ''
    require("parrot").setup {
      providers = {
        pplx = {
          api_key = os.getenv("PPLX_API_KEY"),
        },
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
        },
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
        },
      },
    }
  '';
}
