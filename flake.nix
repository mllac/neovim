{
  description = "mellea's neovim nix flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixvim, flake-parts, ... }@inputs:
  
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux"
    ];

    perSystem = { pkgs, system, ... }: 
    let
      nixvim' = nixvim.legacyPackages.${system};
      nixvimLib = nixvim.lib.${system};

      nixvimModule = {
        inherit pkgs;

        module = import ./config;
      };

      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in {
      checks = {
        default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
      };

      packages = {
        default = nvim;
      };
    };
  };
}
