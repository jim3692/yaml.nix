# YAML Support for Nix

Since Nix does not officially support YAML yet (https://github.com/NixOS/nix/pull/7340), I created this flake which runs `yq` for conversions between JSON and YAML.

Such a solution is not ideal to be merged to nixpkgs, as it's based on the concept of [IFD](https://nix.dev/manual/nix/2.22/language/import-from-derivation).

# Installation

In `flake.nix`:
```nix
{
  inputs = {
    # ...
    yaml.url = "github:jim3692/yaml.nix";
  };

  outputs = { yaml, ... }: {
    specialArgs = {
      lib = nixpkgs.lib.extend (
        final: prev: { yaml = yaml.lib; }
      );
      # ...
    };
    # ...
  };
}
```

# Usage

### `lib.yaml.fromYaml`

`lib.yaml.fromYaml :: path -> set`

**Description:** It takes a YAML file path as parameter and returns the resulting attrSet

### `lib.yaml.toYaml`

`lib.yaml.toYaml :: set -> path`

**Description:** It takes an attrSet as parameter and returns the path of the generated YAML file
