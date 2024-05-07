{
  description = "Home Manager configuration of vagelo";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { 
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ... 
  } @inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system;};
      unstable = import nixpkgs-unstable {inherit system;};
      lib = nixpkgs.lib;
    in {

      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [ ./system ];
        };
      };

      homeConfigurations = {
        vagelo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit unstable inputs outputs;};
          modules = [ ./configuration.nix ];
        };
      };
    };
}
