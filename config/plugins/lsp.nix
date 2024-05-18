{
  plugins = {
    lsp = {
      enable = true;

      servers = {
        ast-grep.enable = true;
        csharp-ls.enable = true;
        nixd.enable = true;
        nil_ls.enable = true;
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
          "<leader>lsg" = "signature_help";
          "<leader>lsd" = "document_symbol";
          "<leader>lsw" = "workspace_symbol";
        };
      };
    };

    lsp-format.enable = true;
  };
}
