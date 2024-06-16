{ pkgs }:

let
  fromYaml = import ./convert.nix {
    inherit pkgs;
    command = "${pkgs.yq-go}/bin/yq -p yaml -o json $file";
  };

  toYaml = import ./convert.nix {
    inherit pkgs;
    command = "${pkgs.yq-go}/bin/yq -p json -o yaml $file";
  };

in {
  fromYaml = file: fromYaml (builtins.fromJSON (builtins.readFile file));
  toYaml = attrSet: toYaml (builtins.toJSON attrSet);
}
