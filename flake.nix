{
  description = "A flake for working with YAML files inside Nix";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }@inputs:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      yamlLib = import ./modules/lib.nix { inherit pkgs; };
    in { lib = yamlLib; };
}
