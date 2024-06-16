{
  description = "A flake for working with YAML files inside Nix";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/unstable"; };

  outputs = { nixpkgs, ... }@inputs: {
    nixosModules = { lib = import ./modules/lib.nix { pkgs = nixpkgs; }; };
  };
}
