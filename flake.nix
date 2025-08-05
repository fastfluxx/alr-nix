{
  description = "Config for alr-nix";

  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    #home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };


  outputs = { 
    self, 
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    inherit (self) outputs;
  
  in {
    # NixOS system config
    nixosConfigurations = {
      alr-home = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./alr-home/nixos/configuration.nix
          ./alr-home/nixos/hardware-configuration.nix
        ];
      };

      alr-work = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./alr-work/nixos/configuration.nix
          ./alr-work/nixos/hardware-configuration.nix
        ];
      };
    };

    # Home manager config
    homeConfigurations = {
      "alr-home" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./alr-home/home-manager/home.nix
        ];
      };

      "alr-work" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./alr-work/home-manager/home.nix
        ];
      };

    };

  };

}
