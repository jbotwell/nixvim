{
  plugins.luasnip = {
    enable = true;
    fromLua = [
      {
        paths = ./lua/nix.lua;
      }
    ];
  };
}
