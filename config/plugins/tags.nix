{pkgs, ...}: {
  plugins = {tagbar.enable = true;};

  keymaps = [
    {
      key = "<leader>tt";
      action = "<cmd>!ctags -R -f .git/tags .<cr>";
    }
    {
      key = "<leader>tb";
      action = "<cmd>TagbarToggle<cr>";
    }
  ];

  extraPackages = with pkgs; [universal-ctags];
}
