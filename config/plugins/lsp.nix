{
  plugins = {
    which-key.registrations = {
      "<leader>l" = {
        name = "[L]SP";
        f = "[F]ormat";
        i = "[I]mplementation";
        c = "[C]ode [A]ction";
        d = "[D]efinition";
        D = "[D]eclaration";
        r = "[R]eferences";
        h = "[H]over";
        a = "[A]ction";
        t = "[T]ype [D]efinition";
        sg = "[S]ignature [H]elp";
        sd = "[D]ocument [S]ymbol";
        sw = "[W]orkspace [S]ymbol";
      };
    };

    lsp = {
      enable = true;

      servers = {
        ast-grep.enable = true;
        csharp-ls.enable = true;
        lua-ls.enable = true;
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
