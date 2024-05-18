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
            openai = {
              api_key = os.getenv("OPENAI_API_KEY"),
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
