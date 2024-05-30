{
  plugins.luasnip = {
    enable = true;
    fromLua = [
      {
        paths = ./lua/all.lua;
        lazyLoad = false;
      }
    ];
  };
}
