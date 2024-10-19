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

    system = "x86_64-linux";

    pkgs
    = nixpkgs.legacyPackages.${system};

    a_nixvim'
      = nixvim.legacyPackages.${android};

    nixvim'
      = nixvim.legacyPackages.${system};
    
    mod = {
      module = import ./config;

      inherit pkgs;
    };

    a_mod = let
      pkgs = nixpkgs.legacyPackages.${android};
    in {
      module = import ./config;

      inherit pkgs;
    };

    a_vim =
      a_nixvim'.makeNixvimWithModule a_mod;

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
