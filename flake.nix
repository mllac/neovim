{
  description = "mellea's neovim nix flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    fenix = {
      url = "github:nix-community/fenix";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { nixvim, nixpkgs, fenix, ... }:
  let
    system = "x86_64-linux";

    pkgs
      = nixpkgs.legacyPackages.${system};
    nixvim'
      = nixvim.legacyPackages.${system};
    
    mod = {
      module = import ./config;

      extraSpecialArgs = {
        fenix = fenix;
      };

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
