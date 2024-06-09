{
  description = "Home Manager configuration of vagelo";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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

      pkgs = import nixpkgs {
        config = { allowUnfree = true; };
        inherit system;
      };

      unstable = import nixpkgs-unstable {
        config = { allowUnfree = true; };
        inherit system;
      };

      lib = nixpkgs.lib;
    in {

      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit pkgs;
          specialArgs = {inherit unstable inputs outputs;};
          modules = [ ./system ];
        };
      };

      homeConfigurations = {
        vagelo = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit unstable inputs outputs;};
          modules = [ ./home.nix ];
        };
      };
    };
}
