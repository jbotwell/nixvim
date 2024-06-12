{
  inputs,
  pkgs,
  ...
}: let
  vim-ai = pkgs.vimUtils.buildVimPlugin {
    name = "vim-ai";
    src = inputs.vim-ai;
  };
in {
  plugins.which-key.registrations."<leader>a" = "+[A]i";

  plugins = {
    wtf = {
      enable = true;
      openaiModelId = "gpt-4o";
    };
  };

  extraPlugins = [
    vim-ai
  ];

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
    {
      key = "<leader>ai";
      action = ":<C-u>'<,'>AI ";
      options.desc = "[AI] Complete selection";
      mode = "v";
    }
    {
      key = "<leader>ae";
      action = ":<C-u>'<,'>AIEdit ";
      options.desc = "[A]I [E]dit selection";
      mode = "v";
    }
    {
      key = "<leader>ac";
      action = ":<C-u>'<,'>AIChat ";
      options.desc = "[A]I [C]hat selection";
      mode = "v";
    }
    {
      key = "<leader>ai";
      action = ":AI ";
      options.desc = "[AI] Complete line";
      mode = "n";
    }
    {
      key = "<leader>ae";
      action = ":AIEdit ";
      options.desc = "[A]I [E]dit line";
      mode = "n";
    }
    {
      key = "<leader>ac";
      action = ":AIChat ";
      options.desc = "[A]I [C]hat line";
      mode = "n";
    }
  ];

  extraConfigVim = ''
    let initial_prompt =<< trim END
    >>> system

    You are going to play a role of a completion engine with following parameters:
    Task: Provide compact code/text completion, generation, transformation or explanation
    Topic: general programming and text editing
    Style: Plain result without any commentary, unless commentary is necessary
    Audience: Users of text editor and programmers that need to transform/generate text
    END

    let g:vim_ai_complete = {
    \  "engine": "chat",
    \  "options": {
    \    "model": "gpt-4o",
    \    "endpoint_url": "https://api.openai.com/v1/chat/completions",
    \    "max_tokens": 0,
    \    "temperature": 0.1,
    \    "request_timeout": 20,
    \    "enable_auth": 1,
    \    "selection_boundary": "",
    \    "initial_prompt": initial_prompt,
    \  },
    \}

    let g:vim_ai_complete = chat_engine_config
    let g:vim_ai_edit = chat_engine_config
  '';
}
