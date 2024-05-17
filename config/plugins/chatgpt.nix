{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nui-nvim
    {
      plugin = ChatGPT-nvim;
      config = ''
        :lua << EOF
          require("chatgpt").setup({
            api_host_cmd = "echo https://openrouter.ai/api",
            api_key_cmd = "pass show openrouter",
            openai_params = {
              model = "google/gemini-pro-1.5",
              frequency_penalty = 0,
              presence_penalty = 0,
              max_tokens = 5000,
              temperature = 0,
              top_p = 1,
              n = 1
            },
            openai_edit_params = {
              model = "google/gemini-pro-1.5",
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
