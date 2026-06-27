{
  description = "A very basic flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let
    system = "x86_64-linux";
  in
    {

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
	  inherit system;
          modules = [
          ./nixos/configuration.nix
          ];

        };
      };
      homeConfigurations.tristin = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
	modules = [./home.nix];
      };
    };
}
