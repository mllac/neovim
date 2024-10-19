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
    android = "aarch64-linux";

    a_pkgs
    = nixpkgs.legacyPackages.${android};

    a_nixvim'
    = nixvim.legacyPackages.${android};

    a_mod = {
      module = import ./config;

      inherit a_pkgs;
    };

    a_vim =
      a_nixvim'.makeNixvimWithModule a_mod;

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

    packages.${android} = {
      default = a_vim;
    };
  };
}
