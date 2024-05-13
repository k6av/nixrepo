{
  description = "Repository of Nix packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; overlays = [ rust-overlay.overlays.default ]; };
  in {
    packages.${system} = builtins.mapAttrs
      (pkg: _: import ./pkgs/${pkg} { inherit system; inherit pkgs; inherit inputs; } )
      (builtins.readDir ./pkgs);
  };
}
 
