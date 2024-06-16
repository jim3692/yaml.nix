{ pkgs, command }:
inputText:
derivation {
  name = "yaml-convert";
  builder = "${pkgs.bash}/bin/bash";
  args = [ "-c" "file=${builtins.toFile "input" inputText} ${command} >$out" ];
  system = builtins.currentSystem;
}
