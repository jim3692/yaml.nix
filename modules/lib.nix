{ pkgs }:

let
  fromYaml = import ./convert.nix {
    inherit pkgs;
    command = "${pkgs.yq-go}/bin/yq -p yaml -o json -I0 -M $file";
  };

  toYaml = import ./convert.nix {
    inherit pkgs;
    command = "${pkgs.yq-go}/bin/yq -p json -o yaml $file";
  };

in {
  fromYaml = file: builtins.fromJSON (builtins.readFile (fromYaml file));
  toYaml = attrSet: toYaml (builtins.toFile "input" (builtins.toJSON attrSet));
}
