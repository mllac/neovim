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

    nixvim' = nixvim.legacyPackages.${system};
    pkgs = nixpkgs.legacyPackages.${system};
    
    mod = {
      inherit pkgs;

      module = {

      };

      extraSpecialArgs = {

      };
    };

    vim =
      nixvim'.makeNixvimWithModule mod;
  in {
    packages.${system} = {
      default = vim;
    };
  };
}
