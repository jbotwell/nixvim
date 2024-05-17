{ pkgs, ... }: {
  extraPlugins = [
    pkgs.vimUtils.buildVimPlugin
    {
      name = "parrot-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "frankroeder";
        repo = "parrot.nvim";
        rev = "master";
      };
    }
  ];
}
