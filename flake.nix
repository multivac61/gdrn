{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, nixos-hardware }: rec {
    nixosConfigurations = rec {
      gdrn = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

          disko.nixosModules.disko
          (import ./disk.nix { })

          nixos-hardware.nixosModules.common-cpu-amd
          nixos-hardware.nixosModules.common-cpu-amd-pstate
          nixos-hardware.nixosModules.common-gpu-amd
          nixos-hardware.nixosModules.common-hidpi
          nixos-hardware.nixosModules.common-pc
          nixos-hardware.nixosModules.common-pc-ssd
          "${nixpkgs}/nixos/modules/profiles/minimal.nix"
          ./configuration.nix
          ./base.nix
        ];
      };
    };
  };
}

