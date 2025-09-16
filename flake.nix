{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    #emacs-overlay = {
    #  url = "github:nix-community/emacs-overlay";
    #};
  };

  outputs = {self, nixpkgs, ...}@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        config = { allowUnfree = true; };
        #overlays = [ inputs.emacs-overlay.overlay ];
        inherit system;
      };
    in {

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
            inherit pkgs;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.vagelo = import ./hosts/laptop/home.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "vagelo@lp" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/laptop/home.nix ];
        };
        "vagelo@ess" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/essential/home.nix ];
        };
      };
    };
}
