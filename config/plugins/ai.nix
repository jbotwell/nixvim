{
  inputs,
  pkgs,
  ...
}: let
  parrot-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "parrot-nvim";
    src = inputs.parrot-nvim;
  };
  code-gpt = pkgs.vimUtils.buildVimPlugin {
    name = "code-gpt";
    src = inputs.code-gpt;
  };
in {
  keymaps = [
    {
      key = "<leader>cc";
      action = ":Chat ";
      options.desc = "Simple chat";
    }
    {
      key = "<leader>cu";
      action = "<cmd>ChatGPT<cr>";
      options.desc = "Chat with a UI";
    }
    {
      key = "<leader>ce";
      action = "<cmd>ChatGPTEditWithInstruction<cr>";
      options.desc = "ChatGPT Edit with Instruction";
    }
    {
      key = "<leader>ct";
      action = "<cmd>ChatGPTRun add_tests<cr>";
      options.desc = "ChatGPT add tests";
    }
    {
      key = "<leader>cs";
      action = "<cmd>ChatGPTRun summarize<cr>";
      options.desc = "ChatGPT summarize";
    }
    {
      key = "<leader>cd";
      action = "<cmd>ChatGPTRun docstring<cr>";
      options.desc = "ChatGPT add docstring";
    }
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
      key = "<leader>pt";
      action = "<cmd>PrtChatToggle<cr>";
      options.desc = "Parrot paste selection into target";
    }
    {
      key = "<leader>p*";
      action = "<cmd>PrtNew<cr>";
      options.desc = "Parrot open new chat";
    }
    {
      key = "<leader>pn";
      action = "<cmd>PrtChatNew<cr>";
      options.desc = "Parrot paste selection into new chat";
    }
    {
      key = "<leader>pi";
      action = "<cmd>PrtImplement<cr>";
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
  extraPackages = with pkgs.python312Packages; [tiktoken];
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = code-gpt;
      config = ''
        :lua << EOF
          require("codegpt.config")

          vim.g.codegpt_chat_completions_url = "https://openrouter.ai/api/v1/chat/completions"
          vim.g.codegpt_chat_api_key = os.getenv("OPENROUTER_API_KEY")
          vim.g.codegpt_global_commands_defaults = {
            model = "meta-llama/llama-3-70b-instruct:nitro",
            temperature = 0.3,
            max_tokens = 4096
          }
        EOF
      '';
    }
    {
      plugin = parrot-nvim;
      config = ''
        :lua << EOF
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
        EOF
      '';
    }
    nui-nvim
    {
      plugin = ChatGPT-nvim;
      config = ''
        :lua << EOF
          require("chatgpt").setup({
            api_host_cmd = "echo https://openrouter.ai/api",
            api_key_cmd = "pass show openrouter",
            openai_params = {
              model = "meta-llama/llama-3-70b-instruct:nitro",
              frequency_penalty = 0,
              presence_penalty = 0,
              max_tokens = 5000,
              temperature = 0,
              top_p = 1,
              n = 1
            },
            openai_edit_params = {
              model = "meta-llama/llama-3-70b-instruct:nitro",
              frequency_penalty = 0,
              presence_penalty = 0,
              temperature = 0,
              top_p = 1,
              n = 1
            },
            chat = {
              keymaps = {cycle_windows = "<C-b>"},
              welcome_message = "do the thing."
            },
          })
        EOF
      '';
    }
  ];
}
