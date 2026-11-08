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

    bsparse = {
      url = "github:VageLO/bsparse";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bsmmex = {
      url = "github:VageLO/bsmmex";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mmex_1_9_2 = {
      url = "github:nixos/nixpkgs/a5cbcfe954791221bfffe2307f7d1a1bf61a871e";
    };
  };

  outputs = {self, nixpkgs, ...}@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";

      pkgs-mmex-repo = import inputs.mmex_1_9_2 {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs = import nixpkgs {
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "firefox-esr-140-bin-unwrapped-140.17.0esr"
          ];
        };
        overlays = [
          (final: prev: {
            bsparse = inputs.bsparse.packages.${system}.default;
            bsmmex = inputs.bsmmex.packages.${system}.default;
            mmex = pkgs-mmex-repo.mmex;
          })
        ];
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
      };
    };
}
