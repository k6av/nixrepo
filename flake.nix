{
  description = "Repository of Nix packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system} = builtins.mapAttrs
      (pkg: _: import ./pkgs/${pkg} { inherit system; inherit pkgs; } )
      (builtins.readDir ./pkgs);
  };
}
 
