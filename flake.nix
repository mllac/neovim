{
  description = "mellea's neovim nix flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixvim, nixpkgs, ... }:
  let
    system = "x86_64-linux";

    pkgs
      = nixpkgs.legacyPackages.${system};
    nixvim'
      = nixvim.legacyPackages.${system};
    
    mod = {
      module = import ./config;

      inherit pkgs;
    };

    vim =
      nixvim'.makeNixvimWithModule mod;
  in {
    packages.${system} = {
      default = vim;
    };
  };
}
