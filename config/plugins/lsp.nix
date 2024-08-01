{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;

      servers = {
        ast-grep.enable = true;
        csharp-ls.enable = true;
        fsautocomplete.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
          "<leader>q" = "setloclist";
          "<leader>e" = "open_float";
        };

        lspBuf = {
          "<leader>lf" = "format";
          "<leader>li" = "implementation";
          "<leader>lc" = "rename";
          "<leader>ld" = "definition";
          "<leader>lD" = "declaration";
          "<leader>lr" = "references";
          "<leader>lh" = "hover";
          "<leader>la" = "code_action";
          "<leader>lt" = "type_definition";
          "<leader>lsh" = "signature_help";
          "<leader>lsd" = "document_symbol";
          "<leader>lsw" = "workspace_symbol";
        };
      };
    };

    lsp-format.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [Ionide-vim];
  extraPackages = with pkgs; [dotnetCorePackages.dotnet_8.sdk];

  keymaps = [
    {
      mode = "n";
      key = "<leader>ib";
      action = "<cmd>FsiEvalBuffer<cr>";
      options.desc = "[I]onide Eval [B]uffer";
    }
    {
      mode = "n";
      key = "<leader>is";
      action = "<cmd>FsiShow<cr>";
      options.desc = "[I]onide [S]how";
    }
    {
      mode = "n";
      key = "<leader>ir";
      action = "<cmd>FsiReset<cr>";
      options.desc = "[I]onide [R]eset";
    }
  ];
}
