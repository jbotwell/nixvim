{
  plugins.luasnip = {
    enable = true;
    fromLua = [
      {
        # note - snippets should be placed in files named for filetype
        # e.g. - nix.lua in the directory below would contain nix snippets
        # see samples for structure
        paths = ./lua/snips;
      }
    ];
  };
}
