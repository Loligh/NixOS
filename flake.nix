{
  description = "System Config";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    finalmouse = {
      url = "github:Loligh/finalmouse-nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs-unstable,
      nixpkgs-stable,
      ...
    }:
    {
      nixosConfigurations = {
        PC = nixpkgs-unstable.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/PC.nix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
        server = nixpkgs-stable.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/Server.nix
            /etc/nixos/hardware-configuration.nix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
