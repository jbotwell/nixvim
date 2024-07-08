{
  imports = [
    ./autoCmd.nix
    ./plugins/chadtree.nix
    ./plugins/cmp.nix
    ./plugins/conform-nvim.nix
    ./plugins/dap.nix
    ./plugins/git.nix
    ./plugins/gp.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/luasnip.nix
    ./plugins/mkdnflow.nix
    ./plugins/mini.nix
    ./plugins/molten.nix
    ./plugins/navbuddy.nix
    ./plugins/neogit.nix
    ./plugins/obsidian.nix
    ./plugins/oil.nix
    ./plugins/persistence.nix
    ./plugins/project-nvim.nix
    ./plugins/simple.nix
    ./plugins/spider.nix
    ./plugins/tags.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/treesitter-textobjects.nix
    ./plugins/trouble.nix
    ./plugins/undotree.nix
    ./plugins/wtf.nix
    ./ui.nix
  ];

  clipboard.register = "unnamedplus";

  globals = {mapleader = " ";};

  extraConfigLuaPre = ''
    function InsertTimestamp()
      local timestamp = os.date("<%Y-%m-%d %H:%M:%S>")
      vim.api.nvim_put({timestamp}, 'c', true, true)
    end
  '';

  keymaps = [
    {
      key = "<leader>dn";
      action = "<cmd>lua InsertTimestamp()<cr>";
      options.desc = "[D]ate [N]ow";
    }
  ];

  viAlias = true;
  vimAlias = true;
}
