{
  description = "mellea's neovim nix flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixvim, nixpkgs, ... }: 
  let
    system = "x86_64-linux";

    nixvim' = nixvim.legacyPackages.${system};
    pkgs = nixpkgs.legacyPackages.${system};
    
    mod = {
      inherit pkgs;

      module = import ./config;

      extraSpecialArgs = {

      };
    };

    vim =
      nixvim'.makeNixvimWithModule mod;
  in {
    packages = {
      default = vim;
    };
  };
}
