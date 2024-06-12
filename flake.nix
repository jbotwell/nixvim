{
  description = "John's nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    parrot-nvim = {
      url = "github:frankroeder/parrot.nvim";
      flake = false;
    };
    vim-ai = {
      url = "github:madox2/vim-ai";
      flake = false;
    };
  };

  outputs = {
    nixvim,
    flake-parts,
    nixpkgs,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default =
            nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        # run nvim with `nix run`
        packages.default = nvim;

        formatter = pkgs.alejandra;
      };
    };
}
