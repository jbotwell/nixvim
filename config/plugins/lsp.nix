{
  plugins = {
    lsp = {
      enable = true;

      servers = {
        nixd.enable = true;
        nil_ls.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>k" = {
            action = "goto_prev";
            options.desc = "Go to next diagnostic";
          };
          "<leader>j" = {
            action = "goto_next";
            options.desc = "Go to next diagnostic";
          };
        };

        lspBuf = {
          "<leader>lf" = {
            action = "format";
            options.desc = "Format buffer";
          };
          "<leader>lrn" = {
            action = "rename";
            options.desc = "Rename";
          };
          "<leader>ld" = {
            action = "definition";
            options.desc = "Go to definition";
          };
          "<leader>lD" = {
            action = "declaration";
            options.desc = "Go to declaration";
          };
          "<leader>lrf" = {
            action = "references";
            options.desc = "Get references";
          };
          "<leader>lh" = {
            action = "hover";
            options.desc = "Show hover information";
          };
          "<leader>lca" = {
            action = "code_action";
            options.desc = "Show code actions";
          };
          "<leader>lsd" = {
            action = "document_symbol";
            options.desc = "Show document symbols";
          };
          "<leader>lsw" = {
            action = "workspace_symbol";
            options.desc = "Show workspace symbols";
          };
          "<leader>lt" = {
            action = "type_definition";
            options.desc = "Go to type definition";
          };
          "<leader>lsg" = {
            action = "signature_help";
            options.desc = "Show signature help";
          };
        };
      };
    };

    lsp-format.enable = true;
  };
}
