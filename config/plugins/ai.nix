{ inputs, pkgs, ... }: {
  extraPlugins = [
    pkgs.vimUtils.buildVimPlugin
    {
      name = "codegpt";
      src = pkgs.fetchFromGitHub {
        owner = "dpayne";
        repo = "CodeGPT.nvim";
        rev = "f2eed25f0f049105e451929a5a312a5f0c6bba7a";
        hash = pkgs.lib.fakeSha256;
      };
    }
  ];
}
